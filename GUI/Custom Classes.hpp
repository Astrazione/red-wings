#define main_color 1,0.666,0
#define main_color_dark 0.5,0.333,0
#define main_color_darker 0.333,0.222,0
#define main_color_light 1,0.75,0
#define background_color 0.1,0.1,0.1

import ScrollBar;
import RscStructuredText;
import RscPicture;
import IGUIBack;
import RscCombo;
import RscButton;
import RscCheckBox;
import RscProgress;
import RscControlsGroup;


class RW_Text: RscStructuredText
{
	size = 0.05;
};
class RW_Picture: RscPicture
{
	style = 2096;
	tooltipColorText[] = {main_color,1};
	tooltipColorBox[] = {main_color,1};
	tooltipColorShade[] = {0,0,0,0.5};
};
class RW_Background: IGUIBack
{
	colorBackground[] = {background_color,1};
};
class RW_Frame: IGUIBack
{
	colorBackground[] = {main_color,1};
};
class RW_Combo: RscCombo
{
	sizeEx = 0.05;
	font = "RobotoCondensedBold";
	arrowEmpty = "a3\3den\data\controls\ctrlcombo\arrowempty_ca.paa";
	arrowFull = "a3\3den\data\controls\ctrlcombo\arrowempty_ca.paa";
	colorBackground[] = {main_color_darker,1};
	colorText[] = {main_color,1};
	colorTextRight[] = {1,1,0,1};
	colorSelectBackground[] = {main_color_dark,1};
	colorSelect[] = {main_color,1};
	colorSelectRight[] = {1,1,0,1};
	tooltipColorText[] = {main_color,1};
	tooltipColorBox[] = {main_color,1};
	tooltipColorShade[] = {background_color,1};
	period = -1;
	class ComboScrollBar : ScrollBar
	{
		color[] = {main_color,1};
	};
};
class RW_Button: RscButton
{
	colorText[] = {1,1,0,1};
	colorDisabled[] = {1,1,0,0.5};
	colorBackground[] = {main_color_dark,1};
	colorBackgroundDisabled[] = {main_color_darker,1};
	colorBackgroundActive[] = {main_color,1};
	colorFocused[] = {main_color_light,1};
	sizeEx = 0.05;
	font = "RobotoCondensedBold";
	period = -1;
};
class RW_Checkbox: RscCheckBox
{
	color[] = {main_color,1};
	colorFocused[] = {main_color_light,1};
	colorHover[] = {main_color_light,1};
	colorPressed[] = {main_color,1};
	colorDisabled[] = {main_color_dark,1};
};
class RW_Progress: RscProgress
{
	colorFrame[] = {main_color,1};
	colorBar[] = {main_color,0.7};
};
class RW_Group: RscControlsGroup
{
	class VScrollbar
	{
		width = 0.009;
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
		colorActive[] = {1,1,1,1};
		colorDisabled[] = {0,0,0,0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowEmpty = "\A3\data_f\clear_empty.paa";
		arrowFull = "\A3\data_f\clear_empty.paa";
		border = "\A3\data_f\clear_empty.paa";
	};
};