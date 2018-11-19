/*
	File: fn_escort.sqf
	Author: Danny

	Description:
	Attaches target object to caller to be "escorted"
	
	Arguments:
	_this select 0: OBJECT - caller object for object to be attached to (escorter)
	_this select 1: OBJECT - target object to be escorted
	
*/

private ["_caller", "_target"];
_caller = _this select 0;
_target = _this select 1;

if (isNull _target) exitWith {};
if (vehicle _target != _target) exitWith {};
if (!(_target getVariable ["Restrained", false])) exitWith {}; // exit if target is not restrained
if (_target getVariable ["Escorted", false] || !isNull (_caller getVariable ["LiftedObject", objNull])) exitWith {};

[_caller] remoteExec ["FARM_fnc_holsterWeapons", owner _caller];
_target setVariable ["Escorted", true, true];
_target setVariable ["parent", _caller, true];
_target attachTo [_caller,[0,0.5,0]];
_caller setVariable ["LiftedObject", _target, true];
[_caller, "Place in nearest vehicle", "(_this select 3) spawn FARM_fnc_putInNearestVehicle", [_caller], "_this == _target && (count nearestObjects [_this, [""Car"",""Air""], 5] > 0)"] call FARM_fnc_addAction;


// Stop escorting if escorter gets in vehicle or dies

// Add temporary event handlers to escorter
[_caller, "escortCallerKilled", "Killed", "[((_this select 0) getVariable [""LiftedObject"", objNull])] spawn FARM_fnc_escortStop"] call FARM_fnc_addEventHandler;
[_caller, "escortCallerDeleted", "Deleted", "[((_this select 0) getVariable [""LiftedObject"", objNull])] spawn FARM_fnc_escortStop"] call FARM_fnc_addEventHandler;
[_caller, "escortCallerGetInMan", "GetInMan", "[(_this select 0),((_this select 0) getVariable [""LiftedObject"", objNull]), (_this select 2)] spawn FARM_fnc_putInVehicle"] call FARM_fnc_addEventHandler;

// Add temporary event handlers to target
[_target, "escortTargetKilled", "Killed", "[(_this select 0)] spawn FARM_fnc_escortStop"] call FARM_fnc_addEventHandler;
[_target, "escortTargetDeleted", "Deleted", "[(_this select 0)] spawn FARM_fnc_escortStop"] call FARM_fnc_addEventHandler;

