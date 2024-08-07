params [
	"_raw_text",
	["_size", 1],
	["_properties", ""]
];

private _size = format [" size='%1' ", _size];
private _color = " color='#00AAFF' ";
private _align = " align='center' ";
private _shadow = " shadow='2' ";

if ("red" in _properties) then { _color = " color='#FF1010' "; };
if ("green" in _properties) then { _color = " color='#10FF10' "; };
if ("light" in _properties) then { _color = " color='#00C6FF' "; };

if ("left" in _properties) then { _align = " align='left' "; };
if ("right" in _properties) then { _align = " align='right' "; };

private _text = (
	"<t font='RobotoCondensedBold' "
	+ _size
	+ _color
	+ _shadow
	+ _align
	+ ">"
	+ _raw_text
	+ "</t>"
);

_text