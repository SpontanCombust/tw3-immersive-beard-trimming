function IBT_GetGeraltHead() : IBT_SGeraltHead
{
	var head 		: IBT_SGeraltHead;
	var components	: array< CComponent >;
	var headManager	: CHeadManagerComponent;

	// First check the remembered custom head in thePlayer
	// If the name is not empty it means Geralt has non-growable beard
	// otherwise he has a regular beard and its name is this time in the head manager component.
	// Head manager component does not store the name of a custom head.

	head.headName = thePlayer.GetRememberedCustomHead();

	if( !IsNameValid( head.headName ) )
	{
		head.isCustom = false;
		
		components = thePlayer.GetComponentsByClassName( 'CHeadManagerComponent' );
		headManager = ( (CHeadManagerComponent)components[0] );

		head.headName = headManager.GetCurHeadName();
		head.beardStage = IBT_HeadNameToBeardStage( head.headName );
	}
	else
	{
		head.isCustom = true;
		head.beardStage = -1;
	}

	return head;
}

function IBT_SetGeraltHead( head : IBT_SGeraltHead )
{
	var components	: array< CComponent >;
	var headManager	: CHeadManagerComponent;
	
	components = thePlayer.GetComponentsByClassName( 'CHeadManagerComponent' );
	headManager = ( (CHeadManagerComponent)components[0] );

	if( head.isCustom )
	{
		headManager.SetCustomHead( head.headName );
		headManager.BlockGrowing( true );
		thePlayer.RememberCustomHead( head.headName );
	}
	else
	{
		headManager.RemoveCustomHead();
		headManager.SetBeardStage( false, head.beardStage );
		headManager.BlockGrowing( false );
		thePlayer.ClearRememberedCustomHead();
	}
}

function IBT_TrimGeraltBeard() : bool
{
	var head	: IBT_SGeraltHead;
	var ret		: bool;
	var beh		: IBT_ECustomBeardBehaviour;

	head = IBT_GetGeraltHead();

	if( head.isCustom )
	{
		beh = IBT_Config_CustomBeardTrimBehaviour();

		if( beh == IBT_CBB_DoNothing )
		{
			// if we're supposed to do nothing then just return with true right away and pretend everything is nice and dandy
			return true;
		}

		// ...otherwise continue on with changing the beard
		head.isCustom = false;
		head.beardStage = (int)beh - 1; // -1 to adjust for offset of enum values compared to beard stages
		ret = true;
	}
	else if( head.beardStage > 0 )
	{
		head.isCustom = false;
		head.beardStage -= 1;
		ret = true;
	}
	else
	{
		// geralt is clean shaved and can't be shaved any more
		ret = false;
	}

	if( ret )
		IBT_SetGeraltHead( head );
	
	return ret;
}

function IBT_GrowGeraltBeard() : bool
{
	var head	: IBT_SGeraltHead;
	var ret		: bool;
	var beh		: IBT_ECustomBeardBehaviour;

	head = IBT_GetGeraltHead();

	if( head.isCustom )
	{
		beh = IBT_Config_CustomBeardGrowBehaviour();

		if( beh == IBT_CBB_DoNothing )
		{
			return true;
		}

		head.isCustom = false;
		head.beardStage = (int)beh - 1; // -1 to adjust for offset of enum values compared to beard stages
		ret = true;
	}
	else if( head.beardStage >= 0 && head.beardStage < 4 )
	{
		head.beardStage += 1;
		ret = true;
	}
	else
	{
		// beard is at full stage and can't grow any more
		ret = false;
	}

	if( ret )
		IBT_SetGeraltHead( head );

	return ret;
}







function IBT_GetGeraltHairClass() : IBT_EHairClass
{
	var inv 		: CInventoryComponent;
	var ids			: array<SItemUniqueId>;
	var i			: int;
	var size		: int;
	var hairClass	: IBT_EHairClass;
	var hairName	: name;

	inv = GetWitcherPlayer().GetInventory();
	ids = inv.GetItemsByCategory( 'hair' );
	size = ids.Size();
	hairClass = IBT_HC_Unknown;

	if( size > 0 )
	{
		for(i = 0; i < size; i += 1)
		{
			if( inv.IsItemMounted( ids[i] ) )
			{
				hairName = inv.GetItemName( ids[i] );
				hairClass = IBT_Config_HairNameToHairClass( hairName );
				break;
			}
		}
	}

	return hairClass;
}

