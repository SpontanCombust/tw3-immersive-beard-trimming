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







enum IBT_EHairType
{
	IBT_HT_Unknown		= 0,
	IBT_HT_ShortBand	= 1,
	IBT_HT_ShortNoBand	= 2,
	IBT_HT_LongBand		= 3,
	IBT_HT_LongNoBand	= 4
}

function IBT_HairNameToType( hairName : name ) : IBT_EHairType
{
	switch( hairName )
	{
		case 'Mohawk With Ponytail Hairstyle':
		case 'Shaved With Tail Hairstyle':
			return IBT_HT_ShortBand;
		case 'Short Loose Hairstyle':
		case 'Nilfgaardian Hairstyle':
			return IBT_HT_ShortNoBand;
		case 'Half With Tail Hairstyle':
			return IBT_HT_LongBand;
		case 'Long Loose Hairstyle':
			return IBT_HT_LongNoBand;
		default:
			return IBT_HT_Unknown;
	}
}

//TODO use menu options for conditional result
function IBT_HairTypeToName( hairType : IBT_EHairType ) : name
{
	switch( hairType )
	{
		case IBT_HT_ShortBand:
			return 'Shaved With Tail Hairstyle';
		case IBT_HT_ShortNoBand:
			return 'Short Loose Hairstyle';
		case IBT_HT_LongBand:
			return 'Half With Tail Hairstyle';
		case IBT_HT_LongNoBand:
			return 'Long Loose Hairstyle';
		default:
			return '';
	}
}

function IBT_GetGeraltHairType() : IBT_EHairType
{
	var inv 		: CInventoryComponent;
	var ids			: array<SItemUniqueId>;
	var i			: int;
	var size		: int;
	var hairType	: IBT_EHairType;
	var hairName	: name;

	inv = GetWitcherPlayer().GetInventory();
	ids = inv.GetItemsByCategory( 'hair' );
	size = ids.Size();
	hairType = IBT_HT_Unknown;

	if( size > 0 )
	{
		for(i = 0; i < size; i += 1)
		{
			if( inv.IsItemMounted( ids[i] ) )
			{
				hairName = inv.GetItemName( ids[i] );
				hairType = IBT_HairNameToType( hairName );
				break;
			}
		}
	}

	return hairType;
}

function IBT_CutGeraltHair()
{
	var hairType	: IBT_EHairType;
	var hairName	: name;
	var ids 		: array<SItemUniqueId>;

	hairType = IBT_GetGeraltHairType();
	if( hairType == IBT_HT_LongBand || hairType == IBT_HT_LongNoBand )
	{
		hairName = IBT_HairTypeToName( hairType - 2 );
		ids = thePlayer.inv.AddAnItem( hairName, 1 );
		thePlayer.EquipItem( ids[0] );
	}
}

function IBT_GrowGeraltHair()
{
	var hairType	: IBT_EHairType;
	var hairName	: name;
	var ids 		: array<SItemUniqueId>;

	hairType = IBT_GetGeraltHairType();
	if( hairType == IBT_HT_ShortBand || hairType == IBT_HT_ShortNoBand )
	{
		hairName = IBT_HairTypeToName( hairType + 2 );
		ids = thePlayer.inv.AddAnItem( hairName, 1 );
		thePlayer.EquipItem( ids[0] );
	}
}

function IBT_EquipGeraltHairBand()
{
	var hairType	: IBT_EHairType;
	var hairName	: name;
	var ids 		: array<SItemUniqueId>;

	hairType = IBT_GetGeraltHairType();
	if( hairType == IBT_HT_ShortNoBand || hairType == IBT_HT_LongNoBand )
	{
		hairName = IBT_HairTypeToName( hairType - 1 );
		ids = thePlayer.inv.AddAnItem( hairName, 1 );
		thePlayer.EquipItem( ids[0] );
	}
}

function IBT_UnequipGeraltHairBand()
{
	var hairType	: IBT_EHairType;
	var hairName	: name;
	var ids 		: array<SItemUniqueId>;

	hairType = IBT_GetGeraltHairType();
	if( hairType == IBT_HT_ShortBand || hairType == IBT_HT_LongBand )
	{
		hairName = IBT_HairTypeToName( hairType + 1 );
		ids = thePlayer.inv.AddAnItem( hairName, 1 );
		thePlayer.EquipItem( ids[0] );
	}
}