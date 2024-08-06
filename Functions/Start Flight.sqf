if (not isNil "Helicopter" and Helicopter != objNull) then
{
    deleteVehicle Helicopter;
};

_helicopter_classname = Helicopters # RW_SelectedVehicleIndex get "Classname";
_start_height = Heights # RW_SelectedHeightIndex;
_start_speed = Speeds # RW_SelectedSpeedIndex;
_start_pos = markerPos RW_MapMarker;
_start_dir = markerDir RW_MapMarker;
_start_pos set [2, _start_height];

player enableSimulation true;
player enableDynamicSimulation true;
player allowDamage true;
Helicopter = createVehicle [_helicopter_classname, [0, 0, 1000], [], 0, "FLY"];
Helicopter setPosATL _start_pos;
Helicopter setDir _start_dir;

player moveInDriver Helicopter;

Helicopter setVelocityModelSpace [0, _start_speed / 3.6, 0];

Helicopter addAction [format ["<t color='#10FF10'>%1</t>", localize ""], { Helicopter setDamage 0; Helicopter setFuel 1 }, nil, 9, false, true];
Helicopter addAction [format ["<t color='#FF1010'>%1</t>", localize ""], { call RW_fnc_Start_Flight }, nil, 8, false, true];