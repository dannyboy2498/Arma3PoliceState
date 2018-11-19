/*
	File: fn_removeLTL.sqf
	Author: Danny
*/
private ["_unit", "_ltlArray"];
_unit = _this select 0;

if(isNull _unit) exitWith {};

_ltlArray = _unit getVariable ["ltl", []];
if (count _ltlArray == 0) exitWith {};

_unit setVariable ["ltl", [], true];
[_unit, "ltlFired", "Fired"] call FARM_fnc_removeEventHandler;