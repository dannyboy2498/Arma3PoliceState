/* 
 * This file contains config parameters and a function call to start the civilian script.
 * The parameters in this file may be edited by the mission developer.
 *
 * See file Engima\Civilians\Documentation.txt for documentation and a full reference of 
 * how to customize and use Engima's Civilians.
 */
 
private ["_parameters", "_unit_classes"];

_unit_classes = ["C_Man_casual_1_F_afro","C_Man_casual_2_F_afro","C_Man_casual_3_F_afro","C_Man_casual_4_F_afro","C_Man_casual_5_F_afro","C_Man_casual_6_F_afro",
	"C_Man_polo_1_F_afro","C_Man_polo_2_F_afro","C_Man_polo_3_F_afro","C_Man_polo_4_F_afro","C_Man_polo_5_F_afro","C_Man_polo_6_F_afro",
	"C_Man_casual_1_F_asia","C_Man_casual_2_F_asia","C_Man_casual_3_F_asia","C_Man_casual_4_F_asia","C_Man_casual_5_F_asia","C_Man_casual_6_F_asia",
	"C_Man_polo_1_F_asia","C_Man_polo_2_F_asia","C_Man_polo_3_F_asia","C_Man_polo_4_F_asia","C_Man_polo_5_F_asia","C_Man_polo_6_F_asia",
	"C_Man_casual_1_F_euro","C_Man_casual_2_F_euro","C_Man_casual_3_F_euro","C_Man_casual_4_F_euro","C_Man_casual_5_F_euro","C_Man_casual_6_F_euro",
	"C_Man_polo_1_F_euro","C_Man_polo_2_F_euro","C_Man_polo_3_F_euro","C_Man_polo_4_F_euro","C_Man_polo_5_F_euro","C_Man_polo_6_F_euro",
	"C_Man_casual_1_F_tanoan","C_Man_casual_2_F_tanoan","C_Man_casual_3_F_tanoan","C_Man_casual_4_F_tanoan","C_Man_casual_5_F_tanoan","C_Man_casual_6_F_tanoan",
	"C_Man_Fisherman_01_F"];

// Set civilian parameters.
_parameters = [
	["UNIT_CLASSES", _unit_classes],
	["UNITS_PER_BUILDING", 20],
	["MAX_GROUPS_COUNT", 200],
	["MIN_SPAWN_DISTANCE", 50],
	["MAX_SPAWN_DISTANCE", 1000],
	["BLACKLIST_MARKERS", []],
	["HIDE_BLACKLIST_MARKERS", true],
	["ON_UNIT_SPAWNED_CALLBACK", {[_this select 0, "handledDamageLTL", "HandleDamage", "[_this select 0, _this select 2, _this select 3] call FARM_fnc_handleDamageLTL"] spawn FARM_fnc_addEventHandler}],
	["ON_UNIT_REMOVE_CALLBACK", { true }],
	["DEBUG", true]
];

// Start the script
_parameters spawn ENGIMA_CIVILIANS_StartCivilians;
