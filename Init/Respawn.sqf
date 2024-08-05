player addEventHandler ["Respawn", {
	player allowDamage false;
	call LTDM_fnc_Give_Loadout;
}];