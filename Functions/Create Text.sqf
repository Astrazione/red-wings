//	упрощает создание текста

params [
	"_raw_text",
	["_size", 1],
	["_properties", ""]
];

private _size = format [" size='%1' ", _size];
private _color = " color='#FFAA00' ";
private _align = " align='center' ";
private _shadow = " shadow='2' ";

if ("blue" in _properties) then { _color = " color='#0000FF' "; };
if ("red" in _properties) then { _color = " color='#FF0000' "; };
if ("yellow" in _properties) then { _color = " color='#FFFF00' "; };
if ("dark" in _properties) then { _color = " color='#7F5500' "; };

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