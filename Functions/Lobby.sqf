_display = call compile preprocessFile "GUI\Lobby.sqf";

_vehicle_combo = _display getVariable "Vehicle Combo";
_flight_height_combo = _display getVariable "Flight Height Combo";
_flight_speed_combo = _display getVariable "Flight Speed Combo";
_start_button = _display getVariable "Start Button";
_map = _display getVariable "Lobby Map";

Helicopters apply {
    _vehicle_combo lbAdd getText (configFile >> "CfgVehicles" >> _x >> "displayName")
};

Heights apply {
    _flight_height_combo lbAdd str _x;
};

Speeds apply {
    _flight_speed_combo lbAdd str _x;
};


_vehicle_combo lbSetCurSel (missionNamespace getVariable ["RW_SelectedVehicleIndex", 0]);
_flight_height_combo lbSetCurSel (missionNamespace getVariable ["RW_SelectedHeightIndex", 0]);
_flight_speed_combo lbSetCurSel (missionNamespace getVariable ["RW_SelectedSpeedIndex", 0]);

_vehicle_combo ctrlAddEventHandler ["LBSelChanged", {
    params["_combo", "_index"];
    _display = ctrlParent _combo;
    RW_SelectedVehicleIndex = _index;
}];

_flight_height_combo ctrlAddEventHandler ["LBSelChanged", {
    params["_combo", "_index"];
    RW_SelectedHeightIndex = _index;
}];

_flight_speed_combo ctrlAddEventHandler ["LBSelChanged", {
    params["_combo", "_index"];
    RW_SelectedSpeedIndex = _index;
}];

_start_button ctrlAddEventHandler ["ButtonClick", {
    call RW_fnc_Start_Flight;
}];

_map ctrlAddEventHandler ["MouseMoving", {
	params [
		["_map",controlNull, [controlNull]],
		["_xPos",-1,[0]],
		["_yPos",-1,[0]],
		["_mouseIn", false, [true]]
	];

	if (_mouseIn) then {
		_map ctrlMapCursor ["", "Track"];
	} else {
		_map ctrlMapCursor ["", "Arrow"];
	};

    if (RW_IsMarkerSpinAvailable) then {
		
		_marker_pos = markerPos RW_MapMarker;
		_pos = _map ctrlMapScreenToWorld [_xPos, _yPos];
		_angle = _marker_pos getDir _pos;
		RW_MapMarker setMarkerDirLocal _angle;
    };
}];

_map ctrlAddEventHandler ["MouseButtonDown", {
	params ["_map", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
	
	if (_button != 0) exitWith {};

	_pos = _map ctrlMapScreenToWorld [_xPos, _yPos];
	private "_prev_angle";

    if (not isNil "RW_MapMarker") then
    {
		_prev_angle = markerDir RW_MapMarker;
        deleteMarkerLocal RW_MapMarker;
    };

	_local_marker = createMarkerLocal ["markername", _pos];
	_local_marker setMarkerShapeLocal "ICON";
	_local_marker setMarkerTypeLocal "hd_arrow_noShadow";
	_local_marker setMarkerDirLocal _prev_angle;
    RW_MapMarker = _local_marker;
    RW_IsMarkerSpinAvailable = true;
}];

_map ctrlAddEventHandler ["MouseButtonUp", {
	params ["_map", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
    RW_IsMarkerSpinAvailable = false;
}];