isNil compile preprocessFile "Init\Functions.sqf";
isNil compile preprocessFile "Init\Configs.sqf";
isNil compile preprocessFile "Init\Respawn.sqf";
[] spawn compile preprocessFile "Init\Lobby.sqf";
[] spawn compile preprocessFile "Init\HUD.sqf";

