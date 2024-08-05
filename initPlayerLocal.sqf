isNil compile preprocessFile "Init\Functions.sqf";
isNil compile preprocessFile "Init\Configs.sqf";
isNil compile preprocessFile "Init\Respawn.sqf";
[] spawn compile preprocessFile "Init\Lobby.sqf";
[] spawn compile preprocessFile "Init\HUD.sqf";



//////////////////////////////////////////////////////////	 DEBUG	//////////////////////////////////////////////////////////
[] spawn {
	while {isServer or not isMultiplayer} do {
		
		waitUntil { not isNull (findDisplay 49) };
		
		_display = findDisplay 49;
		
		_recompile = _display ctrlCreate ["RscButton", 74001];
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
		
		_recompile_global = _display ctrlCreate ["RscButton", 74002];
		_recompile_global ctrlSetPosition [
			safeZoneX + safeZoneW / 2,
			safeZoneY,
			0.2,
			0.1
		];
		_recompile_global ctrlCommit 0;
		_recompile_global ctrlSetText "RECOMPILE GLOBAL";
		_recompile_global ctrlAddEventHandler ["ButtonClick", {
			
			call (compile preprocessFile "Init\Functions.sqf");
			call (compile preprocessFile "Init\Configs.sqf");
			
			{
				publicVariable _x;
			} forEach ((allVariables missionNamespace) select {"ltdm" in _x});
			
			LTDM_Classes_BLUE = [
				call compile preprocessFile "Configs\Blue\Rifleman.sqf",
				call compile preprocessFile "Configs\Blue\Mercenary.sqf",
				call compile preprocessFile "Configs\Blue\Scout.sqf",
				call compile preprocessFile "Configs\Blue\Breacher.sqf",
				call compile preprocessFile "Configs\Blue\Explosive.sqf",
				call compile preprocessFile "Configs\Blue\Machinegunner.sqf",
				call compile preprocessFile "Configs\Blue\Shield.sqf",
				call compile preprocessFile "Configs\Blue\John Wick.sqf"
			];
			
			LTDM_Classes_RED = [
				call compile preprocessFile "Configs\Red\Rifleman.sqf",
				call compile preprocessFile "Configs\Red\Mercenary.sqf",
				call compile preprocessFile "Configs\Red\Scout.sqf",
				call compile preprocessFile "Configs\Red\Breacher.sqf",
				call compile preprocessFile "Configs\Red\Explosive.sqf",
				call compile preprocessFile "Configs\Red\Machinegunner.sqf",
				call compile preprocessFile "Configs\Red\Shield.sqf"
			];
			
			[[LTDM_Classes_BLUE, LTDM_Classes_RED], {
				params ["_classes_blue", "_classes_red"];
				LTDM_Classes = switch (side player) do {
					case (blufor): { _classes_blue };
					case (opfor): { _classes_red };
				};
				hintSilent "REFRESHED";
			}] remoteExec ["call"];
			
		}];
		
		_icon_viewer = _display ctrlCreate ["RscButton", 74003];
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
		
		_arsenal = _display ctrlCreate ["RscButton", 74004];
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