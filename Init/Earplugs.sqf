_display = findDisplay 46;

_picture = [
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
_picture ctrlSetText "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_sound_off_ca.paa";
_picture ctrlSetTextColor [0, 0.666, 1, 1];
_picture ctrlShow false;

findDisplay 46 displayAddEventHandler ["KeyDown", {
	params ["_display", "_key"];
	if (_key == 59) then {
		_earplugs_on = soundVolume == 0.1;
		0.5 fadeSound ([0.1, 1] select _earplugs_on);
		(_display getVariable "Earplug Icon") ctrlShow not _earplugs_on;
		true
	};
}];