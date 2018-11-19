/*
	File: fn_applyLTL.sqf
	Author: Danny
*/
private ["_unit", "_healthRatio", "_stamRatio", "_ltlArray"];
_unit = _this select 0;
_healthRatio = _this select 1;
_stamRatio = _this select 2;

if(isNull _unit) exitWith {};

_ltlArray = _unit getVariable ["ltl", []];
if (count _ltlArray > 0) exitWith {};

_unit setVariable ["ltl", [_healthRatio, _stamRatio], true];
[_unit, "ltlFired", "Fired", format ["[_this select 6, %1, %2] spawn FARM_fnc_firedLTL",_healthRatio, _stamRatio]] call FARM_fnc_addEventHandler;