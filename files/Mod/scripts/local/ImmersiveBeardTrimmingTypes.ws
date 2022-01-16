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
	IBT_HC_Stage2Tied	= 4
}

enum IBT_EHairStyle
{
    // order should be the same as in menu xml
    IBT_HS_None                 = 0,
    IBT_HS_HalfWithTail         = 1,
    IBT_HS_LongLoose            = 2,
    IBT_HS_ShavedWithTail       = 3,
    IBT_HS_ShortLoose           = 4,
    IBT_HS_MohawkWithPonytail   = 5,
    IBT_HS_Nilfgaardian         = 6
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
        default:
			return IBT_HS_None;
    }
}

enum IBT_EScissorsMode
{
	IBT_SM_Beard	= 0,
	IBT_SM_Hair		= 1
}