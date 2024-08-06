_display = createDialog ["RscDisplayEmpty", true];

_main_wh_gap = 0.02;
_interelement_gap = 0.01;

_k = 4 / 3;
_border = 0.002;

_main_left = 0;
_main_top = _main_left * _k;
_main_bottom = 1;
_main_right = 1;

_vehicle_icon_width = 0.2;
_combo_height = 0.05;

[	//главный бэкграунд
	_display,
	"",
	"RW_Background",
	[
		0,
		0,
		1,
		1
	],
	["inner", 0.003]
] call RW_fnc_Create_Control;
_main_left_layout = _main_left + _main_wh_gap;



_heli_text = [	//надпись вертолёт
	_display,
	"Vehicle Text",
	"RW_Text",
	[
		_main_left_layout,
		_main_top + _main_wh_gap * _k,
		_vehicle_icon_width,
		_combo_height
	]
] call RW_fnc_Create_Control;

_map_text = [	//надпись карты
	_display,
	"Map Text",
	"RW_Text",
	[
		_main_left_layout + _vehicle_icon_width + _main_wh_gap,
		_main_top + _main_wh_gap * _k,
		_main_right - _vehicle_icon_width - 3 * _main_wh_gap,
		_combo_height
	]
] call RW_fnc_Create_Control;


[	//иконка техники
	_display,
	"Vehicle Picture",
	"RW_Picture",
	[
		_main_left_layout,
		_main_top + (_interelement_gap + _main_wh_gap) * _k + _combo_height,
		_vehicle_icon_width,
		_vehicle_icon_width * _k
	],
	["outer", _border]
] call RW_fnc_Create_Control;

[	//combobox техники
	_display,
	"Vehicle Combo",
	"RW_Combo",
	[
		_main_left_layout,
		_main_top + (_main_wh_gap + 2 * _interelement_gap + _vehicle_icon_width) * _k + _combo_height,
		_vehicle_icon_width,
		_combo_height
	],
	["outer", _border]
] call RW_fnc_Create_Control;

_flight_height_text = [	//текст высоты полёта
	_display,
	"Flight Height Text",
	"RW_Text",
	[
		_main_left_layout,
		_main_top + (2 * _main_wh_gap + 2 * _interelement_gap + _vehicle_icon_width) * _k + 2 * _combo_height,
		_vehicle_icon_width,
		_combo_height
	]
] call RW_fnc_Create_Control;

[	//combobox высоты полёта
	_display,
	"Flight Height Combo",
	"RW_Combo",
	[
		_main_left_layout,
		_main_top + (2 * _main_wh_gap + 3 * _interelement_gap + _vehicle_icon_width) * _k + 3 * _combo_height,
		_vehicle_icon_width,
		_combo_height
	],
	["outer", _border]
] call RW_fnc_Create_Control;

_flight_speed_text = [	//текст начальной скорости полёта
	_display,
	"Flight Speed Text",
	"RW_Text",
	[
		_main_left_layout,
		_main_top + (3 * _main_wh_gap + 3 *_interelement_gap + _vehicle_icon_width) * _k + 4 * _combo_height,
		_vehicle_icon_width,
		_combo_height
	]
] call RW_fnc_Create_Control;

[	//combobox скорости полёта
	_display,
	"Flight Speed Combo",
	"RW_Combo",
	[
		_main_left_layout,
		_main_top + (3 * _main_wh_gap + 4 *_interelement_gap + _vehicle_icon_width) * _k + 5 * _combo_height,
		_vehicle_icon_width,
		_combo_height
	],
	["outer", _border]
] call RW_fnc_Create_Control;

_start_button = [	//кнопка начать
	_display,
	"Start Button",
	"RW_Button",
	[
		_main_left_layout,
		_main_bottom - 2 * _combo_height - _main_wh_gap * _k,
		_vehicle_icon_width,
		2 * _combo_height
	],
	["outer", _border]
] call RW_fnc_Create_Control;

_map = [	//карта с выбором точки спавна
	_display,
	"Lobby Map",
	"RscMapControl",
	[
	_main_left_layout + _vehicle_icon_width + _main_wh_gap,
	_main_top + _main_wh_gap * _k + _combo_height + _interelement_gap,
	_main_right - _vehicle_icon_width - 3 * _main_wh_gap,
	_main_bottom - _main_top - 2 * _main_wh_gap * _k - _combo_height - _interelement_gap
	],
	["outer", _border]
] call RW_fnc_Create_Control;

_map ctrlMapSetPosition [
	_main_left_layout + _vehicle_icon_width + _main_wh_gap,
	_main_top + _main_wh_gap * _k + _combo_height + _interelement_gap,
	_main_right - _vehicle_icon_width - 3 * _main_wh_gap,
	_main_bottom - _main_top - 2 * _main_wh_gap * _k - _combo_height - _interelement_gap
];

_map ctrlMapAnimAdd [0, 1, [worldSize / 2, worldSize / 2]];
ctrlMapAnimCommit _map;

_heli_text ctrlSetStructuredText parseText ([localize "STR_RW_HelicopterText"] call RW_fnc_Create_Text);
_map_text ctrlSetStructuredText parseText ([localize "STR_RW_MapText"] call RW_fnc_Create_Text);
_flight_height_text ctrlSetStructuredText parseText ([localize "STR_RW_FlightHeight"] call RW_fnc_Create_Text);
_flight_speed_text ctrlSetStructuredText parseText ([localize "STR_RW_FlightSpeed"] call RW_fnc_Create_Text);
_start_button ctrlSetText localize "STR_RW_StartButton";

_display