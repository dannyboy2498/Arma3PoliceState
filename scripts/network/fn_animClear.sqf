/*
	File: fn_animClear.sqf
	Author: Danny

	Description:
	Clears current animation (TO BE REDONE)
	
	Arguments:
	_this select 0: OBJECT - object to clear animation
	
*/

params ["_unit"];

if (isNull _unit) exitWith {};
[_unit, "animChange", "AnimChanged"] call FARM_fnc_removeEventHandler;

_unit enableSimulation true;
_unit switchMove "AmovPercMstpSrasWrflDnon";