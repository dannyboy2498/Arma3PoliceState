/*
	File: fn_unholsterTaser.sqf
	Author: Danny

	Description:
	Tell unit to take out taser
	
	Arguments:
	_this select 0: OBJECT - target unit to take out taser
	
*/
private ["_unit"];
_unit = _this select 0;

if(isNull _unit) exitWith {};
if (_unit getVariable ["taserOut", false]) exitWith {};

[_unit] call FARM_fnc_holsterWeapons;
_unit setVariable ["taserOut", true, true];
_unit setVariable ["ltl", [0, 2], true];
_unit addMagazine ["16Rnd_9x21_Mag", 1];
_unit addWeapon "hgun_P07_F";

[_unit, "ltlFired", "Fired", "(_this select 0) addMagazine [""16Rnd_9x21_Mag"", 1]; [(_this select 0), ""taser_fire""] remoteExec [""FARM_fnc_say3D""]; [_this select 6, 0, 2] spawn FARM_fnc_firedLTL"] spawn FARM_fnc_addEventHandler;
[_unit, "taserGetInMan", "GetInMan", "[(_this select 0)] spawn FARM_fnc_holsterTaser"] spawn FARM_fnc_addEventHandler;
// !TODO!: addEvent handlers that stop abuse