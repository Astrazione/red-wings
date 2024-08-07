params [
	"_display_or_group",
	"_name",
	"_class",
	"_position",
	["_frame_params", ["", 0]]
];

switch (typeName _display_or_group) do {
	case ("DISPLAY"): { [_display_or_group, controlNull] };
	case ("CONTROL"): {[ctrlParent _display_or_group, _display_or_group]};
} params ["_display", "_group"];

private _control = _display ctrlCreate [_class, -1, _group];

_control ctrlSetPosition _position;
_control ctrlCommit 0;

if (_name != "") then { _display_or_group setVariable [_name, _control]; };

_frame_params params ["_frame", "_width"];

if (_frame != "") then {
	
	private _delta = switch (_frame) do {
		case ("inner"): { 0 };
		case ("outer"): { _width };
		case ("middle"): { _width / 2 };
	};
	
	private _left = _display ctrlCreate ["RW_Frame", -1, _group];
	private _top = _display ctrlCreate ["RW_Frame", -1, _group];
	private _right = _display ctrlCreate ["RW_Frame", -1, _group];
	private _bottom = _display ctrlCreate ["RW_Frame", -1, _group];
	
	_left ctrlSetPosition [
		_position # 0 - _delta,
		_position # 1 - 4/3 * _delta,
		_width,
		_position # 3 + 8/3 * _delta
	];
	_top ctrlSetPosition [
		_position # 0 - _delta,
		_position # 1 - 4/3 * _delta,
		_position # 2 + 2 * _delta,
		4/3 * _width
	];
	_right ctrlSetPosition [
		_position # 0 + _position # 2 -_width + _delta,
		_position # 1 - 4/3 * _delta,
		_width,
		_position # 3 + 8/3 * _delta
	];
	_bottom ctrlSetPosition [
		_position # 0 - _delta,
		_position # 1 + _position # 3 - 4/3 * _width + 4/3 * _delta,
		_position # 2 + 2 * _delta,
		4/3 * _width
	];
	
	[_left, _top, _right, _bottom] apply {
		_x ctrlSetPixelPrecision 2;
		_x ctrlCommit 0;
	};
	
};

_control