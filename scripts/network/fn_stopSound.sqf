/*
	File: fn_stopSound.sqf
	Author: Danny

	Description:
	Stop a local 3D sound emitter from playing
	
	Arguments:
	_this select 0: OBJECT - object that sound is coming from (not the soundEmitter)
	_this select 1: STRING - sound classname to stop
	
*/
params ["_source", "_sound"]; // same as _this select _x; plus private ["_x"]

if (isNull _source) exitWith {};

_soundsVar = _source getVariable ["sounds", []];
_soundIndex = [_soundsVar, _sound] call BIS_fnc_findInPairs; //find index of sound/soundemitter pair array
if (_soundIndex != -1) then
{
	_soundEmitter = (_soundsVar select _soundIndex) select 1;
	if (!isNull _soundEmitter) then
	{
		detach _soundEmitter;
		deleteVehicle _soundEmitter;
	};

	_playing = {_x select 0 == _sound} count _soundsVar;
	if (_playing > 0) then
	{
		[_source, "sounds", [[_sound, _soundEmitter]]] call BIS_fnc_variableSpaceRemove;
	};
};