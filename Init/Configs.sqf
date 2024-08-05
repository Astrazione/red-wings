call compile preprocessFile "Configs\Weapons.sqf";

LTDM_Classes = switch (side player) do {
	case (blufor): {[
		call compile preprocessFile "Configs\Blue\Rifleman.sqf",
		call compile preprocessFile "Configs\Blue\Mercenary.sqf",
		call compile preprocessFile "Configs\Blue\Scout.sqf",
		call compile preprocessFile "Configs\Blue\Breacher.sqf",
		call compile preprocessFile "Configs\Blue\Explosive.sqf",
		call compile preprocessFile "Configs\Blue\Machinegunner.sqf",
		call compile preprocessFile "Configs\Blue\Shield.sqf",
		call compile preprocessFile "Configs\Blue\John Wick.sqf"
	]};
	case (opfor): {[
		call compile preprocessFile "Configs\Red\Rifleman.sqf",
		call compile preprocessFile "Configs\Red\Mercenary.sqf",
		call compile preprocessFile "Configs\Red\Scout.sqf",
		call compile preprocessFile "Configs\Red\Breacher.sqf",
		call compile preprocessFile "Configs\Red\Explosive.sqf",
		call compile preprocessFile "Configs\Red\Machinegunner.sqf",
		call compile preprocessFile "Configs\Red\Shield.sqf"
	]};
};