function IBT_EquipGeraltHair( hairName : name )
{
	var inv 		: CInventoryComponent;
	var ids			: array<SItemUniqueId>;
	var i			: int;
	var size		: int;

	inv = GetWitcherPlayer().GetInventory();
	ids = inv.GetItemsByCategory( 'hair' );
	size = ids.Size();

	// first clean up all hair items that are in inventory...
	if( size > 0 )
	{
		for( i = 0; i < size; i+=1 )
		{
			inv.RemoveItem( ids[i], 1 );
		}
	}

	// ... and only then add new hair item and mount it onto player model
	ids = inv.AddAnItem( hairName );
	inv.MountItem(ids[0]);
}

function IBT_IsTiedHairClass( hc: IBT_EHairClass ) : bool
{
	return ( hc == IBT_HC_Stage1Tied || hc == IBT_HC_Stage2Tied || hc == IBT_HC_Stage3Tied );
}

function IBT_IsLooseHairClass( hc: IBT_EHairClass ) : bool
{
	return ( hc == IBT_HC_Stage1Loose || hc == IBT_HC_Stage2Loose || hc == IBT_HC_Stage3Loose );
}

function IBT_HairClassStageNum( hc: IBT_EHairClass ) : int
{
	switch( hc )
	{
		case IBT_HC_Stage1Loose:
		case IBT_HC_Stage1Tied:
			return 1;
		case IBT_HC_Stage2Loose:
		case IBT_HC_Stage2Tied:
			return 2;
		case IBT_HC_Stage3Loose:
		case IBT_HC_Stage3Tied:
			return 3;
		default:
			return -1;
	}
}

function IBT_IsDLC2ImprovedHairstyle( hs: IBT_EHairStyle ) : bool
{
	if( hs > IBT_HS_Nilfgaardian )
	{
		return true;
	}

	return false;
}

function IBT_CutGeraltHair() : bool
{
	var hairClass	: IBT_EHairClass;
	var hairStyle	: IBT_EHairStyle;
	var hairName	: name;

	hairClass = IBT_GetGeraltHairClass();
	if( hairClass != IBT_HC_Unknown && IBT_HairClassStageNum( hairClass ) > 1 )
	{
		hairStyle = IBT_Config_HairClassToHairStyle( hairClass - 2 );

		if( IBT_IsDLC2ImprovedHairstyle( hairStyle ) && !IBT_IsDLC2ImprovedModInstalled() )
		{
			return false;
		}

		hairName = IBT_HairstyleEnumToName( hairStyle );
		IBT_EquipGeraltHair( hairName );
		return true;
	}

	return false;
}

function IBT_GrowGeraltHair() : bool
{
	var hairClass	: IBT_EHairClass;
	var hairStyle	: IBT_EHairStyle;
	var hairName	: name;

	hairClass = IBT_GetGeraltHairClass();
	if( hairClass != IBT_HC_Unknown && IBT_HairClassStageNum( hairClass ) < 3 )
	{
		hairStyle = IBT_Config_HairClassToHairStyle( hairClass + 2 );

		if( IBT_IsDLC2ImprovedHairstyle( hairStyle ) && !IBT_IsDLC2ImprovedModInstalled() )
		{
			return false;
		}

		hairName = IBT_HairstyleEnumToName( hairStyle );
		IBT_EquipGeraltHair( hairName );
		return true;
	}
	
	return false;
}

