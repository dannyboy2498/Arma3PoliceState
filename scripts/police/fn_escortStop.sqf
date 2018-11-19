/*
	File: fn_escortStop.sqf
	Author: Danny

	Description:
	Detaches escorted object
	
	Arguments: - sorry they're reversed
	_this select 0: OBJECT - escorted object to be detached from escorter
	_this select 1 (OPTIONAL): OBJECT - escorter object
	
*/

private ["_target", "_caller"];
_target = _this select 0;
_caller = objNull;
if (count _this > 1) then {_caller = _this select 1} else {_caller = _target getVariable ["parent", objNull]};
[_caller, "Place in nearest vehicle"] call FARM_fnc_removeAction;

if (isNull _target || isNull _caller) exitWith {};
if !(_target getVariable ["Escorted", false]) exitWith {}; // Not escorting anyone

[_caller] remoteExec ["FARM_fnc_unholsterWeapons", owner _caller];
detach _target;
_target setVariable ["Escorted", false, true];
_target setDir (direction _caller);
_caller setVariable ["LiftedObject", objNull, true];
_target setVariable ["parent", objNull, true];

// Remove temporary EventHandlers

//Remove temporary event handlers from escorter
[_caller, "escortCallerKilled", "Killed"] call FARM_fnc_removeEventHandler;
[_caller, "escortCallerDeleted", "Deleted"] call FARM_fnc_removeEventHandler;
[_caller, "escortCallerGetInMan", "GetInMan"] call FARM_fnc_removeEventHandler;

//Remove temporary event handlers from target
[_target, "escortTargetKilled", "Killed", "Killed"] call FARM_fnc_removeEventHandler;
[_target, "escortTargetDeleted", "Deleted", "Deleted"] call FARM_fnc_removeEventHandler;