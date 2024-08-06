player addEventHandler ["Respawn", {
	player allowDamage false;
	player enableSimulation false;
    player addAction ["<t color='#1010FF'>Open config menu</t>", { call RW_fnc_Lobby }, nil, 10, false, true];
    
    if (not isNil "Helicopter") 
    then { call RW_fnc_Start_Flight }
    else { call RW_fnc_Lobby };
}];