/* showSpeech.sqf
* By Geari (sorry in advance)
* Shows a dialog with some text, as if you were talking to the person.
* argument0 - Dialog line to display
*/
params["_line"];

[] call FARM_fnc_getLine;

_ok = createDialog "Speech";

waitUntil { dialog };

ctrlSetText [1100, speechLines select _line];
