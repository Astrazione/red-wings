_display = findDisplay 46;

[
	_display,
	"Earplug Icon",
	"RW_Picture",
	[
		safeZoneX + 0.02,
		safeZoneY + safeZoneH / 2 - 0.04,
		0.06,
		0.08
	]
] call RW_fnc_Create_Control;

findDisplay 46 displayAddEventHandler ["KeyDown", {
	
	params ["_display", "_key"];
	
	if (_key == 59) then {
		
		if (round soundVolume == 0) then {
			[1, ""]
		}
		else {
			[0.1, "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa"]
		} params ["_sound", "_picture"];
		
		0.5 fadeSound _sound;
		(_display getVariable "Earplug Icon") ctrlSetText _picture;
		
		true
		
	};
	
}];