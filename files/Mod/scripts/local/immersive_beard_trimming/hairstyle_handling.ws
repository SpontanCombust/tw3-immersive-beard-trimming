function IBT_HairstylesForLength(length: int) : array<IBT_HairStyle>
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

function IBT_HairstyleChoicePopup()
{
	var currentHair		: IBT_HairStyle;
	var currentLength	: int;
	var currentHasTie	: bool;
	var popupData		: IBT_HairstyleChoiceSliderPopupData;
	var length			: int;
	var hairs			: array<IBT_HairStyle>;
	var i				: int;
	var hair			: IBT_HairStyle;


	currentHair = IBT_GetGeraltHairstyle();
	currentLength = IBT_HairstyleToLength(currentHair);
	currentHasTie = IBT_IsHairStyleWithTie(currentHair);

	popupData = new IBT_HairstyleChoiceSliderPopupData in theGame;

	for (length = IBT_HairStyleLengthMin; length <= IBT_HairStyleLengthMax; length += 1)
	{
		hairs = IBT_HairstylesForLength(length);

		size = hairs.Size();
		for (i = 0; i < hairs.Size(); i += 1)
		{
			hair = hairs[i];
			popupData.entries.PushBack(IBT_PopupEntryForHairstyle(currentHair, currentLength, currentHasTie, hair));
		}
	}

	IBT_ShowChoiceSliderPopup(popupData);
}

function IBT_PopupEntryForHairstyle(currentHair: IBT_HairStyle, currentLength: int, currentHasTie: bool, testedHair: IBT_HairStyle) : IBT_ChoiceSliderPopupDataEntry
{
	var dataEntry		: IBT_ChoiceSliderPopupDataEntry;
	var requirements	: array<string>;
	var i				: int;

	dataEntry.mainText = IBT_HairStyleLocString(testedHair);

	if (IBT_HairstyleToLength(testedHair) > currentLength)
	{
		requirements.PushBack(GetLocStringByKey("ibt_choice_requires_longer_hair"));
	}
	if (IBT_IsHairStyleWithTie(testedHair) && !currentHasTie && !thePlayer.inv.HasItem('ibt_hairtie'))
	{
		requirements.PushBack(GetLocStringByKey("ibt_choice_requires_hairtie"));
	}

	if (requirements.Size() > 0)
	{
		dataEntry.extraText = requirements[0];
		for (i = 1; i < requirements.Size(); i += 1)
		{
			dataEntry.extraText += ", " + requirements[i];
		}

		dataEntry.extraText = "(" + GetLocStringByKey("ibt_choice_requires") + ": " + dataEntry.extraText + ")"
		dataEntry.isAvailable = false;
	}
	else
	{
		dataEntry.extraText = "";
		dataEntry.isAvailable = true;
	}

	dataEntry.value = (int)testedHair;

	return dataEntry;
}

function IBT_GrowGeraltHair() : bool
{
	//TODO
	
	return false;
}
