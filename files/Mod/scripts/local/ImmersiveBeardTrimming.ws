enum IBT_EReturnStatus
{
	IBT_RS_Success,
	IBT_RS_Fail,
	IBT_RS_Exception
}




function IBT_GetGeraltBeardStage( headName: name ) : int
{
	switch( headName )
	{
		case 'head_0':
		case 'head_0_tattoo':
		case 'head_0_mark':
		case 'head_0_mark_tattoo':
			return 0;
		case 'head_1':
		case 'head_1_tattoo':
		case 'head_1_mark':
		case 'head_1_mark_tattoo':
			return 1;
		case 'head_2':
		case 'head_2_tattoo':
		case 'head_2_mark':
		case 'head_2_mark_tattoo':
			return 2;
		case 'head_3':
		case 'head_3_tattoo':
		case 'head_3_mark':
		case 'head_3_mark_tattoo':
			return 3;
		case 'head_4':
		case 'head_4_tattoo':
		case 'head_4_mark':
		case 'head_4_mark_tattoo':
			return 4;
		default:
			return -1;
	}
}

function IBT_IsDLC2VanillaBeard( headName: name ) : bool
{
	switch( headName )
	{
		case 'head_5':
		case 'head_5_tattoo':
		case 'head_5_mark':
		case 'head_5_mark_tattoo':
		case 'head_6':
		case 'head_6_tattoo':
		case 'head_6_mark':
		case 'head_6_mark_tattoo':
		case 'head_7':
		case 'head_7_tattoo':
		case 'head_7_mark':
		case 'head_7_mark_tattoo':
			return true;
		default:
			return false;
	}
}





struct IBT_SGeraltHead
{
	var isCustom	: bool;
	var headName	: name;
	var beardStage	: int;
}

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
		head.beardStage = IBT_GetGeraltBeardStage( head.headName );
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

function IBT_TrimGeraltBeard() : IBT_EReturnStatus
{
	var head		: IBT_SGeraltHead;
	var ret			: IBT_EReturnStatus;

	head = IBT_GetGeraltHead();

	if( head.isCustom )
	{
		if( IBT_IsDLC2VanillaBeard( head.headName ) )
		{
			// FIXME for now just default to clean shaved
			head.isCustom = false;
			head.beardStage = 0;
			ret = IBT_RS_Success;
		}
		else
		{
			ret = IBT_RS_Exception;
		}
	}
	else if( head.beardStage > 0 )
	{
		head.beardStage -= 1;
		ret = IBT_RS_Success;
	}
	else if( head.beardStage == 0 )
	{
		// geralt is clean shaved and can't be shaved any more
		ret = IBT_RS_Fail;
	}
	else
	{
		ret = IBT_RS_Exception;
	}

	if( ret == IBT_RS_Success )
		IBT_SetGeraltHead( head );
	
	return ret;
}

function IBT_GrowGeraltBeard() : IBT_EReturnStatus
{
	var head		: IBT_SGeraltHead;
	var ret			: IBT_EReturnStatus;

	head = IBT_GetGeraltHead();

	if( head.isCustom )
	{
		if( IBT_IsDLC2VanillaBeard( head.headName ) )
		{
			// FIXME for now default to full beard
			head.isCustom = false;
			head.beardStage = 4;
			ret = IBT_RS_Success;
		}
		else
		{
			ret = IBT_RS_Exception;
		}
	}
	else if( head.beardStage >= 0 && head.beardStage < 4 )
	{
		head.beardStage += 1;
		ret = IBT_RS_Success;
	}
	else if( head.beardStage == 4 )
	{
		// beard is at full stage and can't grow any more
		ret = IBT_RS_Fail;
	}
	else
	{
		ret = IBT_RS_Exception;
	}

	if( ret == IBT_RS_Success )
		IBT_SetGeraltHead( head );

	return ret;
}







enum IBT_EHairType
{
	IBT_HT_Unknown		= 0,
	IBT_HT_ShortTied	= 1,
	IBT_HT_ShortUntied	= 2,
	IBT_HT_LongTied		= 3,
	IBT_HT_LongUntied	= 4
}

function IBT_HairNameToType( hairName : name ) : IBT_EHairType
{
	switch( hairName )
	{
		case 'Mohawk With Ponytail Hairstyle':
		case 'Shaved With Tail Hairstyle':
			return IBT_HT_ShortTied;
		case 'Short Loose Hairstyle':
		case 'Nilfgaardian Hairstyle':
			return IBT_HT_ShortUntied;
		case 'Half With Tail Hairstyle':
			return IBT_HT_LongTied;
		case 'Long Loose Hairstyle':
			return IBT_HT_LongUntied;
		default:
			return IBT_HT_Unknown;
	}
}

