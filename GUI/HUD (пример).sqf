_display = findDisplay 46;

_layout_width = 0.2;
_layout_height = 0.08;

_group = [
	_display,
	"",
	"LTDM_class_Group",
	[
		safeZoneX + 0.5 * safeZoneW - 1.1 * _layout_width,
		safeZoneY,
		2.2 * _layout_width,
		_layout_height
	]
] call LTDM_fnc_Create_Control;

_background_blue = [
	_group,
	"",
	"LTDM_class_Background",
	[
		0,
		0,
		_layout_width,
		_layout_height
	],
	["inner", 0.003]
] call LTDM_fnc_Create_Control;

_background_red = [
	_group,
	"",
	"LTDM_class_Background",
	[
		1.2 * _layout_width,
		0,
		_layout_width,
		_layout_height
	],
	["inner", 0.003]
] call LTDM_fnc_Create_Control;

_text_panel_blue = [
	_group,
	"",
	"LTDM_class_Text",
	[
		0,
		0,
		_layout_width,
		_layout_height
	]
] call LTDM_fnc_Create_Control;

_text_panel_red = [
	_group,
	"",
	"LTDM_class_Text",
	[
		1.2 * _layout_width,
		0,
		_layout_width,
		_layout_height
	]
] call LTDM_fnc_Create_Control;

_background_blue ctrlSetBackgroundColor [0,0.3,0.6,0.3];
_background_red ctrlSetBackgroundColor [0.5,0,0,0.3];

_background_blue ctrlCommit 0;
_background_red ctrlCommit 0;



[_text_panel_blue, _text_panel_red]