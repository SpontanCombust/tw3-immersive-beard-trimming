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