function IBT_HairTypeToName( hairType : IBT_EHairType ) : name
{
	switch( hairType )
	{
		case IBT_HT_ShortTied:
			return IBT_Menu_ShortTiedHairName();
		case IBT_HT_ShortUntied:
			return IBT_Menu_ShortUntiedHairName();
		case IBT_HT_LongTied:
			return 'Half With Tail Hairstyle';
		case IBT_HT_LongUntied:
			return 'Long Loose Hairstyle';
		default:
			return '';
	}
}

function IBT_GetGeraltHairType() : IBT_EHairType
{
	var inv 		: CInventoryComponent;
	var ids			: array<SItemUniqueId>;
	var i			: int;
	var size		: int;
	var hairType	: IBT_EHairType;
	var hairName	: name;

	inv = GetWitcherPlayer().GetInventory();
	ids = inv.GetItemsByCategory( 'hair' );
	size = ids.Size();
	hairType = IBT_HT_Unknown;

	if( size > 0 )
	{
		for(i = 0; i < size; i += 1)
		{
			if( inv.IsItemMounted( ids[i] ) )
			{
				hairName = inv.GetItemName( ids[i] );
				hairType = IBT_HairNameToType( hairName );
				break;
			}
		}
	}

	return hairType;
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

function IBT_CutGeraltHair() : IBT_EReturnStatus
{
	var hairType	: IBT_EHairType;
	var hairName	: name;

	hairType = IBT_GetGeraltHairType();
	if( hairType == IBT_HT_LongTied || hairType == IBT_HT_LongUntied )
	{
		hairName = IBT_HairTypeToName( hairType - 2 );
		IBT_EquipGeraltHair( hairName );
		return IBT_RS_Success;
	}
	else if( hairType == IBT_HT_Unknown )
	{
		return IBT_RS_Exception;
	}
	else
	{
		return IBT_RS_Fail;
	}
}

function IBT_GrowGeraltHair() : IBT_EReturnStatus
{
	var hairType	: IBT_EHairType;
	var hairName	: name;

	hairType = IBT_GetGeraltHairType();
	if( hairType == IBT_HT_ShortTied || hairType == IBT_HT_ShortUntied )
	{
		hairName = IBT_HairTypeToName( hairType + 2 );
		IBT_EquipGeraltHair( hairName );
		return IBT_RS_Success;
	}
	else if( hairType == IBT_HT_Unknown )
	{
		return IBT_RS_Exception;
	}
	else
	{
		return IBT_RS_Fail;
	}
}

function IBT_TieGeraltHair() : IBT_EReturnStatus
{
	var hairType	: IBT_EHairType;
	var hairName	: name;

	hairType = IBT_GetGeraltHairType();
	if( hairType == IBT_HT_ShortUntied || hairType == IBT_HT_LongUntied )
	{
		hairName = IBT_HairTypeToName( hairType - 1 );
		IBT_EquipGeraltHair( hairName );
		return IBT_RS_Success;
	}
	else if( hairType == IBT_HT_Unknown )
	{
		return IBT_RS_Exception;
	}
	else
	{
		return IBT_RS_Fail;
	}
}

function IBT_UntieGeraltHair() : IBT_EReturnStatus
{
	var hairType	: IBT_EHairType;
	var hairName	: name;

	hairType = IBT_GetGeraltHairType();
	if( hairType == IBT_HT_ShortTied || hairType == IBT_HT_LongTied )
	{
		hairName = IBT_HairTypeToName( hairType + 1 );
		IBT_EquipGeraltHair( hairName );
		return IBT_RS_Success;
	}
	else if( hairType == IBT_HT_Unknown )
	{
		return IBT_RS_Exception;
	}
	else
	{
		return IBT_RS_Fail;
	}
}






enum IBT_EScissorsMode
{
	IBT_SM_Beard	= 0,
	IBT_SM_Hair		= 1
}

function IBT_UseScissors( mode: IBT_EScissorsMode )
{
	var ret			: IBT_EReturnStatus;
	var notifString	: string;

	if (thePlayer.IsInCombat())
	{
		notifString = GetLocStringByKeyExt( "menu_cannot_perform_action_combat" );
		ret = IBT_RS_Fail;
	}
	else
	{
		if( mode == IBT_SM_Beard )
		{
			ret = IBT_TrimGeraltBeard();
			if( ret == IBT_RS_Success )
				notifString = GetLocStringByKeyExt( "ibt_notif_used_scissors_beard_success" );
			else if( ret == IBT_RS_Fail )
				notifString = GetLocStringByKeyExt( "ibt_notif_used_scissors_beard_failure" );
		}
		else
		{
			ret = IBT_CutGeraltHair();
			if( ret == IBT_RS_Success )
				notifString = GetLocStringByKeyExt( "ibt_notif_used_scissors_hair_success" );
			else if( ret == IBT_RS_Fail )
				notifString = GetLocStringByKeyExt( "ibt_notif_used_scissors_hair_failure" );
		}
	}

	if( ret == IBT_RS_Success )
	{
		theSound.SoundEvent("gui_inventory_other_attach");
	}
	else if( ret == IBT_RS_Fail )
	{
		theSound.SoundEvent("gui_global_denied");
	}
	else
	{
		theSound.SoundEvent("gui_ingame_low_stamina_warning");
		notifString = GetLocStringByKeyExt( "ibt_notif_exception" ); //TODO update strings
	}

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
	{
		modeDesc += GetLocStringByKeyExt("item_desc_ibt_scissors_mode_beard");
	}
	else
	{
		modeDesc += GetLocStringByKeyExt("item_desc_ibt_scissors_mode_hair");
	}
	modeDesc += "]</font>";

	return modeDesc;
}




function IBT_OnEquipHairTie()
{
	var ret 		: IBT_EReturnStatus;
	var notifString	: string;

	ret = IBT_TieGeraltHair();

	if( ret == IBT_RS_Success )
	{
		notifString = GetLocStringByKeyExt( "ibt_notif_equipped_hairtie_success" ); //TODO update strings
	}
	else if( ret == IBT_RS_Fail )
	{
		notifString = GetLocStringByKeyExt( "ibt_notif_equipped_hairtie_failure" ); //TODO update strings
	}
	else
	{
		notifString = GetLocStringByKeyExt( "ibt_notif_exception" ); //TODO update strings
		theSound.SoundEvent("gui_ingame_low_stamina_warning");
	}
	
	theGame.GetGuiManager().ShowNotification( notifString );
}

function IBT_OnUnequipHairTie()
{
	var ret 		: IBT_EReturnStatus;
	var notifString	: string;

	ret = IBT_UntieGeraltHair();

	if( ret == IBT_RS_Success )
	{
		notifString = GetLocStringByKeyExt( "ibt_notif_unequipped_hairtie_success" ); //TODO update strings
	}
	else if( ret == IBT_RS_Fail )
	{
		notifString = GetLocStringByKeyExt( "ibt_notif_unequipped_hairtie_failure" ); //TODO update strings
	}
	else
	{
		notifString = GetLocStringByKeyExt( "ibt_notif_exception" ); //TODO update strings
		theSound.SoundEvent("gui_ingame_low_stamina_warning");
	}
	
	theGame.GetGuiManager().ShowNotification( notifString ); 
}





function IBT_ConsumeTonicBeard( item: SItemUniqueId, inv: CInventoryComponent ) : bool
{
	var ret				: IBT_EReturnStatus;
	var notifString		: string;
	var menu			: CR4InventoryMenu;
	var wasItemRemoved	: bool;

	if (thePlayer.IsInCombat())
	{
		notifString = GetLocStringByKeyExt("menu_cannot_perform_action_combat");
		ret = IBT_RS_Fail;
	}
	else
	{
		ret = IBT_GrowGeraltBeard();
		if( ret == IBT_RS_Success )
			notifString = GetLocStringByKeyExt("ibt_notif_drank_tonic_beard_success");
		else if( ret == IBT_RS_Fail )
			notifString = GetLocStringByKeyExt("ibt_notif_drank_tonic_beard_failure");
	}


	wasItemRemoved = false;

	if( ret == IBT_RS_Success )
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
	else if( ret == IBT_RS_Fail )
	{
		theSound.SoundEvent("gui_global_denied");	
	}
	else
	{
		theSound.SoundEvent("gui_ingame_low_stamina_warning");
		notifString = GetLocStringByKeyExt( "ibt_notif_exception" ); //TODO update strings
	}

	theGame.GetGuiManager().ShowNotification( notifString );

	return wasItemRemoved;
}

function IBT_ConsumeTonicHair( item: SItemUniqueId, inv: CInventoryComponent ) : bool
{
	var ret				: IBT_EReturnStatus;
	var notifString		: string;
	var menu			: CR4InventoryMenu;
	var wasItemRemoved	: bool;

	if (thePlayer.IsInCombat())
	{
		notifString = GetLocStringByKeyExt("menu_cannot_perform_action_combat");
		ret = IBT_RS_Fail;
	}
	else
	{
		ret = IBT_GrowGeraltHair();
		if( ret == IBT_RS_Success )
			notifString = GetLocStringByKeyExt("ibt_notif_drank_tonic_hair_success");
		else if( ret == IBT_RS_Fail )
			notifString = GetLocStringByKeyExt("ibt_notif_drank_tonic_hair_failure");
	}


	wasItemRemoved = false;

	if( ret == IBT_RS_Success )
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
	else if( ret == IBT_RS_Fail )
	{
		theSound.SoundEvent("gui_global_denied");	
	}
	else
	{
		theSound.SoundEvent("gui_ingame_low_stamina_warning");
		notifString = GetLocStringByKeyExt( "ibt_notif_exception" ); //TODO update strings
	}

	theGame.GetGuiManager().ShowNotification( notifString );

	return wasItemRemoved;
}