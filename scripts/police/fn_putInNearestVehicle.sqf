/*
	File: fn_putInNearestVehicle.sqf
	Author: Danny

	Description:
	Transfer escorted unit into nearest vehicle
	
	Arguments:
	_this select 0: OBJECT - escorter
	
*/

private ["_caller", "_target", "_vehicle"];
_caller = _this select 0;

if (isNull _caller) exitWith {};
if (!alive _caller) exitWith {};

_vehicle = nearestObjects [_caller, ["Car","Air"], 5] select 0;
if (isNull _vehicle) exitWith {};

_target = _caller getVariable ["LiftedObject", objNull];

[_caller,_target,_vehicle] call FARM_fnc_putInVehicle;

