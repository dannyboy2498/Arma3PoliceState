/*
	File: fn_firedLTL.sqf
	Author: Danny
*/
private ["_bullet", "_damageRatioHealth", "_damageRatioStamina"];
_bullet = _this select 0;
_damageRatioHealth = _this select 1;
_damageRatioStamina = _this select 2;

if(isNull _bullet) exitWith {};

_bullet setVariable ["ltl", [_damageRatioHealth, _damageRatioStamina]];
