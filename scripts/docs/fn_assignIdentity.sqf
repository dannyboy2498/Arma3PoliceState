/*
	File: fn_assignIdentity.sqf
	Author: Danny
	
	Description:
	Assign random civ identity
*/
private ["_unit", "_type", "_name", "_dob", "_face", "_area"];

_unit = _this select 0;
_type = true;
if (count _this > 1) then {_type = _this select 1};

_name = [] call FARM_fnc_findName;
_unit setName [_name select 0, _name select 1, _name select 2];
_dob = [] call FARM_fnc_findDOB;
if (_type) then {
	_face = [] call FARM_fnc_findFaceOfType;
	_unit setFace _face;
} else {
	_face = face _unit;
};

_area = name (nearestLocations [position _unit, ["NameCityCapital", "NameCity", "NameVillage"], 2000] select 0);
_id = [_name, _dob, _face, _area];
_unit setVariable ["Identity", _id, true];

_id
