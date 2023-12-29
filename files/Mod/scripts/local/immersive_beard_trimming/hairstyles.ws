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
        // DLC2 Improved
		case IBT_HairStyleArdLongLoose:
            return "ibt_hairstyle_ard_long_loose";
        case IBT_HairStyleArdHeadband:
            return "ibt_hairstyle_ard_headband";
        case IBT_HairStyleArdLongLooseAlt:
            return "ibt_hairstyle_ard_alt_long_loose";
        case IBT_HairStyleArdHeadbandAlt:
            return "ibt_hairstyle_ard_alt_headband";
        case IBT_HairStyleCraniumjFullPony:
            return "ibt_hairstyle_craniumj_full_pony";
        case IBT_HairStyleRoksaOlgierd:
            return "ibt_hairstyle_roksa_olgierd";
        case IBT_HairStyleRoksaWitold:
            return "ibt_hairstyle_roksa_witold";
        case IBT_HairStyleCraniumjFullPonyLong:
            return "ibt_hairstyle_craniumj_long_full_pony";
        case IBT_HairStyleArdShavedWithTailLong:
            return "ibt_hairstyle_ard_shaved_with_long_tail";
        case IBT_HairStyleArdRivianTail:
            return "ibt_hairstyle_ard_rivian_tail";
        case IBT_HairStyleArdShaved:
            return "ibt_hairstyle_ard_shaved";
        case IBT_HairStyleHellspawnLogan:
            return "ibt_hairstyle_hellspawn_logan";
        case IBT_HairStyleFeregornZoltan:
            return "ibt_hairstyle_feregorn_zoltan";
        case IBT_HairStyleFeregornCinematic:
            return "ibt_hairstyle_feregorn_cinematic";
        case IBT_HairStyleArdMohawkWithPonytailLong:
            return "ibt_hairstyle_ard_mohawk_with_long_ponytail";
        case IBT_HairStyleFidoxViking:
            return "ibt_hairstyle_fidox_viking";
        case IBT_HairStyleArdElvenLong:
            return "ibt_hairstyle_ard_elven_long";
        case IBT_HairStyleArdElvenHeadband:
            return "ibt_hairstyle_ard_elven_headband";
        case IBT_HairStyleRoksaOlgierdAlt:
            return "ibt_hairstyle_roksa_alt_olgierd";
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