function IBT_IsDLCBeard() : bool
{
	var customHead	: name;

	// keep in mind that it will work properly only if when setting head beforehand it was also remembered in thePlayer
	// if it was done through an actual in-game barber, it will work 100%
	customHead = thePlayer.GetRememberedCustomHead();

	return IsNameValid( customHead );
}

function IBT_GetGeraltBeardStage() : int
{
	var components	: array< CComponent >;
	var headManager	: CHeadManagerComponent;
	var curHead		: name;
	var stage		: int;
	
	components = thePlayer.GetComponentsByClassName( 'CHeadManagerComponent' );
	headManager = ( ( CHeadManagerComponent ) components[0] );
	curHead = headManager.GetCurHeadName();

	switch( curHead )
	{
		case 'head_0':
		case 'head_0_tattoo':
		case 'head_0_mark':
		case 'head_0_mark_tattoo':
			stage = 0;
			break;
		case 'head_1':
		case 'head_1_tattoo':
		case 'head_1_mark':
		case 'head_1_mark_tattoo':
			stage = 1;
			break;
		case 'head_2':
		case 'head_2_tattoo':
		case 'head_2_mark':
		case 'head_2_mark_tattoo':
			stage = 2;
			break;
		case 'head_3':
		case 'head_3_tattoo':
		case 'head_3_mark':
		case 'head_3_mark_tattoo':
			stage = 3;
			break;
		case 'head_4':
		case 'head_4_tattoo':
		case 'head_4_mark':
		case 'head_4_mark_tattoo':
			stage = 4;
			break;
		default:
			stage = -1;
	}

	return stage;
}

function IBT_TrimGeraltBeard() : bool
{
	var components		: array< CComponent >;
	var headManager		: CHeadManagerComponent;
	var destBeardStage	: int;

	components = thePlayer.GetComponentsByClassName( 'CHeadManagerComponent' );
	headManager = ( ( CHeadManagerComponent ) components[0] );

	if( IBT_IsDLCBeard() )
	{
		destBeardStage = 0;
	}
	else
	{
		destBeardStage = IBT_GetGeraltBeardStage() - 1;
	}

	if( destBeardStage >= 0 )
	{
		thePlayer.ClearRememberedCustomHead();
		headManager.RemoveCustomHead();
		headManager.SetBeardStage( false, destBeardStage );
		headManager.BlockGrowing( false );
		return true;
	}
	else
	{
		return false;
	}
}

function IBT_GrowGeraltBeard() : bool
{
	var components		: array< CComponent >;
	var headManager		: CHeadManagerComponent;
	var destBeardStage	: int;

	components = thePlayer.GetComponentsByClassName( 'CHeadManagerComponent' );
	headManager = ( ( CHeadManagerComponent ) components[0] );

	if( IBT_IsDLCBeard() )
	{
		destBeardStage = 3;
	}
	else
	{
		destBeardStage = IBT_GetGeraltBeardStage() + 1;
	}

	if( destBeardStage >= 1 && destBeardStage <= 4 )
	{
		thePlayer.ClearRememberedCustomHead();
		headManager.RemoveCustomHead();
		headManager.SetBeardStage( false, destBeardStage );
		headManager.BlockGrowing( false );
		return true;
	}
	else
	{
		return false;
	}
}



function IBT_HairstyleToLength(hair: IBT_HairStyle) : IBT_HairLength
{
	var settings: IBT_Settings = GetIBT_Settings();

	switch (hair)
	{
		case IBT_HairStyleHalfWithTail:
			return settings.HairLength.HalfWithTail;
		case IBT_HairStyleShavedWithTail:
			return settings.HairLength.ShavedWithTail;
		case IBT_HairStyleLongLoose:
			return settings.HairLength.LongLoose;
		case IBT_HairStyleShortLoose:
			return settings.HairLength.ShortLoose;
		case IBT_HairStyleMohawkWithPonytail:
			return settings.HairLength.MohawkWithPonytail;
		case IBT_HairStyleNilfgaardian:
			return settings.HairLength.Nilfgaardian;
		default:
			return IBT_HairLengthMedium;
	}
}

function IBT_HairstylesForLength(length: IBT_HairLength) : array<IBT_HairStyle>
{
	var i: int;
	var max: int;
	var h: IBT_HairStyle;
	var hairs: array<IBT_HairStyle>;
	
	max = EnumGetMax('IBT_HairStyle');
	for (i = 0; i <= max; i += 1)
	{
		h = (IBT_HairStyle)i;
		if (IBT_HairstyleToLength(h) == length)
		{
			hairs.PushBack(h);
		}
	}

	return hairs;
}

