/*
	File: fn_spawnBandit.sqf
	Author: Danny

	Description:
	Spawns a random hostile insurgent with at provided skill level and location
	
	Arguments:
	_this select 0: GROUP or SIDE - group or side of the civilian to be attached to
	_this select 1: ARRAY - position vector
*/

private ["_classname", "_unit_classes", "_position", "_group", "_skillLevel", "_skills", "_unit"];
_group = _this select 0;
_position = _this select 1;
_unit_classes = ["C_Man_casual_1_F_afro","C_Man_casual_2_F_afro","C_Man_casual_3_F_afro","C_Man_casual_4_F_afro","C_Man_casual_5_F_afro","C_Man_casual_6_F_afro",
	"C_Man_polo_1_F_afro","C_Man_polo_2_F_afro","C_Man_polo_3_F_afro","C_Man_polo_4_F_afro","C_Man_polo_5_F_afro","C_Man_polo_6_F_afro",
	"C_Man_casual_1_F_asia","C_Man_casual_2_F_asia","C_Man_casual_3_F_asia","C_Man_casual_4_F_asia","C_Man_casual_5_F_asia","C_Man_casual_6_F_asia",
	"C_Man_polo_1_F_asia","C_Man_polo_2_F_asia","C_Man_polo_3_F_asia","C_Man_polo_4_F_asia","C_Man_polo_5_F_asia","C_Man_polo_6_F_asia",
	"C_Man_casual_1_F_euro","C_Man_casual_2_F_euro","C_Man_casual_3_F_euro","C_Man_casual_4_F_euro","C_Man_casual_5_F_euro","C_Man_casual_6_F_euro",
	"C_Man_polo_1_F_euro","C_Man_polo_2_F_euro","C_Man_polo_3_F_euro","C_Man_polo_4_F_euro","C_Man_polo_5_F_euro","C_Man_polo_6_F_euro",
	"C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan","C_Man_casual_6_F_tanoan",
	"C_Man_Fisherman_01_F"];
	
_classname = _unit_classes select (floor (random (count _unit_classes)));
_unit = [_group, _classname, _position] call FARM_fnc_createUnit;
_unit; // Return created unit object