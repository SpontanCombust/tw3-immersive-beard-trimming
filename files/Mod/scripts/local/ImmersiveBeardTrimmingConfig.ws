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
        default:
			varid = '';
    }

	if( varid != '' )
		return (IBT_EHairClass)StringToInt( config.GetVarValue('ImmersiveBeardTrimming_HairClasses', varid), 0);
	else
		return IBT_HC_Unknown;
}






//////////////////////////// DEFAULT HAIRSTYLES FOR CLASSES ////////////////////////////

function IBT_Config_HairClassToHairName( hairClass: IBT_EHairClass ) : name
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
		default:
			varid = '';
    }

	if( varid != '' )
		hairStyle = (IBT_EHairStyle)StringToInt( config.GetVarValue('ImmersiveBeardTrimming_DefaultHairStyles', varid), 0);
	else
		hairStyle = IBT_HS_None;

    return IBT_HairstyleEnumToName( hairStyle );
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

function IBT_Config_ShowNotifications() : bool
{
    var config	: CInGameConfigWrapper;

	config = theGame.GetInGameConfigWrapper();
    return config.GetVarValue('ImmersiveBeardTrimming_ItemBehaviour', 'BehaviourShowNotifications');
}