function IBT_GetGeraltHairstyle() : IBT_HairStyle
{
	var inv 		: CInventoryComponent;
	var ids			: array<SItemUniqueId>;
	var i			: int;
	var size		: int;

	inv = GetWitcherPlayer().GetInventory();
	ids = inv.GetItemsByCategory('hair');
	size = ids.Size();

	if(size > 0)
	{
		for(i = 0; i < size; i += 1)
		{
			if(inv.IsItemMounted(ids[i]))
			{
				return IBT_HairStyleNameToEnum(inv.GetItemName(ids[i]));
			}
		}
	}

	LogChannel('IBT', "IBT_GetGeraltHairstyle: No hair detected, falling back on IBT_HairStyleHalfWithTail");
	return IBT_HairStyleHalfWithTail;
}

function IBT_EquipHair(hairName : name)
{
	var inv 		: CInventoryComponent;
	var ids			: array<SItemUniqueId>;
	var i			: int;
	var size		: int;

	inv = GetWitcherPlayer().GetInventory();
	ids = inv.GetItemsByCategory('hair');
	size = ids.Size();

	// first clean up all hair items that are in inventory...
	if(size > 0)
	{
		for(i = 0; i < size; i += 1)
		{
			inv.RemoveItem(ids[i], 1);
		}
	}

	// ... and only then add new hair item and mount it onto player model
	ids = inv.AddAnItem( hairName );
	inv.MountItem(ids[0]);
}

function IBT_CutGeraltHair() : bool
{
	//TODO

	return false;
}

function IBT_GrowGeraltHair() : bool
{
	//TODO
	
	return false;
}






enum IBT_EScissorsMode
{
	IBT_SM_Beard	= 0,
	IBT_SM_Hair		= 1
}

function IBT_UseScissors( mode: IBT_EScissorsMode )
{
	var success: bool;

	if (thePlayer.IsInCombat())
	{
		theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("menu_cannot_perform_action_combat") );
		success = false;
	}
	else
	{
		if( mode == IBT_SM_Beard )
		{
			success = IBT_TrimGeraltBeard();
			if( success )
				theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("ibt_notif_used_scissors_beard_success") );
			else
				theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("ibt_notif_used_scissors_beard_failure") );
		}
		else
		{
			success = IBT_CutGeraltHair();
			if( success )
				theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("ibt_notif_used_scissors_hair_success") );
			else
				theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("ibt_notif_used_scissors_hair_failure") );
		}
	}

	if( success )
		theSound.SoundEvent("gui_inventory_other_attach");
	else
		theSound.SoundEvent("gui_global_denied");
}

function IBT_GetScissorsMode( item: SItemUniqueId, inv: CInventoryComponent ) : IBT_EScissorsMode
{
	return (IBT_EScissorsMode)inv.GetItemModifierInt( item, 'ibt_scissors_mode', (int)IBT_SM_Beard );
}

function IBT_ChangeScissorsMode( item: SItemUniqueId, inv: CInventoryComponent )
{
	var mode	: IBT_EScissorsMode;

	mode = IBT_GetScissorsMode(item, inv);

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






function IBT_ConsumeTonicBeard( item: SItemUniqueId, inv: CInventoryComponent ) : bool
{
	var success	: bool;
	var menu	: CR4InventoryMenu;

	if (thePlayer.IsInCombat())
	{
		theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("menu_cannot_perform_action_combat") );
		success = false;
	}
	else
	{
		success = IBT_GrowGeraltBeard();
		if( success )
			theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("ibt_notif_drank_tonic_beard_success") );
		else
			theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("ibt_notif_drank_tonic_beard_failure") );
	}

	if( success )
	{
		theSound.SoundEvent("gui_inventory_drink");

		menu = (CR4InventoryMenu) ((CR4MenuBase)theGame.GetGuiManager().GetRootMenu()).GetLastChild();
		// update invenotry menu peperdoll if we're currently in the inventory menu
		if( menu )
		{
			menu.UpdateAllItemData();
		}

		success = inv.RemoveItem( item, 1 );
	}
	else
		theSound.SoundEvent("gui_global_denied");

	return success;
}

function IBT_ConsumeTonicHair( item: SItemUniqueId, inv: CInventoryComponent ) : bool
{
	var success	: bool;
	var menu	: CR4InventoryMenu;

	if (thePlayer.IsInCombat())
	{
		theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("menu_cannot_perform_action_combat") );
		success = false;
	}
	else
	{
		success = IBT_GrowGeraltHair();
		if( success )
			theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("ibt_notif_drank_tonic_hair_success") );
		else
			theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("ibt_notif_drank_tonic_hair_failure") );
	}

	if( success )
	{
		theSound.SoundEvent("gui_inventory_drink"); 

		menu = (CR4InventoryMenu) ((CR4MenuBase)theGame.GetGuiManager().GetRootMenu()).GetLastChild();
		// update invenotry menu peperdoll if we're currently in the inventory menu
		if( menu )
		{
			menu.UpdateAllItemData();
		}

		success = inv.RemoveItem( item, 1 );
	}
	else
		theSound.SoundEvent("gui_global_denied");

	return success;
}