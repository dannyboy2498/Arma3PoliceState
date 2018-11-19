/* addSpeech.sqf
* By Geari (sorry in advance)
* Shows a dialog with some text, as if you were talking to the person.
* argument0 - Unit to add action
* argument1 - Type of text to be displayed
* 0 = Robbery
* 1 = Fight
*
*
*/
params["_unit", "_type"];

_line = switch (_type) do
{
	case 0: { (floor random 3)+2 };
	case 1: { (floor random 8)+5 };
	default { floor random 2 };
};

[_unit, "Talk To", format ["[%1] call FARM_fnc_showSpeech;", _line]] remoteExec ["FARM_fnc_addAction"];
