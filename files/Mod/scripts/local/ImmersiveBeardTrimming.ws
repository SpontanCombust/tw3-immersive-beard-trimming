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

exec function IBT_hl()
{
	var length	: IBT_EHairLength;

	length = IBT_GetGeraltHairLength();
	theGame.GetGuiManager().ShowNotification("Hair length: " + length);
}