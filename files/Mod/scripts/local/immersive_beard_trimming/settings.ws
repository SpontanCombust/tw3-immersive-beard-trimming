// Code generated using Mod Settings Framework v0.6.0 by SpontanCombust & Aeltoth

class IBT_Settings extends ISettingsMaster
{
	default modVersion = "3.0.0";

	public var HairLength : IBT_Settings_HairLength;

	protected /* override */ function Parser_Init() : void
	{
		HairLength = new IBT_Settings_HairLength in this;
		HairLength.Init(this);
		m_groups.PushBack(HairLength);
	}

	protected /* override */ function Parser_ShouldResetSettingsToDefaultOnInit(config : CInGameConfigWrapper) : bool
	{
		return ReadSettingValue(config, 'IBTHairLength','HalfWithTail') == "-1";
	}
}

class IBT_Settings_HairLength extends ISettingsGroup
{
	public var HalfWithTail : IBT_HairLength;
	public var ShavedWithTail : IBT_HairLength;
	public var LongLoose : IBT_HairLength;
	public var ShortLoose : IBT_HairLength;
	public var MohawkWithPonytail : IBT_HairLength;
	public var Nilfgaardian : IBT_HairLength;

	default id = 'IBTHairLength';
	default defaultPresetIndex = 0;

	protected /* override */ function Parser_ValidateSettings() : void
	{
		HalfWithTail = (IBT_HairLength)Clamp((int)HalfWithTail, 0, 2);
		ShavedWithTail = (IBT_HairLength)Clamp((int)ShavedWithTail, 0, 2);
		LongLoose = (IBT_HairLength)Clamp((int)LongLoose, 0, 2);
		ShortLoose = (IBT_HairLength)Clamp((int)ShortLoose, 0, 2);
		MohawkWithPonytail = (IBT_HairLength)Clamp((int)MohawkWithPonytail, 0, 2);
		Nilfgaardian = (IBT_HairLength)Clamp((int)Nilfgaardian, 0, 2);
	}

	protected /* override */ function Parser_ReadSettings(config: CInGameConfigWrapper) : void
	{
		HalfWithTail = (IBT_HairLength)ReadIntSettingValue(config, 'HalfWithTail');
		ShavedWithTail = (IBT_HairLength)ReadIntSettingValue(config, 'ShavedWithTail');
		LongLoose = (IBT_HairLength)ReadIntSettingValue(config, 'LongLoose');
		ShortLoose = (IBT_HairLength)ReadIntSettingValue(config, 'ShortLoose');
		MohawkWithPonytail = (IBT_HairLength)ReadIntSettingValue(config, 'MohawkWithPonytail');
		Nilfgaardian = (IBT_HairLength)ReadIntSettingValue(config, 'Nilfgaardian');
	}

	protected /* override */ function Parser_WriteSettings(config: CInGameConfigWrapper) : void
	{
		WriteIntSettingValue(config, 'HalfWithTail', (int)HalfWithTail);
		WriteIntSettingValue(config, 'ShavedWithTail', (int)ShavedWithTail);
		WriteIntSettingValue(config, 'LongLoose', (int)LongLoose);
		WriteIntSettingValue(config, 'ShortLoose', (int)ShortLoose);
		WriteIntSettingValue(config, 'MohawkWithPonytail', (int)MohawkWithPonytail);
		WriteIntSettingValue(config, 'Nilfgaardian', (int)Nilfgaardian);
	}
}

enum IBT_HairLength
{
	IBT_HairLengthShort = 0,
	IBT_HairLengthMedium = 1,
	IBT_HairLengthLong = 2,
}


function GetIBT_Settings() : IBT_Settings
{
	var settings: IBT_Settings;

	settings = (IBT_Settings)GetSettingsMasterRegistry().GetSettings('IBT_Settings');
	if(!settings)
	{
		settings = new IBT_Settings in theGame;
		GetSettingsMasterRegistry().AddSettings(settings, 'IBT_Settings');
	}

	return settings;
}