function IBT_TieGeraltHair() : bool
{
	var hairClass	: IBT_EHairClass;
	var hairStyle	: IBT_EHairStyle;
	var hairName	: name;

	hairClass = IBT_GetGeraltHairClass();
	if( IBT_IsLooseHairClass( hairClass ) )
	{
		hairStyle = IBT_Config_HairClassToHairStyle( hairClass + 1 );

		if( IBT_IsDLC2ImprovedHairstyle( hairStyle ) && !IBT_IsDLC2ImprovedModInstalled() )
		{
			return false;
		}

		hairName = IBT_HairstyleEnumToName( hairStyle );
		IBT_EquipGeraltHair( hairName );
		return true;
	}
	
	return false;
}

function IBT_UntieGeraltHair() : bool
{
	var hairClass	: IBT_EHairClass;
	var hairStyle	: IBT_EHairStyle;
	var hairName	: name;

	hairClass = IBT_GetGeraltHairClass();
	if( IBT_IsTiedHairClass( hairClass ) )
	{
		hairStyle = IBT_Config_HairClassToHairStyle( hairClass - 1 );

		if( IBT_IsDLC2ImprovedHairstyle( hairStyle ) && !IBT_IsDLC2ImprovedModInstalled() )
		{
			return false;
		}

		hairName = IBT_HairstyleEnumToName( hairStyle );
		IBT_EquipGeraltHair( hairName );
		return true;
	}
	
	return false;
}







function IBT_UseScissors( mode: IBT_EScissorsMode )
{
	var ret			: bool;
	var notifString	: string;

	if( IBT_Config_BlockActionsDuringCombat() && thePlayer.IsInCombat() )
	{
		notifString = GetLocStringByKeyExt( "menu_cannot_perform_action_combat" );
		ret = false;
	}
	else
	{
		if( mode == IBT_SM_Beard )
		{
			ret = IBT_TrimGeraltBeard();
			if( ret )
				notifString = GetLocStringByKeyExt( "ibt_notif_used_scissors_beard_success" );
			else
				notifString = GetLocStringByKeyExt( "ibt_notif_used_scissors_beard_failure" );
		}
		else
		{
			ret = IBT_CutGeraltHair();
			if( ret )
				notifString = GetLocStringByKeyExt( "ibt_notif_used_scissors_hair_success" );
			else
				notifString = GetLocStringByKeyExt( "ibt_notif_used_scissors_hair_failure" );
		}
	}

	if( ret )
		theSound.SoundEvent("gui_inventory_other_attach");
	else
		theSound.SoundEvent("gui_global_denied");

	if( IBT_Config_ShowNotifications() )
		theGame.GetGuiManager().ShowNotification( notifString );
}

function IBT_GetScissorsMode( item: SItemUniqueId, inv: CInventoryComponent ) : IBT_EScissorsMode
{
	return (IBT_EScissorsMode)inv.GetItemModifierInt( item, 'ibt_scissors_mode', (int)IBT_SM_Beard );
}

function IBT_ChangeScissorsMode( item: SItemUniqueId, inv: CInventoryComponent )
{
	var mode	: IBT_EScissorsMode;

	mode = (IBT_EScissorsMode)inv.GetItemModifierInt( item, 'ibt_scissors_mode', (int)IBT_SM_Beard );

	if( mode == IBT_SM_Beard )
	{
		inv.SetItemModifierInt( item, 'ibt_scissors_mode', (int)IBT_SM_Hair );
	}
	else
	{
		inv.SetItemModifierInt( item, 'ibt_scissors_mode', (int)IBT_SM_Beard );
	}

	theSound.SoundEvent("gui_inventory_other_back");
}

function IBT_GetScissorsTooltipModeDescription( item: SItemUniqueId, inv: CInventoryComponent ) : string
{
	var mode		: IBT_EScissorsMode;
	var modeDesc	: string;

	mode = IBT_GetScissorsMode( item, inv );

	modeDesc = "<font color=\"#C6A534\">" + GetLocStringByKeyExt("item_desc_ibt_scissors_mode_preamble") + ":</font> ";

	modeDesc += "<font color=\"#00FF00\">[";
	if( mode == IBT_SM_Beard )
		modeDesc += GetLocStringByKeyExt("item_desc_ibt_scissors_mode_beard");
	else
		modeDesc += GetLocStringByKeyExt("item_desc_ibt_scissors_mode_hair");

	modeDesc += "]</font>";

	return modeDesc;
}




