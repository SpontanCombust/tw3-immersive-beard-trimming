enum IBT_HairStyle
{
	IBT_HairStyleHalfWithTail,
	IBT_HairStyleShavedWithTail,
	IBT_HairStyleLongLoose,
	IBT_HairStyleShortLoose,
	IBT_HairStyleMohawkWithPonytail,
	IBT_HairStyleNilfgaardian
	// DLC2 Improved
	IBT_HairStyleArdLongLoose,
    IBT_HairStyleArdHeadband,
    IBT_HairStyleArdLongLooseAlt,
    IBT_HairStyleArdHeadbandAlt,
    IBT_HairStyleCraniumjFullPony,
    IBT_HairStyleRoksaOlgierd,
    IBT_HairStyleRoksaWitold,
    IBT_HairStyleCraniumjFullPonyLong,
    IBT_HairStyleArdShavedWithTailLong,
    IBT_HairStyleArdRivianTail,
    IBT_HairStyleArdShaved,
    IBT_HairStyleHellspawnLogan,
    IBT_HairStyleFeregornZoltan,
    IBT_HairStyleFeregornCinematic,
    IBT_HairStyleArdMohawkWithPonytailLong,
    IBT_HairStyleFidoxViking,
    IBT_HairStyleArdElvenLong,
    IBT_HairStyleArdElvenHeadband,
	IBT_HairStyleRoksaOlgierdAlt
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
		// DLC2 Improved
		case IBT_HairStyleArdLongLoose:
            return 'Ard Long Loose Hairstyle';
        case IBT_HairStyleArdHeadband:
            return 'Ard Headband Hairstyle';
        case IBT_HairStyleArdLongLooseAlt:
            return 'Ard Alt Long Loose Hairstyle';
        case IBT_HairStyleArdHeadbandAlt:
            return 'Ard Alt Headband Hairstyle';
        case IBT_HairStyleCraniumjFullPony:
            return 'Craniumj Full Pony Hairstyle';
        case IBT_HairStyleRoksaOlgierd:
            return 'Roksa Olgierd Hairstyle';
        case IBT_HairStyleRoksaWitold:
            return 'Roksa Witold Hairstyle';
        case IBT_HairStyleCraniumjFullPonyLong:
            return 'Craniumj Long Full Pony Hairstyle';
        case IBT_HairStyleArdShavedWithTailLong:
            return 'Ard Shaved With Long Tail Hairstyle';
        case IBT_HairStyleArdRivianTail:
            return 'Ard Rivian Tail Hairstyle';
        case IBT_HairStyleArdShaved:
            return 'Ard Shaved Hairstyle';
        case IBT_HairStyleHellspawnLogan:
            return 'HellSpawn Logan Hairstyle';
        case IBT_HairStyleFeregornZoltan:
            return 'Feregorn Zoltan Hairstyle';
        case IBT_HairStyleFeregornCinematic:
            return 'Feregorn Cinematic Hairstyle';
        case IBT_HairStyleArdMohawkWithPonytailLong:
            return 'Ard Mohawk With Long Ponytail Hairstyle';
        case IBT_HairStyleFidoxViking:
            return 'FidoX Viking Hairstyle';
        case IBT_HairStyleArdElvenLong:
            return 'Ard Elven Long Hairstyle';
        case IBT_HairStyleArdElvenHeadband:
            return 'Ard Elven Headband Hairstyle';
        case IBT_HairStyleRoksaOlgierdAlt:
            return 'Roksa Alt Olgierd Hairstyle';
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
		// DLC2 Improved
		case 'Ard Long Loose Hairstyle':
            return IBT_HairStyleArdLongLoose;
        case 'Ard Headband Hairstyle':
            return IBT_HairStyleArdHeadband;
        case 'Ard Alt Long Loose Hairstyle':
            return IBT_HairStyleArdLongLooseAlt;
        case 'Ard Alt Headband Hairstyle':
            return IBT_HairStyleArdHeadbandAlt;
        case 'Craniumj Full Pony Hairstyle':
            return IBT_HairStyleCraniumjFullPony;
        case 'Roksa Olgierd Hairstyle':
            return IBT_HairStyleRoksaOlgierd;
        case 'Roksa Witold Hairstyle':
            return IBT_HairStyleRoksaWitold;
        case 'Craniumj Long Full Pony Hairstyle':
            return IBT_HairStyleCraniumjFullPonyLong;
        case 'Ard Shaved With Long Tail Hairstyle':
            return IBT_HairStyleArdShavedWithTailLong;
        case 'Ard Rivian Tail Hairstyle':
            return IBT_HairStyleArdRivianTail;
        case 'Ard Shaved Hairstyle':
            return IBT_HairStyleArdShaved;
        case 'HellSpawn Logan Hairstyle':
            return IBT_HairStyleHellspawnLogan;
        case 'Feregorn Zoltan Hairstyle':
            return IBT_HairStyleFeregornZoltan;
        case 'Feregorn Cinematic Hairstyle':
            return IBT_HairStyleFeregornCinematic;
        case 'Ard Mohawk With Long Ponytail Hairstyle':
            return IBT_HairStyleArdMohawkWithPonytailLong;
        case 'FidoX Viking Hairstyle':
            return IBT_HairStyleFidoxViking;
        case 'Ard Elven Long Hairstyle':
            return IBT_HairStyleArdElvenLong;
        case 'Ard Elven Headband Hairstyle':
            return IBT_HairStyleArdElvenHeadband;
        case 'Roksa Alt Olgierd Hairstyle':
            return IBT_HairStyleRoksaOlgierdAlt;
		default:
			return IBT_HairStyleHalfWithTail;
	}
}

