//////////////////////////// CONFIGURATION BASED ON OTHER MODS INSTALLED ////////////////////////////

function IBT_IsDLC2ImprovedModInstalled() : bool
{
    if( StrLen(GetLocStringById(2114400000)) > 0 )
    {
        return true;
    }

    return false;
}





//////////////////////////// HAIR CLASSES ////////////////////////////

function IBT_Config_HairNameToHairClass( hairName: name ) : IBT_EHairClass
{
    var config		: CInGameConfigWrapper;
	var hairStyle	: IBT_EHairStyle;
	var varid		: name;

	config = theGame.GetInGameConfigWrapper();
	hairStyle = IBT_HairstyleNameToEnum( hairName );

    switch( hairStyle )
    {
        case IBT_HS_HalfWithTail:
            varid = 'HairClassHalfWithPonytail';
            break;
        case IBT_HS_LongLoose:
            varid = 'HairClassLongLoose';
            break;
        case IBT_HS_ShavedWithTail:
            varid = 'HairClassShavedWithPonytail';
            break;
        case IBT_HS_ShortLoose:
            varid = 'HairClassShortLoose';
            break;
        case IBT_HS_MohawkWithPonytail:
            varid = 'HairClassMohawkWithPonytail';
            break;
        case IBT_HS_Nilfgaardian:
            varid = 'HairClassElvenRebel';
            break;
        case IBT_HS_DLC2I_ArdLongLoose:
            varid = 'HairClassDLC2ILongLooseBehindEars';
            break;
        case IBT_HS_DLC2I_ArdHeadband:
            varid = 'HairClassDLC2ILongWithHeadband';
            break;
        case IBT_HS_DLC2I_ArdLongLooseAlt:
            varid = 'HairClassDLC2ILongLooseBehindEarsAlt';
            break;
        case IBT_HS_DLC2I_ArdHeadbandAlt:
            varid = 'HairClassDLC2ILongWithHeadbandAlt';
            break;
        case IBT_HS_DLC2I_CraniumjFullPony:
            varid = 'HairClassDLC2IPonyTail';
            break;
        case IBT_HS_DLC2I_RoksaOlgierd:
            varid = 'HairClassDLC2IOlgierd';
            break;
        case IBT_HS_DLC2I_RoksaWitold:
            varid = 'HairClassDLC2IWitold';
            break;
        case IBT_HS_DLC2I_CraniumjFullPonyLong:
            varid = 'HairClassDLC2IPonyTailLong';
            break;
        case IBT_HS_DLC2I_ArdShavedWithTailLong:
            varid = 'HairClassDLC2IShavedWithPonytailLong';
            break;
        case IBT_HS_DLC2I_ArdRivianTail:
            varid = 'HairClassDLC2IRivianPonytail';
            break;
        case IBT_HS_DLC2I_ArdShaved:
            varid = 'HairClassDLC2IShaved';
            break;
        case IBT_HS_DLC2I_HellspawnLogan:
            varid = 'HairClassDLC2ILogan';
            break;
        case IBT_HS_DLC2I_FeregornZoltan:
            varid = 'HairClassDLC2IZoltan';
            break;
        case IBT_HS_DLC2I_FeregornCinematic:
            varid = 'HairClassDLC2ISlickedBackLong';
            break;
        case IBT_HS_DLC2I_ArdMohawkWithPonytailLong:
            varid = 'HairClassDLC2IMohawkWithPonytailLong';
            break;
        case IBT_HS_DLC2I_FidoxViking:
            varid = 'HairClassDLC2IViking';
            break;
        case IBT_HS_DLC2I_ArdElvenLong:
            varid = 'HairClassDLC2ILongElven';
            break;
        case IBT_HS_DLC2I_ArdElvenHeadband:
            varid = 'HairClassDLC2ILongElvenWithHeadband';
            break;
        case IBT_HS_DLC2I_RoksaOlgierdAlt:
            varid = 'HairClassDLC2IOlgierdAlt';
            break;
        default:
			varid = '';
    }

    IBT_Log( "IBT_Config_HairNameToHairClass: " + varid );

	if( varid != '' )
		return (IBT_EHairClass)StringToInt( config.GetVarValue('ImmersiveBeardTrimming_HairClasses', varid), 0);
	else
		return IBT_HC_Unknown;
}






//////////////////////////// DEFAULT HAIRSTYLES FOR CLASSES ////////////////////////////

function IBT_Config_HairClassToHairStyle( hairClass: IBT_EHairClass ) : IBT_EHairStyle
{
    var config	    : CInGameConfigWrapper;
	var varid		: name;
	var hairStyle   : IBT_EHairStyle;

	config = theGame.GetInGameConfigWrapper();

    switch( hairClass )
    {	
		case IBT_HC_Stage1Loose:
            varid = 'DefaultHairstyleStage1Loose';
            break;
		case IBT_HC_Stage1Tied:
            varid = 'DefaultHairstyleStage1Tied';
            break;
		case IBT_HC_Stage2Loose:
            varid = 'DefaultHairstyleStage2Loose';
            break;
		case IBT_HC_Stage2Tied:
            varid = 'DefaultHairstyleStage2Tied';
            break;
		case IBT_HC_Stage3Loose:
            varid = 'DefaultHairstyleStage3Loose';
            break;
		case IBT_HC_Stage3Tied:
            varid = 'DefaultHairstyleStage3Tied';
            break;
		default:
			varid = '';
    }

	if( varid != '' )
		hairStyle = (IBT_EHairStyle)StringToInt( config.GetVarValue('ImmersiveBeardTrimming_DefaultHairStyles', varid), 0);
	else
		hairStyle = IBT_HS_None;

    return hairStyle;
}








//////////////////////////// ITEM BEHAVIOUR ////////////////////////////

function IBT_Config_BlockActionsDuringCombat() : bool
{
    var config	: CInGameConfigWrapper;

	config = theGame.GetInGameConfigWrapper();
    return config.GetVarValue('ImmersiveBeardTrimming_ItemBehaviour', 'BehaviourBlockActionsDuringCombat');
}

function IBT_Config_CustomBeardTrimBehaviour() : IBT_ECustomBeardBehaviour
{
    var config	: CInGameConfigWrapper;
	var idx		: int;

	config = theGame.GetInGameConfigWrapper();
    idx = StringToInt(config.GetVarValue('ImmersiveBeardTrimming_ItemBehaviour', 'BehaviourCustomBeardTrim'), 0);

    return ( (IBT_ECustomBeardBehaviour)idx );
}

function IBT_Config_CustomBeardGrowBehaviour() : IBT_ECustomBeardBehaviour
{
    var config	: CInGameConfigWrapper;
	var idx		: int;

	config = theGame.GetInGameConfigWrapper();
    idx = StringToInt(config.GetVarValue('ImmersiveBeardTrimming_ItemBehaviour', 'BehaviourCustomBeardGrow'), 0);

    return ( (IBT_ECustomBeardBehaviour)idx );
}

function IBT_Config_BlockUnnecessaryTonicConsumption() : bool
{
    var config	: CInGameConfigWrapper;

	config = theGame.GetInGameConfigWrapper();
    return config.GetVarValue('ImmersiveBeardTrimming_ItemBehaviour', 'BehaviourBlockUnnecessaryTonicConsumption');
}
//TODO should even use notifications to begin with? use only with errors?
function IBT_Config_ShowNotifications() : bool
{
    var config	: CInGameConfigWrapper;

	config = theGame.GetInGameConfigWrapper();
    return config.GetVarValue('ImmersiveBeardTrimming_ItemBehaviour', 'BehaviourShowNotifications');
}