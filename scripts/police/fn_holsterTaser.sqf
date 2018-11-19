/*
	File: fn_holsterTaser.sqf
	Author: Danny

	Description:
	Tell unit to put away taser
	
	Arguments:
	_this select 0: OBJECT - target unit to put away taser
	
*/
private ["_unit"];
_unit = _this select 0;

if(isNull _unit) exitWith {};
if !(_unit getVariable ["taserOut", false]) exitWith {};

_unit setVariable ["taserOut", false, false];
_unit setVariable ["ltl", [], true];
_unit removeWeapon "hgun_P07_F";
_unit removeMagazine "16Rnd_9x21_Mag";
[_unit, "ltlFired", "Fired"] spawn FARM_fnc_removeEventHandler;
[_unit, "taserGetInMan", "GetInMan"] spawn FARM_fnc_removeEventHandler;
[_unit] spawn FARM_fnc_unholsterWeapons;