function IBT_HairStyleLocString(hair: IBT_HairStyle) : string
{
    var key: string;

	switch (hair)
	{
		case IBT_HairStyleHalfWithTail:
			key = "ibt_hairstyle_half_with_tail";
            break;
		case IBT_HairStyleShavedWithTail:
			key = "ibt_hairstyle_shaved_with_tail";
            break;
		case IBT_HairStyleLongLoose:
			key = "ibt_hairstyle_long_loose";
            break;
		case IBT_HairStyleShortLoose:
			key = "ibt_hairstyle_short_loose";
            break;
		case IBT_HairStyleMohawkWithPonytail:
			key = "ibt_hairstyle_mohawk_with_ponytal";
            break;
		case IBT_HairStyleNilfgaardian:
			key = "ibt_hairstyle_nilfgaardian";
            break;
        // DLC2 Improved
		case IBT_HairStyleArdLongLoose:
            key = "ibt_hairstyle_ard_long_loose";
            break;
        case IBT_HairStyleArdHeadband:
            key = "ibt_hairstyle_ard_headband";
            break;
        case IBT_HairStyleArdLongLooseAlt:
            key = "ibt_hairstyle_ard_alt_long_loose";
            break;
        case IBT_HairStyleArdHeadbandAlt:
            key = "ibt_hairstyle_ard_alt_headband";
            break;
        case IBT_HairStyleCraniumjFullPony:
            key = "ibt_hairstyle_craniumj_full_pony";
            break;
        case IBT_HairStyleRoksaOlgierd:
            key = "ibt_hairstyle_roksa_olgierd";
            break;
        case IBT_HairStyleRoksaWitold:
            key = "ibt_hairstyle_roksa_witold";
            break;
        case IBT_HairStyleCraniumjFullPonyLong:
            key = "ibt_hairstyle_craniumj_long_full_pony";
            break;
        case IBT_HairStyleArdShavedWithTailLong:
            key = "ibt_hairstyle_ard_shaved_with_long_tail";
            break;
        case IBT_HairStyleArdRivianTail:
            key = "ibt_hairstyle_ard_rivian_tail";
            break;
        case IBT_HairStyleArdShaved:
            key = "ibt_hairstyle_ard_shaved";
            break;
        case IBT_HairStyleHellspawnLogan:
            key = "ibt_hairstyle_hellspawn_logan";
            break;
        case IBT_HairStyleFeregornZoltan:
            key = "ibt_hairstyle_feregorn_zoltan";
            break;
        case IBT_HairStyleFeregornCinematic:
            key = "ibt_hairstyle_feregorn_cinematic";
            break;
        case IBT_HairStyleArdMohawkWithPonytailLong:
            key = "ibt_hairstyle_ard_mohawk_with_long_ponytail";
            break;
        case IBT_HairStyleFidoxViking:
            key = "ibt_hairstyle_fidox_viking";
            break;
        case IBT_HairStyleArdElvenLong:
            key = "ibt_hairstyle_ard_elven_long";
            break;
        case IBT_HairStyleArdElvenHeadband:
            key = "ibt_hairstyle_ard_elven_headband";
            break;
        case IBT_HairStyleRoksaOlgierdAlt:
            key = "ibt_hairstyle_roksa_alt_olgierd";
            break;
		default:
			key = "";
	}

    return GetLocStringByKey(key);
}

