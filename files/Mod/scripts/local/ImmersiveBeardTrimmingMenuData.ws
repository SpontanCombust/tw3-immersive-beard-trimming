function IBT_Menu_ShortTiedHairName() : name
{
    var config	: CInGameConfigWrapper;
	var idx		: int;

	config = theGame.GetInGameConfigWrapper();
    idx = StringToInt( config.GetVarValue('ImmersiveBeardTrimming.HairStyles', 'HairShortTied'), 0);

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
    idx = StringToInt( config.GetVarValue('ImmersiveBeardTrimming.HairStyles', 'HairShortUntied'), 0);

    if( idx == 0 )
        return 'Short Loose Hairstyle';
    else
        return 'Nilfgaardian Hairstyle';
}

function IBT_Menu_BlockActionsDuringCombat() : bool
{
    var config	: CInGameConfigWrapper;

	config = theGame.GetInGameConfigWrapper();
    return config.GetVarValue('ImmersiveBeardTrimming.ItemBehaviour', 'BehaviourBlockActionsDuringCombat');
}

enum IBT_ECustomBeardBehaviour
{
    IBT_CBB_DoNothing   = 0,
    IBT_CBB_Warn        = 1,
    IBT_CBB_SetBeard0   = 2,
    IBT_CBB_SetBeard1   = 3,
    IBT_CBB_SetBeard2   = 4,
    IBT_CBB_SetBeard3   = 5,
    IBT_CBB_SetBeard4   = 6
}

function IBT_Menu_CustomBeardTrimBehaviour() : IBT_ECustomBeardBehaviour
{
    var config	: CInGameConfigWrapper;
	var idx		: int;

	config = theGame.GetInGameConfigWrapper();
    idx = StringToInt(config.GetVarValue('ImmersiveBeardTrimming.ItemBehaviour', 'BehaviourCustomBeardTrim'), 0);

    return ( (IBT_ECustomBeardBehaviour)idx );
}

function IBT_Menu_CustomBeardGrowBehaviour() : IBT_ECustomBeardBehaviour
{
    var config	: CInGameConfigWrapper;
	var idx		: int;

	config = theGame.GetInGameConfigWrapper();
    idx = StringToInt(config.GetVarValue('ImmersiveBeardTrimming.ItemBehaviour', 'BehaviourCustomBeardGrow'), 0);

    return ( (IBT_ECustomBeardBehaviour)idx );
}

function IBT_Menu_BlockUnnecessaryTonicConsumption() : bool
{
    var config	: CInGameConfigWrapper;

	config = theGame.GetInGameConfigWrapper();
    return config.GetVarValue('ImmersiveBeardTrimming.ItemBehaviour', 'BehaviourBlockUnnecessaryTonicConsumption');
}