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
			IBT_HairstyleChoicePopup();
			// TODO move to IBT_HairstyleChoiceSliderPopupData
			// if( success )
			// 	theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("ibt_notif_used_scissors_hair_success") );
			// else
			// 	theGame.GetGuiManager().ShowNotification( GetLocStringByKeyExt("ibt_notif_used_scissors_hair_failure") );
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