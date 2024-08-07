player addEventHandler ["Respawn", {
	
	player allowDamage false;
	player enableSimulation false;
	
    player addAction [
		[localize "STR_RW_Start", 1, "left"] call RW_fnc_Create_Text,
		{ isNil RW_fnc_Lobby },
		nil,
		10,
		false,
		false
	];
	
	call RW_fnc_Start_Flight;
	
}];