function IBT_IsHairStyleWithTie(hair: IBT_HairStyle) : bool
{
	switch (hair)
	{
		case IBT_HairStyleHalfWithTail:
		case IBT_HairStyleShavedWithTail:
		case IBT_HairStyleMohawkWithPonytail:
		case IBT_HairStyleArdHeadband:
		case IBT_HairStyleArdHeadbandAlt:
		case IBT_HairStyleCraniumjFullPony:
		case IBT_HairStyleCraniumjFullPonyLong:
		case IBT_HairStyleArdShavedWithTailLong:
		case IBT_HairStyleArdRivianTail:
		case IBT_HairStyleArdMohawkWithPonytailLong:
		case IBT_HairStyleFidoxViking:
		case IBT_HairStyleArdElvenHeadband:
			return true;
		default:
			return false;
	}
}


function IBT_IsDLC2ImprovedModInstalled() : bool
{
    if(StrLen(GetLocStringById(2114400000)) > 0)
    {
        return true;
    }

    return false;
}


enum IBT_HairStyleLengthBounds
{
    IBT_HairStyleLengthMin = 1,
    IBT_HairStyleLengthMax = 3,
}

function IBT_HairstyleToLength(hair: IBT_HairStyle) : int
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
		// DLC2 Improved
		case IBT_HairStyleArdLongLoose:
            return settings.HairLength.ArdLongLoose;
        case IBT_HairStyleArdHeadband:
            return settings.HairLength.ArdHeadband;
        case IBT_HairStyleArdLongLooseAlt:
            return settings.HairLength.ArdLongLooseAlt;
        case IBT_HairStyleArdHeadbandAlt:
            return settings.HairLength.ArdHeadbandAlt;
        case IBT_HairStyleCraniumjFullPony:
            return settings.HairLength.CraniumjFullPony;
        case IBT_HairStyleRoksaOlgierd:
            return settings.HairLength.RoksaOlgierd;
        case IBT_HairStyleRoksaWitold:
            return settings.HairLength.RoksaWitold;
        case IBT_HairStyleCraniumjFullPonyLong:
            return settings.HairLength.CraniumjFullPonyLong;
        case IBT_HairStyleArdShavedWithTailLong:
            return settings.HairLength.ArdShavedWithTailLong;
        case IBT_HairStyleArdRivianTail:
            return settings.HairLength.ArdRivianTail;
        case IBT_HairStyleArdShaved:
            return settings.HairLength.ArdShaved;
        case IBT_HairStyleHellspawnLogan:
            return settings.HairLength.HellspawnLogan;
        case IBT_HairStyleFeregornZoltan:
            return settings.HairLength.FeregornZoltan;
        case IBT_HairStyleFeregornCinematic:
            return settings.HairLength.FeregornCinematic;
        case IBT_HairStyleArdMohawkWithPonytailLong:
            return settings.HairLength.ArdMohawkWithPonytailLong;
        case IBT_HairStyleFidoxViking:
            return settings.HairLength.FidoxViking;
        case IBT_HairStyleArdElvenLong:
            return settings.HairLength.ArdElvenLong;
        case IBT_HairStyleArdElvenHeadband:
            return settings.HairLength.ArdElvenHeadband;
        case IBT_HairStyleRoksaOlgierdAlt:
            return settings.HairLength.RoksaOlgierdAlt;
		default:
			return 1;
	}
}
