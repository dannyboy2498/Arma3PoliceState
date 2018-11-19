/*
	File: fn_addEventHandler.sqf
	Author: Danny

	Description:
	locally add event handler to object of a specific type
	
	Arguments:
	_this select 0: OBJECT - object to add event handler to
	_this select 1: STRING - unique event handler id - used for removing event handler
	_this select 2: STRING - type of event handler - see arma 3 event handlers wiki
	_this select 3: STRING - code to execute
	
*/

private ["_target", "_text", "_type", "_script", "_tempEHs", "_index"];
_target = _this select 0;
_text = _this select 1;
_type = _this select 2;
_script = _this select 3;

if(isNull _target) exitWith {};

// Add temporary event handlers to escorter
_tempEHs = _target getVariable ["teh", []];
_index = [_tempEHs, _text] call BIS_fnc_findInPairs;

if (_index == -1) then // not found in teh array
{
	private ["_eh"];
	//Add event handlers for death/deletion or target gets in vehicle
	_eh = _target addEventHandler [_type, _script];
	_target setVariable ["teh", _tempEHs + [[_text, _eh]]];
};