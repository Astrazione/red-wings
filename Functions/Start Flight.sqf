deleteVehicle (player getVariable "RW_ActiveHeli");

_vehicle_index = player getVariable "RW_SelectedVehicleIndex";
_height_index = player getVariable "RW_SelectedHeightIndex";
_speed_index = player getVariable "RW_SelectedSpeedIndex";

_helicopter_classname = RW_Helicopters # _vehicle_index get "Classname";
_start_height = RW_Heights # _height_index;
_start_speed = RW_Speeds # _speed_index;
_start_pos = player getVariable "RW_SpawnPos";
_start_dir = player getVariable "RW_SpawnDir";
_start_pos set [2, _start_height];

player enableSimulation true;
player allowDamage true;
_heli = createVehicle [_helicopter_classname, [0, 0, 1000], [], 0, "FLY"];
_heli setPos _start_pos;
_heli setDir _start_dir;

player moveInDriver _heli;

_heli setVelocityModelSpace [0, _start_speed / 3.6, 0];

_heli addAction [
	[localize "STR_RW_Repair", 1, "left green"] call RW_fnc_Create_Text,
	{ _heli = param[0]; _heli setDamage 0; _heli setFuel 1 },
	nil,
	9,
	false,
	true
];
_heli addAction [
	[localize "STR_RW_Restart", 1, "left red"] call RW_fnc_Create_Text,
	{ isNil RW_fnc_Start_Flight },
	nil,
	8,
	false,
	true
];

player setVariable ["RW_ActiveHeli", _heli];