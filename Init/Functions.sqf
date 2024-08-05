[
	"Black Screen",
	"Create Control",
	"Create Text",
	"Landing EH"
] apply {
	
	_name = "LTDM_fnc_" + (_x regexReplace [" ", "_"]);
	_path = "Functions\" + _x + ".sqf";
	missionNamespace setVariable [_name, compile preprocessFile _path];
	
};