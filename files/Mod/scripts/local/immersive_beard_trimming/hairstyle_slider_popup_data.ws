struct IBT_ChoiceSliderPopupDataEntry
{
    /// main title displayed over the slider
    var mainText       : string;
    /// extra text after mainText, can be empty strings 
    /// green if isAvailable, red otherwise
    var extraText       : string; 
    /// if false will grey out the entry and make it impossible to be accepted 
    var isAvailable     : bool;
    /// integer value of the option; should suffice for enum values, otherwise may need to change it to string or something later
    var value           : int; 
}

class IBT_ChoiceSliderPopupData extends SliderPopupData
{
    protected var entries  : array<IBT_ChoiceSliderPopupDataEntry>;

    default minValue = 1;
    default currentValue = 1;
    default maxValue = 1;


    public function AddEntry(choiceEntry: IBT_ChoiceSliderPopupDataEntry)
    {
        this.entries.PushBack(choiceEntry);
        this.maxValue = entries.Size();
    }

    // to be invoked every time popup is updated
    public function GetGFxData(parentFlashValueStorage : CScriptedFlashValueStorage) : CScriptedFlashObject
    {
        var current         : IBT_ChoiceSliderPopupDataEntry;
        var mainTextColor   : string;
        var extraTextColor  : string;
        
        current = this.CurrentEntry();

        if (current.isAvailable)
        {
            mainTextColor = "#B58D45";
            extraTextColor = "#00FF00"
        }
        else
        {
            mainTextColor = "#A2A2A2";
            extraTextColor = "#FF0000"
        }

        this.m_TextTitle =  "<font size='25'>" +
                                "<font color = '" + mainTextColor + "'>" + current.mainText + "</font>" +
                                "<font color = '" + extraTextColor + "'>" + current.extraText + "</font>" +
                            "</font>";

        return super.GetGFxData(parentFlashValueStorage);
    }

    protected function DefineDefaultButtons() : void
	{
		this.AddButtonDef("panel_button_common_accept", "enter-gamepad_A", IK_Enter);
        this.AddButtonDef("panel_button_common_exit", "escape-gamepad_B", IK_Escape);
	}

    public function OnUserFeedback(keyCode : string) : void
    {
        var current: IBT_ChoiceSliderPopupDataEntry;

        if (keyCode == "enter-gamepad_A")
        {
            current = this.CurrentEntry();
            if (!current.isAvailable)
            {
                theSound.SoundEvent("gui_global_denied");
            }
            else if (this.OnAccept(current.value))
            {
                theSound.SoundEvent("gui_inventory_other_attach");
                this.ClosePopup();
            }
        }
        else if (keyCode == "escape-gamepad_B")
        {
            this.ClosePopup();
        }
    }


    protected function CurrentEntry() : IBT_ChoiceSliderPopupDataEntry
    {
        return this.entries[this.currentValue - 1];
    }

    protected function OnAccept(value: int) : bool
    {
        // virtual
        return true;
    }
}

function IBT_ShowChoiceSliderPopup(data: IBT_ChoiceSliderPopupData)
{
    var rootMenu    : CR4Menu;
    var invMenu     : CR4InventoryMenu;   

    rootMenu = theGame.GetGuiManager().GetRootMenu();
    if (rootMenu)
    {
        // show the popup only in inventory menu
        invMenu = (CR4InventoryMenu)rootMenu.GetSubMenu();
        if (invMenu)
        {
            invMenu.RequestSubMenu('PopupMenu', data);
        }
    }
}
