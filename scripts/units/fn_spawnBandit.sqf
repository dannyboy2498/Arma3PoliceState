/*
	File: fn_spawnBandit.sqf
	Author: Danny

	Description:
	Spawns a random hostile insurgent with at provided skill level and location
	
	Arguments:
	_this select 0: ARRAY - position vector
	_this select 1: NUMBER - skill level from 0-5 (OPTIONAL)
*/

private ["_classnames", "_position", "_skillLevel", "_skills", "_unit"];
_position = _this select 0;
if (count _this > 1) then {_skillLevel = [_this select 1];} else {_skillLevel = [];};
_classname = format ["I_C_Soldier_Bandit_%1_F", ceil random 8];
	
_unit = [east, _classname, _position] call FARM_fnc_createUnit;
_skills = _skillLevel call FARM_fnc_randomSkill;
{_unit setSkill [_x select 0, _x select 1];} forEach _skills;
_unit; // Return created unit object