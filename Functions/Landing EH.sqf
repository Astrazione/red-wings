params ["_heli"];
	
	_heli setVariable ["RW_Fly_Time", time];
	_heli setVariable ["RW_Landed", false];
	
	addMissionEventHandler ["EachFrame", {
		
		_thisArgs params ["_heli"];
		
		if (not alive _heli) exitWith {
			removeMissionEventHandler [_thisEvent, _thisEventHandler];
		};
		
		_height = getPos _heli # 2;
		_speed = vectorMagnitude velocity _heli;
		_landed = _heli getVariable "RW_Landed";
		
		if (_height > 1.2 or _speed > 4 or _landed) exitWith {
			_heli setVariable ["RW_Fly_Time", time];
			_heli setVariable ["RW_Landed", false];
		};
		
		if (time > (_heli getVariable "RW_Fly_Time") + 5) then {
			_heli setVariable ["RW_Landed", true];
			systemChat "LANDED";
		};
		
	}, _this];