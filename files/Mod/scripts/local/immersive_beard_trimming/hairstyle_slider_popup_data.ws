class IBT_HairstyleSliderPopupData extends SliderPopupData
{
    public var hairstyleNames      : array<name>;
    public var hairstyleLocStrings : array<string>;

    default currentValue = 1;


    // to be invoked only once the object is created
    public function Init() : void
    {
        this.minValue = 1;
        this.maxValue = hairstyleNames.Size();
    }

    // to be invoked every time popup is updated
    public function GetGFxData(parentFlashValueStorage : CScriptedFlashValueStorage) : CScriptedFlashObject
    {
        this.m_TextTitle = "<font size='25' color = '#B58D45'>" + this.CurrentHairstyleLocString() + "</font>";

        return super.GetGFxData(parentFlashValueStorage);
    }

    protected  function DefineDefaultButtons():void
	{
		this.AddButtonDef("panel_button_common_accept", "enter-gamepad_A", IK_Enter);
        this.AddButtonDef("panel_button_common_exit", "escape-gamepad_B", IK_Escape);
	}

    public function OnUserFeedback(keyCode : string) : void
    {
        if (keyCode == "enter-gamepad_A")
        {
            LogChannel('IBT', "Applied hairstyle: " + this.CurrentHairstyleName());
            this.ClosePopup();
        }
        else if (keyCode == "escape-gamepad_B")
        {
            this.ClosePopup();
        }
    }

    public function OnSliderValueChanged() : void 
    {
        this.PopupRef.UpdatePopupInstance(this);
    }


    public function CurrentHairstyleName() : name
    {
        return this.hairstyleNames[this.currentValue - 1];
    }

    public function CurrentHairstyleLocString() : string
    {
        return this.hairstyleLocStrings[this.currentValue - 1];
    }
}

exec function ibt_test_slider() 
{
    var rootMenu: CR4Menu;
    var invMenu: CR4InventoryMenu;
    var data: IBT_HairstyleSliderPopupData;
    
    data = new IBT_HairstyleSliderPopupData in theGame;

    data.hairstyleNames.PushBack('Short Loose Hairstyle');
    data.hairstyleLocStrings.PushBack("Short Loose Hairstyle");
    data.hairstyleNames.PushBack('Half With Tail Hairstyle');
    data.hairstyleLocStrings.PushBack("Half With Tail Hairstyle");
    data.hairstyleNames.PushBack('Long Loose Hairstyle');
    data.hairstyleLocStrings.PushBack("Long Loose Hairstyle");

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
