function TrimGeraltBeard()
{
	var acs : array< CComponent >;
	var head: name;
	var customHead: name;
	var destStage: int;
	
	acs = thePlayer.GetComponentsByClassName( 'CHeadManagerComponent' );
	head = ( ( CHeadManagerComponent ) acs[0] ).GetCurHeadName();
	customHead = thePlayer.GetRememberedCustomHead();

	if( IsNameValid( customHead ) )
		destStage = 0;
	else if( head == 'head_2' || head == 'head_2_tattoo' || head == 'head_2_mark' || head == 'head_2_mark_tattoo' )
		destStage = 1;
	else if( head == 'head_3' || head == 'head_3_tattoo' || head == 'head_3_mark' || head == 'head_3_mark_tattoo' )
		destStage = 2;
	else if( head == 'head_4' || head == 'head_4_tattoo' || head == 'head_4_mark' || head == 'head_4_mark_tattoo' )
		destStage = 3;
	else
		destStage = 0;
	
	thePlayer.ClearRememberedCustomHead();
	( ( CHeadManagerComponent ) acs[0] ).RemoveCustomHead();

	( ( CHeadManagerComponent ) acs[0] ).SetBeardStage( 0, destStage );
	( ( CHeadManagerComponent ) acs[0] ).BlockGrowing( false );
}