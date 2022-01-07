function IBT_Menu_ShortTiedHairName() : name
{
    var config	: CInGameConfigWrapper;
	var idx		: int;

	config = theGame.GetInGameConfigWrapper();
    idx = StringToInt( config.GetVarValue('ImmersiveBeardTrimming_HairStyles', 'HairShortTied'), 0);

    if( idx == 0 )
        return 'Shaved With Tail Hairstyle';
    else
        return 'Mohawk With Ponytail Hairstyle';
}

function IBT_Menu_ShortUntiedHairName() : name
{
    var config	: CInGameConfigWrapper;
	var idx		: int;

	config = theGame.GetInGameConfigWrapper();
    idx = StringToInt( config.GetVarValue('ImmersiveBeardTrimming_HairStyles', 'HairShortUntied'), 0);

    if( idx == 0 )
        return 'Short Loose Hairstyle';
    else
        return 'Nilfgaardian Hairstyle';
}

function IBT_Menu_BlockActionsDuringCombat() : bool
{
    var config	: CInGameConfigWrapper;

	config = theGame.GetInGameConfigWrapper();
    return config.GetVarValue('ImmersiveBeardTrimming_ItemBehaviour', 'BehaviourBlockActionsDuringCombat');
}

enum IBT_ECustomBeardBehaviour
{
    IBT_CBB_DoNothing,
    IBT_CBB_SetBeard0,
    IBT_CBB_SetBeard1,
    IBT_CBB_SetBeard2,
    IBT_CBB_SetBeard3,
    IBT_CBB_SetBeard4
}

function IBT_Menu_CustomBeardTrimBehaviour() : IBT_ECustomBeardBehaviour
{
    var config	: CInGameConfigWrapper;
	var idx		: int;

	config = theGame.GetInGameConfigWrapper();
    idx = StringToInt(config.GetVarValue('ImmersiveBeardTrimming_ItemBehaviour', 'BehaviourCustomBeardTrim'), 0);

    return ( (IBT_ECustomBeardBehaviour)idx );
}

function IBT_Menu_CustomBeardGrowBehaviour() : IBT_ECustomBeardBehaviour
{
    var config	: CInGameConfigWrapper;
	var idx		: int;

	config = theGame.GetInGameConfigWrapper();
    idx = StringToInt(config.GetVarValue('ImmersiveBeardTrimming_ItemBehaviour', 'BehaviourCustomBeardGrow'), 0);

    return ( (IBT_ECustomBeardBehaviour)idx );
}

function IBT_Menu_BlockUnnecessaryTonicConsumption() : bool
{
    var config	: CInGameConfigWrapper;

	config = theGame.GetInGameConfigWrapper();
    return config.GetVarValue('ImmersiveBeardTrimming_ItemBehaviour', 'BehaviourBlockUnnecessaryTonicConsumption');
}