function IBT_TrimGeraltBeard()
{
	var components	: array< CComponent >;
	var headManager	: CHeadManagerComponent;
	var curHead		: name;
	var customHead	: name;
	var destStage	: int;
	
	components = thePlayer.GetComponentsByClassName( 'CHeadManagerComponent' );
	headManager = ( ( CHeadManagerComponent ) components[0] );
	curHead = headManager.GetCurHeadName();
	customHead = thePlayer.GetRememberedCustomHead();

	if( IsNameValid( customHead ) )
		destStage = 0;
	else if( curHead == 'head_2' || curHead == 'head_2_tattoo' || curHead == 'head_2_mark' || curHead == 'head_2_mark_tattoo' )
		destStage = 1;
	else if( curHead == 'head_3' || curHead == 'head_3_tattoo' || curHead == 'head_3_mark' || curHead == 'head_3_mark_tattoo' )
		destStage = 2;
	else if( curHead == 'head_4' || curHead == 'head_4_tattoo' || curHead == 'head_4_mark' || curHead == 'head_4_mark_tattoo' )
		destStage = 3;
	else
		destStage = 0;
	
	thePlayer.ClearRememberedCustomHead();
	headManager.RemoveCustomHead();

	headManager.SetBeardStage( 0, destStage );
	headManager.BlockGrowing( false );
}