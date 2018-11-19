/*
	File: fn_createUnit.sqf
	Author: Danny

	Description:
	Spawn unit with eventhandlers
	
	Arguments:
	_this select 0: SIDE - unit side to be assigned to
	_this select 1: STRING - classname of unit to spawn
	_this select 2: ARRAY - position to spawn unit at
	_this select 3: NUMBER - unit damage from 0 to 1 (OPTIONAL)
*/

private ["_classname", "_group", "_position", "_unit", "_damage"];
_group = _this select 0;
_classname = _this select 1;
_position = _this select 2;
if (typeName _group == "SIDE") then {_group = createGroup _group};

// Create unit with supplied parameters
_unit = _group createUnit [_classname, _position, [], 0, "NONE"];
if (count _this > 3) then {_unit setDamage (_this select 3)};

// Add custom eventhandlers
[_unit, "handledDamageLTL", "HandleDamage", "[_this select 0, _this select 2, _this select 3] call FARM_fnc_handleDamageLTL"] spawn FARM_fnc_addEventHandler;

_unit; // Return created unit object