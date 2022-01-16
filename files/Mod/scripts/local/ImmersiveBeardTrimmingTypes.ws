function IBT_HeadNameToBeardStage( headName: name ) : int
{
	switch( headName )
	{
		case 'head_0':
		case 'head_0_tattoo':
		case 'head_0_mark':
		case 'head_0_mark_tattoo':
			return 0;
		case 'head_1':
		case 'head_1_tattoo':
		case 'head_1_mark':
		case 'head_1_mark_tattoo':
			return 1;
		case 'head_2':
		case 'head_2_tattoo':
		case 'head_2_mark':
		case 'head_2_mark_tattoo':
			return 2;
		case 'head_3':
		case 'head_3_tattoo':
		case 'head_3_mark':
		case 'head_3_mark_tattoo':
			return 3;
		case 'head_4':
		case 'head_4_tattoo':
		case 'head_4_mark':
		case 'head_4_mark_tattoo':
			return 4;
		default:
			return -1;
	}
}

struct IBT_SGeraltHead
{
	var isCustom	: bool;
	var headName	: name;
	var beardStage	: int;
}

enum IBT_ECustomBeardBehaviour
{
    // order should be the same as in menu xml
    IBT_CBB_DoNothing = 0,
    IBT_CBB_SetBeard0 = 1,
    IBT_CBB_SetBeard1 = 2,
    IBT_CBB_SetBeard2 = 3,
    IBT_CBB_SetBeard3 = 4,
    IBT_CBB_SetBeard4 = 5
}

enum IBT_EHairClass
{
    // order should be the same as in menu xml
	IBT_HC_Unknown		= 0,
	IBT_HC_Stage1Loose	= 1,
	IBT_HC_Stage1Tied	= 2,
	IBT_HC_Stage2Loose	= 3,
	IBT_HC_Stage2Tied	= 4,
	IBT_HC_Stage3Loose	= 5,
	IBT_HC_Stage3Tied	= 6
}

enum IBT_EHairStyle
{
    // order should be the same as in menu xml
    IBT_HS_None                         		= 0,
    IBT_HS_HalfWithTail                 		= 1,
    IBT_HS_LongLoose                    		= 2,
    IBT_HS_ShavedWithTail               		= 3,
    IBT_HS_ShortLoose                   		= 4,
    IBT_HS_MohawkWithPonytail           		= 5,
    IBT_HS_Nilfgaardian                 		= 6,
    IBT_HS_DLC2I_ArdLongLoose           		= 7,
    IBT_HS_DLC2I_ArdHeadband            		= 8,
    IBT_HS_DLC2I_ArdLongLooseAlt        		= 9,
    IBT_HS_DLC2I_ArdHeadbandAlt         		= 10,
    IBT_HS_DLC2I_CraniumjFullPony       		= 11,
    IBT_HS_DLC2I_RoksaOlgierd           		= 12,
    IBT_HS_DLC2I_RoksaWitold            		= 13,
    IBT_HS_DLC2I_CraniumjFullPonyLong   		= 14,
    IBT_HS_DLC2I_ArdShavedWithTailLong  		= 15,
    IBT_HS_DLC2I_ArdRivianTail          		= 16,
    IBT_HS_DLC2I_ArdShaved              		= 17,
    IBT_HS_DLC2I_HellspawnLogan         		= 18,
    IBT_HS_DLC2I_FeregornZoltan         		= 19,
    IBT_HS_DLC2I_FeregornCinematic      		= 20,
    IBT_HS_DLC2I_ArdMohawkWithPonytailLong      = 21,
    IBT_HS_DLC2I_FidoxViking      				= 22,
    IBT_HS_DLC2I_ArdElvenLong      				= 23,
    IBT_HS_DLC2I_ArdElvenHeadband      			= 24,
	IBT_HS_DLC2I_RoksaOlgierdAlt           		= 25
}

