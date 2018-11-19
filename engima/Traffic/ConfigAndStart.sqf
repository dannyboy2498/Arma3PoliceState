/* 
 * This file contains parameters to config and function call to start an instance of
 * traffic in the mission. The file is edited by the mission developer.
 *
 * See file Engima\Traffic\Documentation.txt for documentation and a full reference of 
 * how to customize and use Engima's Traffic.
 */
 
 private ["_parameters"];

// Set traffic parameters.
_parameters = [
	["SIDE", civilian],
	["VEHICLES", ["C_Offroad_01_F", "C_Offroad_01_repair_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F"]],
	["VEHICLES_COUNT", 80],
	["MIN_SPAWN_DISTANCE", 500],
	["MAX_SPAWN_DISTANCE", 1000],
	["MIN_SKILL", 0.4],
	["MAX_SKILL", 0.6],
	["ON_UNIT_CREATED", {[driver (_this select 0), "handledDamageLTL", "HandleDamage", "[_this select 0, _this select 2, _this select 3] call FARM_fnc_handleDamageLTL"] spawn FARM_fnc_addEventHandler}],
	["DEBUG", true]
];

// Start an instance of the traffic
_parameters spawn ENGIMA_TRAFFIC_StartTraffic;
