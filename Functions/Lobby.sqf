_display = call compile preprocessFile "GUI\Lobby.sqf";

_vehicle_combo = _display getVariable "Vehicle Combo";
_height_combo = _display getVariable "Height Combo";
_speed_combo = _display getVariable "Speed Combo";
_start_button = _display getVariable "Start Button";
_map = _display getVariable "Lobby Map";

RW_Helicopters apply {
	_classname = _x get "Classname";
    _vehicle_combo lbAdd getText (configFile >> "CfgVehicles" >> _classname >> "displayName")
};

RW_Heights apply {
	_text = [str _x, localize "STR_RW_M"] joinString " ";
    _height_combo lbAdd _text;
};

RW_Speeds apply {
	_text = [str _x, localize "STR_RW_KMH"] joinString " ";
    _speed_combo lbAdd _text;
};

_vehicle_combo ctrlAddEventHandler ["LBSelChanged", {
    params ["_combo", "_index"];
    _display = ctrlParent _combo;
	_picture = _display getVariable "Vehicle Picture";
	_picture ctrlSetText (RW_Helicopters # _index get "Picture");
	_picture ctrlSetTextColor [0, 0.666, 1, 1];
	player setVariable ["RW_SelectedVehicleIndex", _index];
}];

_height_combo ctrlAddEventHandler ["LBSelChanged", {
    params ["_combo", "_index"];
    player setVariable ["RW_SelectedHeightIndex", _index];
}];

_speed_combo ctrlAddEventHandler ["LBSelChanged", {
    params ["_combo", "_index"];
	player setVariable ["RW_SelectedSpeedIndex", _index];
}];

_start_button ctrlAddEventHandler ["ButtonClick", {
	params ["_button"];
	(ctrlParent _button) closeDisplay 1;
	call RW_fnc_Start_Flight;
}];

_map ctrlAddEventHandler ["MouseMoving", {
	params ["_map", "_xPos", "_yPos", "_mouseIn"];
	_map ctrlMapCursor ["", ["Arrow", "Track"] select _mouseIn];
	if (_map getVariable ["LeftClick", false]) then {
		_spawn_pos = player getVariable "RW_SpawnPos";
		_cursor_pos = _map ctrlMapScreenToWorld [_xPos, _yPos];
		_dir = _spawn_pos getDir _cursor_pos;
		player setVariable ["RW_SpawnDir", _dir];
	};
}];

_map ctrlAddEventHandler ["MouseButtonDown", {
	params ["_map", "_button", "_xPos", "_yPos"];
	if (_button == 0) then {
		_map setVariable ["LeftClick", true];
		player setVariable ["RW_SpawnPos", _map ctrlMapScreenToWorld [_xPos, _yPos]];
	};
}];

_map ctrlAddEventHandler ["MouseButtonUp", {
	params ["_map", "_button", "_xPos", "_yPos"];
	if (_button == 0) then {
		_map setVariable ["LeftClick", false];
	};
}];

_map ctrlAddEventHandler ["Draw", {
	params ["_map"];
	_size = linearConversion [1, 0.001, ctrlMapScale _map, 15, 50, true];
	_map drawIcon [
		RW_Helicopters # (player getVariable "RW_SelectedVehicleIndex") get "Map Icon",
		[1,1,1,1],
		player getVariable "RW_SpawnPos",
		_size,
		_size,
		player getVariable "RW_SpawnDir",
		"",
		2
	];
}];

_vehicle_combo lbSetCurSel (player getVariable "RW_SelectedVehicleIndex");
_height_combo lbSetCurSel (player getVariable "RW_SelectedHeightIndex");
_speed_combo lbSetCurSel (player getVariable "RW_SelectedSpeedIndex");