function IBT_HairstyleEnumToName( e: IBT_EHairStyle ) : name
{
    switch( e )
    {
        case IBT_HS_None:
            return '';
        case IBT_HS_HalfWithTail:
            return 'Half With Tail Hairstyle';
        case IBT_HS_LongLoose:
            return 'Long Loose Hairstyle';
        case IBT_HS_ShavedWithTail:
            return 'Shaved With Tail Hairstyle';
        case IBT_HS_ShortLoose:
            return 'Short Loose Hairstyle';
        case IBT_HS_MohawkWithPonytail:
            return 'Mohawk With Ponytail Hairstyle';
        case IBT_HS_Nilfgaardian:
            return 'Nilfgaardian Hairstyle';
        case IBT_HS_DLC2I_ArdLongLoose:
            return 'Ard Long Loose Hairstyle';
        case IBT_HS_DLC2I_ArdHeadband:
            return 'Ard Headband Hairstyle';
        case IBT_HS_DLC2I_ArdLongLooseAlt:
            return 'Ard Alt Long Loose Hairstyle';
        case IBT_HS_DLC2I_ArdHeadbandAlt:
            return 'Ard Alt Headband Hairstyle';
        case IBT_HS_DLC2I_CraniumjFullPony:
            return 'Craniumj Full Pony Hairstyle';
        case IBT_HS_DLC2I_RoksaOlgierd:
            return 'Roksa Olgierd Hairstyle';
        case IBT_HS_DLC2I_RoksaWitold:
            return 'Roksa Witold Hairstyle';
        case IBT_HS_DLC2I_CraniumjFullPonyLong:
            return 'Craniumj Long Full Pony Hairstyle';
        case IBT_HS_DLC2I_ArdShavedWithTailLong:
            return 'Ard Shaved With Long Tail Hairstyle';
        case IBT_HS_DLC2I_ArdRivianTail:
            return 'Ard Rivian Tail Hairstyle';
        case IBT_HS_DLC2I_ArdShaved:
            return 'Ard Shaved Hairstyle';
        case IBT_HS_DLC2I_HellspawnLogan:
            return 'HellSpawn Logan Hairstyle';
        case IBT_HS_DLC2I_FeregornZoltan:
            return 'Feregorn Zoltan Hairstyle';
        case IBT_HS_DLC2I_FeregornCinematic:
            return 'Feregorn Cinematic Hairstyle';
        case IBT_HS_DLC2I_ArdMohawkWithPonytailLong:
            return 'Ard Mohawk With Long Ponytail Hairstyle';
        case IBT_HS_DLC2I_FidoxViking:
            return 'FidoX Viking Hairstyle';
        case IBT_HS_DLC2I_ArdElvenLong:
            return 'Ard Elven Long Hairstyle';
        case IBT_HS_DLC2I_ArdElvenHeadband:
            return 'Ard Elven Headband Hairstyle';
        case IBT_HS_DLC2I_RoksaOlgierdAlt:
            return 'Roksa Alt Olgierd Hairstyle';
        default:
            return '';
    }
}

function IBT_HairstyleNameToEnum( n: name ) : IBT_EHairStyle
{
    switch( n )
    {
        case 'Half With Tail Hairstyle':
            return IBT_HS_HalfWithTail;
        case 'Long Loose Hairstyle':
            return IBT_HS_LongLoose;
        case 'Shaved With Tail Hairstyle':
            return IBT_HS_ShavedWithTail;
        case 'Short Loose Hairstyle':
            return IBT_HS_ShortLoose;
        case 'Mohawk With Ponytail Hairstyle':
            return IBT_HS_MohawkWithPonytail;
        case 'Nilfgaardian Hairstyle':
            return IBT_HS_Nilfgaardian;
        case 'Ard Long Loose Hairstyle':
            return IBT_HS_DLC2I_ArdLongLoose;
        case 'Ard Headband Hairstyle':
            return IBT_HS_DLC2I_ArdHeadband;
        case 'Ard Alt Long Loose Hairstyle':
            return IBT_HS_DLC2I_ArdLongLooseAlt;
        case 'Ard Alt Headband Hairstyle':
            return IBT_HS_DLC2I_ArdHeadbandAlt;
        case 'Craniumj Full Pony Hairstyle':
            return IBT_HS_DLC2I_CraniumjFullPony;
        case 'Roksa Olgierd Hairstyle':
            return IBT_HS_DLC2I_RoksaOlgierd;
        case 'Roksa Witold Hairstyle':
            return IBT_HS_DLC2I_RoksaWitold;
        case 'Craniumj Long Full Pony Hairstyle':
            return IBT_HS_DLC2I_CraniumjFullPonyLong;
        case 'Ard Shaved With Long Tail Hairstyle':
            return IBT_HS_DLC2I_ArdShavedWithTailLong;
        case 'Ard Rivian Tail Hairstyle':
            return IBT_HS_DLC2I_ArdRivianTail;
        case 'Ard Shaved Hairstyle':
            return IBT_HS_DLC2I_ArdShaved;
        case 'HellSpawn Logan Hairstyle':
            return IBT_HS_DLC2I_HellspawnLogan;
        case 'Feregorn Zoltan Hairstyle':
            return IBT_HS_DLC2I_FeregornZoltan;
        case 'Feregorn Cinematic Hairstyle':
            return IBT_HS_DLC2I_FeregornCinematic;
        case 'Ard Mohawk With Long Ponytail Hairstyle':
            return IBT_HS_DLC2I_ArdMohawkWithPonytailLong;
        case 'FidoX Viking Hairstyle':
            return IBT_HS_DLC2I_FidoxViking;
        case 'Ard Elven Long Hairstyle':
            return IBT_HS_DLC2I_ArdElvenLong;
        case 'Ard Elven Headband Hairstyle':
            return IBT_HS_DLC2I_ArdElvenHeadband;
        case 'Roksa Alt Olgierd Hairstyle':
            return IBT_HS_DLC2I_RoksaOlgierdAlt;
        default:
			return IBT_HS_None;
    }
}

enum IBT_EScissorsMode
{
	IBT_SM_Beard	= 0,
	IBT_SM_Hair		= 1
}