function IBT_OnEquipHairTie()
{
	var ret 		: bool;
	var notifString	: string;

	ret = IBT_TieGeraltHair();

	if( ret )
		notifString = GetLocStringByKeyExt( "ibt_notif_equipped_hairtie_success" );
	else
		notifString = GetLocStringByKeyExt( "ibt_notif_equipped_hairtie_failure" );
	
	if( IBT_Config_ShowNotifications() )
		theGame.GetGuiManager().ShowNotification( notifString );
}

function IBT_OnUnequipHairTie()
{
	var ret 		: bool;
	var notifString	: string;

	ret = IBT_UntieGeraltHair();

	if( ret )
		notifString = GetLocStringByKeyExt( "ibt_notif_unequipped_hairtie_success" );
	else
		notifString = GetLocStringByKeyExt( "ibt_notif_unequipped_hairtie_failure" );
	
	if( IBT_Config_ShowNotifications() )
		theGame.GetGuiManager().ShowNotification( notifString ); 
}





function IBT_ConsumeTonicBeard( item: SItemUniqueId, inv: CInventoryComponent ) : bool
{
	var ret				: bool;
	var notifString		: string;
	var menu			: CR4InventoryMenu;
	var wasItemRemoved	: bool;

	if( IBT_Config_BlockActionsDuringCombat() && thePlayer.IsInCombat() )
	{
		notifString = GetLocStringByKeyExt("menu_cannot_perform_action_combat");
		ret = false;
	}
	else
	{
		ret = IBT_GrowGeraltBeard();
		if( ret )
			notifString = GetLocStringByKeyExt("ibt_notif_drank_tonic_beard_success");
		else
			notifString = GetLocStringByKeyExt("ibt_notif_drank_tonic_beard_failure");
	}


	wasItemRemoved = false;

	if( ret || !IBT_Config_BlockUnnecessaryTonicConsumption() )
	{
		theSound.SoundEvent("gui_inventory_drink");

		menu = (CR4InventoryMenu) ((CR4MenuBase)theGame.GetGuiManager().GetRootMenu()).GetLastChild();
		// update invenotry menu peperdoll if we're currently in the inventory menu
		if( menu )
		{
			menu.UpdateAllItemData();
		}

		wasItemRemoved = inv.RemoveItem( item, 1 );
	}
	else
	{
		theSound.SoundEvent("gui_global_denied");	
	}

	if( IBT_Config_ShowNotifications() )
		theGame.GetGuiManager().ShowNotification( notifString );

	return wasItemRemoved;
}

function IBT_ConsumeTonicHair( item: SItemUniqueId, inv: CInventoryComponent ) : bool
{
	var ret				: bool;
	var notifString		: string;
	var menu			: CR4InventoryMenu;
	var wasItemRemoved	: bool;

	if( IBT_Config_BlockActionsDuringCombat() && thePlayer.IsInCombat() )
	{
		notifString = GetLocStringByKeyExt("menu_cannot_perform_action_combat");
		ret = false;
	}
	else
	{
		ret = IBT_GrowGeraltHair();
		if( ret )
			notifString = GetLocStringByKeyExt("ibt_notif_drank_tonic_hair_success");
		else
			notifString = GetLocStringByKeyExt("ibt_notif_drank_tonic_hair_failure");
	}


	wasItemRemoved = false;

	if( ret || !IBT_Config_BlockUnnecessaryTonicConsumption() )
	{
		theSound.SoundEvent("gui_inventory_drink");

		menu = (CR4InventoryMenu) ((CR4MenuBase)theGame.GetGuiManager().GetRootMenu()).GetLastChild();
		// update invenotry menu peperdoll if we're currently in the inventory menu
		if( menu )
		{
			menu.UpdateAllItemData();
		}

		wasItemRemoved = inv.RemoveItem( item, 1 );
	}
	else
	{
		theSound.SoundEvent("gui_global_denied");	
	}

	if( IBT_Config_ShowNotifications() )
		theGame.GetGuiManager().ShowNotification( notifString );

	return wasItemRemoved;
}