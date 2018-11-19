/*
	File: fn_toggleBound.sqf
	Author: Danny

	Description:
	Toggle whether the unit is restrained or not
	
	Arguments:
	_this select 0: OBJECT - unit to toggle restrain
	_this select 1 (OPTIONAL) : BOOL - true to restrain, false to free
	
*/

private ["_target", "_type", "_exit"];
_target = _this select 0;
_type = true;
_exit = false;

if (isNull _target) exitWith {};
if (!(_target isKindOf "Man") || !alive _target) exitWith {};
if (_target getVariable ["Escorted", false]) exitWith {}; // Check that the target is not being escorted

if (count _this > 1) then 
{
	_type = _this select 1;
	if (_type) then
	{
		if (_target getVariable ["Restrained", false]) then {_exit = true};
	} else {
		if !(_target getVariable ["Restrained", false]) then {_exit = true};
	};
} else {
	if (_target getVariable ["Restrained", false]) then {_type = false};
};

if (_exit) exitWith {};


if (_type) then
{
	// Target is unbound so restrain
	if (_target getVariable ["Stunned", false]) then {_target setVariable ["Stunned", false, true]};
	
	// If not captive then setCaptive
	[_target, true, false] call FARM_fnc_toggleCaptive;
	_target setVariable ["Surrendered", false, true]; //so surrendering anim not looping
	
	// Target is free so restrain
	_target setVariable ["Restrained", true, true];
	
	//Play cuffed animation and cuff sound on all clients
	[_target,"UnaErcPoslechVelitele1", "loop", "Restrained", true] remoteExec ["FARM_fnc_animUpdate"];
	[_target,"cuffs_tighten"] remoteExec ["FARM_fnc_say3D"];

} else 
{

	// Target has been arrested so unrestrain
	if (_target getVariable ["Escorted", false]) exitWith {}; // Check that the target is not being escorted
	
	_target setVariable ["Restrained", false, true];

	[_target, false] call FARM_fnc_toggleCaptive;
	//Release target from cuffed animation on all clients
	//no need to clear animation since done in toggleCaptive
	//[_target] remoteExec ["FARM_fnc_animClear"];
	// !TODO!: disable the ability of captives entered and leaving vehicles when arrested
};
