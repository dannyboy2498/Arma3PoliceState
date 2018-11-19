/*
	File: fn_holsterWeapons.sqf
	Author: Danny

	Description:
	Remove weapons from object and save in object variable
	
	Arguments:
	_this select 0: OBJECT - unit to remove weapons from
	
*/

private ["_unit","_holster", "_weaps", "_mags"];
_unit = _this select 0;

if(isNull _unit) exitWith {};
if (_unit getVariable ["taserOut", false]) exitWith {}; // if taser is out cancel

_holster = _unit getVariable ["holster", []];
if (count _holster > 0) exitWith {};

_weaps = weapons _unit;
_mags = magazinesAmmo _unit;

_accessories = weaponsItems _unit;

_unit setVariable ["holster", [_weaps, _mags, _accessories], true];

{
	_unit removeMagazineGlobal (_x select 0);
} forEach _mags;

{
	_unit removeWeaponGlobal _x;
} forEach _weaps;

// Add temporary event handlers to escorter
[_unit, "holsterKilled", "Killed", "[(_this select 0)] spawn FARM_fnc_unholsterWeapons"] call FARM_fnc_addEventHandler;