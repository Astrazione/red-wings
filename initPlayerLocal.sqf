isNil compile preprocessFile "Init\Functions.sqf";
isNil compile preprocessFile "Init\Configs.sqf";
isNil compile preprocessFile "Init\Respawn.sqf";

player addAction [
	[localize "STR_RW_Start", 1, "left"] call RW_fnc_Create_Text,
	{ isNil RW_fnc_Lobby },
	nil,
	10,
	false,
	false
];

player setVariable ["RW_SelectedVehicleIndex", 0];
player setVariable ["RW_SelectedHeightIndex", 0];
player setVariable ["RW_SelectedSpeedIndex", 0];
player setVariable ["RW_SpawnPos", [worldSize / 2, worldSize / 2]];
player setVariable ["RW_SpawnDir", 0];
player setVariable ["RW_ActiveHeli", objNull];

waitUntil { not isNull findDisplay 46 };
isNil RW_fnc_Lobby;

//////////////////////////////////////////////////////////	 DEBUG	//////////////////////////////////////////////////////////
[] spawn {
	while {isServer or not isMultiplayer} do {
		
		waitUntil { not isNull (findDisplay 49) };
		
		_display = findDisplay 49;
		
		_recompile = _display ctrlCreate ["RscButton", -1];
		_recompile ctrlSetPosition [
			safeZoneX + safeZoneW / 2 - 0.2,
			safeZoneY,
			0.2,
			0.1
		];
		_recompile ctrlCommit 0;
		_recompile ctrlSetText "RECOMPILE";
		_recompile ctrlAddEventHandler ["ButtonClick", {
			call (compile preprocessFile "Init\Functions.sqf");
			call (compile preprocessFile "Init\Configs.sqf");
		}];
		
		_icon_viewer = _display ctrlCreate ["RscButton", -1];
		_icon_viewer ctrlSetPosition [
			safeZoneX + (safeZoneW - 0.2),
			safeZoneY,
			0.2,
			0.1
		];
		_icon_viewer ctrlCommit 0;
		_icon_viewer ctrlSetText "Icon Viewer";
		_icon_viewer ctrlAddEventHandler ["ButtonClick", {
			(findDisplay 49) closeDisplay 1;
			[] spawn {
				isNil { call (profileNamespace getVariable "iw") };
			};
		}];
		
		_arsenal = _display ctrlCreate ["RscButton", -1];
		_arsenal ctrlSetPosition [
			safeZoneX,
			safeZoneY,
			0.2,
			0.1
		];
		_arsenal ctrlCommit 0;
		_arsenal ctrlSetText "Arsenal";
		_arsenal ctrlAddEventHandler ["ButtonClick", {
			(findDisplay 49) closeDisplay 1;
			[] spawn {
				isNil { ["Open", [true]] call BIS_fnc_arsenal; };
			};
		}];
		
		waitUntil { isNull (findDisplay 49) };
		
	};
};