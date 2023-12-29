enum IBT_HairStyle
{
	IBT_HairStyleHalfWithTail,
	IBT_HairStyleShavedWithTail,
	IBT_HairStyleLongLoose,
	IBT_HairStyleShortLoose,
	IBT_HairStyleMohawkWithPonytail,
	IBT_HairStyleNilfgaardian
}

function IBT_HairStyleEnumToName(hair: IBT_HairStyle) : name
{
	switch (hair)
	{
		case IBT_HairStyleHalfWithTail:
			return 'Half With Tail Hairstyle';
		case IBT_HairStyleShavedWithTail:
			return 'Shaved With Tail Hairstyle';
		case IBT_HairStyleLongLoose:
			return 'Long Loose Hairstyle';
		case IBT_HairStyleShortLoose:
			return 'Short Loose Hairstyle';
		case IBT_HairStyleMohawkWithPonytail:
			return 'Mohawk With Ponytail Hairstyle';
		case IBT_HairStyleNilfgaardian:
			return 'Nilfgaardian Hairstyle';
		default:
			return 'Half With Tail Hairstyle'; // default fallback hairstyle
	}
}

function IBT_HairStyleNameToEnum(hair: name) : IBT_HairStyle
{
	switch (hair)
	{
		case 'Half With Tail Hairstyle':
			return IBT_HairStyleHalfWithTail;
		case 'Shaved With Tail Hairstyle':
			return IBT_HairStyleShavedWithTail;
		case 'Long Loose Hairstyle':
			return IBT_HairStyleLongLoose;
		case 'Short Loose Hairstyle':
			return IBT_HairStyleShortLoose;
		case 'Mohawk With Ponytail Hairstyle':
			return IBT_HairStyleMohawkWithPonytail;
		case 'Nilfgaardian Hairstyle':
			return IBT_HairStyleNilfgaardian;
		default:
			return IBT_HairStyleHalfWithTail;
	}
}

function IBT_HairStyleLocString(hair: IBT_HairStyle) : string
{
	switch (hair)
	{
		case IBT_HairStyleHalfWithTail:
			return "ibt_hairstyle_half_with_tail";
		case IBT_HairStyleShavedWithTail:
			return "ibt_hairstyle_shaved_with_tail";
		case IBT_HairStyleLongLoose:
			return "ibt_hairstyle_long_loose";
		case IBT_HairStyleShortLoose:
			return "ibt_hairstyle_short_loose";
		case IBT_HairStyleMohawkWithPonytail:
			return "ibt_hairstyle_mohawk_with_ponytal";
		case IBT_HairStyleNilfgaardian:
			return "ibt_hairstyle_nilfgaardian";
		default:
			return "";
	}
}

function IBT_IsHairStyleWithTie(hair: IBT_HairStyle) : bool
{
	switch (hair)
	{
		case IBT_HairStyleHalfWithTail:
		case IBT_HairStyleShavedWithTail:
		case IBT_HairStyleMohawkWithPonytail:
			return true;
		default:
			return false;
	}
}