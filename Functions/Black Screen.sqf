params ["_duration", "_fade_out_time"];

_black_screen = findDisplay 46 ctrlCreate ["IGUIBack", -1];
_black_screen ctrlSetPosition [safeZoneX, safeZoneY, safeZoneW, safeZoneH];
_black_screen ctrlCommit 0;
_black_screen ctrlSetBackgroundColor [0,0,0,1];

[_black_screen, time, _duration, _fade_out_time] spawn {
	
	params ["_black_screen", "_start_time", "_duration", "_fade_out_time"];
	
	sleep _duration;
	
	waitUntil {
		_alpha = linearConversion [
			_start_time + _duration,
			_start_time + _duration + _fade_out_time,
			time,
			1,
			0,
			true
		];
		_black_screen ctrlSetBackgroundColor [0,0,0,_alpha];
		time > _start_time + _duration + _fade_out_time;
	};
	
	ctrlDelete _black_screen;
	
};