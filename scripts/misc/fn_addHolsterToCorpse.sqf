/*
	File: fn_addHolsterToCorpse.sqf
	Author: Danny
*/
private ["_unit","_holster", "_weaps", "_mags"];
_unit = _this select 0;

if(isNull _unit) exitWith {};
//TODO see if necessary