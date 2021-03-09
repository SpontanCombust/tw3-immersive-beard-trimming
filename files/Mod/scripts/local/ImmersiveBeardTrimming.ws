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
			stage = 0;
	}

	return stage;
}

function IBT_TrimGeraltBeard()
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

	// used by vanilla's RemoveCustomHead, so I assume it should work
	thePlayer.ClearRememberedCustomHead();
	headManager.RemoveCustomHead();

	headManager.SetBeardStage( false, Max( 0, destBeardStage ) );
	headManager.BlockGrowing( false );
}

function IBT_GrowGeraltBeard()
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

	// used by vanilla's RemoveCustomHead, so I assume it should work
	thePlayer.ClearRememberedCustomHead();
	headManager.RemoveCustomHead();

	headManager.SetBeardStage( false, Min( 4, destBeardStage ) );
	headManager.BlockGrowing( false );
}

enum IBT_EHairLength
{
	IBT_HL_VeryShort,
	IBT_HL_Short,
	IBT_HL_Long,
	IBT_HL_Invalid
}

function IBT_HairNameToLength( hairName : name ) : IBT_EHairLength
{
	switch( hairName )
	{
		case 'Mohawk With Ponytail Hairstyle':
			return IBT_HL_VeryShort;
		case 'Short Loose Hairstyle':
		case 'Shaved With Tail Hairstyle':
		case 'Nilfgaardian Hairstyle':
			return IBT_HL_Short;
		case 'Half With Tail Hairstyle':
		case 'Long Loose Hairstyle':
			return IBT_HL_Long;
		default:
			return IBT_HL_Invalid;
	}
}

function IBT_GetGeraltHairLength() : IBT_EHairLength
{
	var inv 		: CInventoryComponent;
	var ids			: array<SItemUniqueId>;
	var i			: int;
	var size		: int;
	var length		: IBT_EHairLength;
	var hairName	: name;

	inv = GetWitcherPlayer().GetInventory();
	ids = inv.GetItemsByCategory( 'hair' );
	size = ids.Size();
	length = IBT_HL_Invalid;

	if( size > 0 )
	{
		for(i = 0; i < size; i += 1)
		{
			if( inv.IsItemMounted( ids[i] ) )
			{
				hairName = inv.GetItemName( ids[i] );
				length = IBT_HairNameToLength( hairName );
				break;
			}
		}
	}

	return length;
}
