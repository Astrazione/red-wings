_display = findDisplay 46;

_layout_width = 0.5;
_layout_height = 0.08;

_group = [
	_display,
	"",
	"LTDM_class_Group",
	[
		safeZoneX + 0.5 * safeZoneW - _layout_width / 2,
		safeZoneY + safeZoneH - 4 * _layout_height,
		_layout_width,
		_layout_height
	]
] call LTDM_fnc_Create_Control;

[
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

_progress = [
	_group,
	"",
	"LTDM_class_Progress",
	[
		0,
		0,
		_layout_width,
		_layout_height
	]
] call LTDM_fnc_Create_Control;

_text_panel = [
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



[_group, _progress, _text_panel]