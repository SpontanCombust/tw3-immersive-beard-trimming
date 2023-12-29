function IBT_IsDLCBeard() : bool
{
	var customHead	: name;

	// keep in mind that it will work properly only if when setting head beforehand it was also remembered in thePlayer
	// if it was done through an actual in-game barber, it will work 100%
	customHead = thePlayer.GetRememberedCustomHead();

	return IsNameValid( customHead );
}

function IBT_GetGeraltBeardStage() : int
{
	var components	: array< CComponent >;
	var headManager	: CHeadManagerComponent;
	var curHead		: name;
	var stage		: int;
	
	components = thePlayer.GetComponentsByClassName( 'CHeadManagerComponent' );
	headManager = ( ( CHeadManagerComponent ) components[0] );
	curHead = headManager.GetCurHeadName();

	switch( curHead )
	{
		case 'head_0':
		case 'head_0_tattoo':
		case 'head_0_mark':
		case 'head_0_mark_tattoo':
			stage = 0;
			break;
		case 'head_1':
		case 'head_1_tattoo':
		case 'head_1_mark':
		case 'head_1_mark_tattoo':
			stage = 1;
			break;
		case 'head_2':
		case 'head_2_tattoo':
		case 'head_2_mark':
		case 'head_2_mark_tattoo':
			stage = 2;
			break;
		case 'head_3':
		case 'head_3_tattoo':
		case 'head_3_mark':
		case 'head_3_mark_tattoo':
			stage = 3;
			break;
		case 'head_4':
		case 'head_4_tattoo':
		case 'head_4_mark':
		case 'head_4_mark_tattoo':
			stage = 4;
			break;
		default:
			stage = -1;
	}

	return stage;
}

function IBT_TrimGeraltBeard() : bool
{
	var components		: array< CComponent >;
	var headManager		: CHeadManagerComponent;
	var destBeardStage	: int;

	components = thePlayer.GetComponentsByClassName( 'CHeadManagerComponent' );
	headManager = ( ( CHeadManagerComponent ) components[0] );

	if( IBT_IsDLCBeard() )
	{
		destBeardStage = 0;
	}
	else
	{
		destBeardStage = IBT_GetGeraltBeardStage() - 1;
	}

	if( destBeardStage >= 0 )
	{
		thePlayer.ClearRememberedCustomHead();
		headManager.RemoveCustomHead();
		headManager.SetBeardStage( false, destBeardStage );
		headManager.BlockGrowing( false );
		return true;
	}
	else
	{
		return false;
	}
}

function IBT_GrowGeraltBeard() : bool
{
	var components		: array< CComponent >;
	var headManager		: CHeadManagerComponent;
	var destBeardStage	: int;

	components = thePlayer.GetComponentsByClassName( 'CHeadManagerComponent' );
	headManager = ( ( CHeadManagerComponent ) components[0] );

	if( IBT_IsDLCBeard() )
	{
		destBeardStage = 3;
	}
	else
	{
		destBeardStage = IBT_GetGeraltBeardStage() + 1;
	}

	if( destBeardStage >= 1 && destBeardStage <= 4 )
	{
		thePlayer.ClearRememberedCustomHead();
		headManager.RemoveCustomHead();
		headManager.SetBeardStage( false, destBeardStage );
		headManager.BlockGrowing( false );
		return true;
	}
	else
	{
		return false;
	}
}
