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
