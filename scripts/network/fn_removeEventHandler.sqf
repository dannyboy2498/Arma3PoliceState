/*
	File: fn_removeEventHandler.sqf
	Author: Danny

	Description:
	locally remove event handler to object of a specific type
	
	Arguments:
	_this select 0: OBJECT - object to remove event handler from
	_this select 1: STRING - unique event handler id - used for removing event handler
	_this select 2: STRING - type of event handler - see arma 3 event handlers wiki
	
*/

private ["_target", "_text", "_type", "_index", "_tempEHs"];
_target = _this select 0;
_text = _this select 1;
_type = _this select 2;

if(isNull _target) exitWith {};

_tempEHs = _target getVariable ["teh", []];
_index = [_tempEHs, _text] call BIS_fnc_findInPairs;

if (_index != -1) then
{
	private ["_id"];
	_id = (_tempEHs select _index) select 1;
	
	_target removeEventHandler [_type, _id];
	_tempEHs = [_tempEHs, _text] call BIS_fnc_removeFromPairs;
	_target setVariable ["teh", _tempEHs];
};