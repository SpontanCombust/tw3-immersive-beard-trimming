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
    public var entries  : array<IBT_ChoiceSliderPopupDataEntry>;

    default currentValue = 1;


    // to be invoked only once the object is created
    public function Init() : void
    {
        this.minValue = 1;
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
            if (current.isAvailable && this.OnAccept(current.value))
            {
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

class IBT_HairstyleChoiceSliderPopupData extends IBT_ChoiceSliderPopupData
{
    protected function OnAccept(value: int) : bool
    {
        var hair: IBT_HairStyle;

        hair = (IBT_HairStyle)value;

        LogChannel('IBT', "Applied hairstyle: " + IBT_HairStyleEnumToName(hair));

        // virtual
        return true;
    }
}

exec function ibt_test_slider() 
{
    var rootMenu: CR4Menu;
    var invMenu: CR4InventoryMenu;
    var data: IBT_HairstyleChoiceSliderPopupData;
    
    data = new IBT_HairstyleChoiceSliderPopupData in theGame;
    data.entries.PushBack(IBT_ChoiceSliderPopupDataEntry("Short Loose Hairstyle", "", true, (int)IBT_HairStyleShortLoose));
    data.entries.PushBack(IBT_ChoiceSliderPopupDataEntry("Half With Tail Hairstyle", "(requires hairtie)", true, (int)IBT_HairStyleHalfWithTail));
    data.entries.PushBack(IBT_ChoiceSliderPopupDataEntry("Long Loose Hairstyle", "(hair needs to be longer)", false, (int)IBT_HairStyleLongLoose));
    data.Init();

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
