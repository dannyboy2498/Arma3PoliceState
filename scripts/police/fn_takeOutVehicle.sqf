/*
	File: fn_takeOutVehicle.sqf
	Author: Danny

	Description:
	Transfer captive from vehicle to being escorted
	
	Arguments:
	_this select 0: OBJECT - escorter
	_this select 1: OBJECT - vehicle - sorry again for switcheroo
	_this select 2: OBJECT - escorted
	_this select 3: NUMBER - suspect number (used to make actions have different text)
	
*/

private ["_caller", "_vehicle", "_target", "_num", "_suspectsVar"];
_caller = _this select 0;
_vehicle = _this select 1;
_target = _this select 2;
_num = _this select 3;

[_vehicle, format ["Take suspect %1 out of car", _num]] remoteExec ["FARM_fnc_removeAction"];

if (isNull _caller || isNull _vehicle || isNull _target) exitWith {};
if (!alive _caller || !alive _vehicle || !alive _target) exitWith {};

// Unlock seat and take out of vehicle
_index = _vehicle getCargoIndex _target;
_vehicle lockCargo [_index, false];
_target setVariable ["Passenger", false, true];
sleep 0.1;
[_target,_vehicle, true] remoteExec ["FARM_fnc_orderOutCargo", 2];

// Update suspects variable
_suspectsVar = _vehicle getVariable ["suspects", []];
if ({_x select 0 == _num} count _suspectsVar > 0) then
{
	[_vehicle, "suspects", [[_num, _target]]] call BIS_fnc_variableSpaceRemove;
};

// start escorting when target gets out of vehicle
waitUntil {vehicle _target == _target};
[_caller, _target] spawn FARM_fnc_escort;