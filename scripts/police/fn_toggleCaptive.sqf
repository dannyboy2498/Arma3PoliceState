/*
	File: fn_toggleCaptive.sqf
	Author: Danny

	Description:
	Toggle whether the unit is a captive (surrendered)
	
	Arguments:
	_this select 0: OBJECT - unit to toggle captive
	_this select 1 (OPTIONAL) : BOOL - true to surrender, false to free
	
*/

private ["_target","_exit","_type", "_action"];
_target = _this select 0;
_type = true;
_action = true;

if (isNull _target) exitWith {};
[_target, "Restrain"] remoteExec ["FARM_fnc_removeAction"];
if (!(_target isKindOf "Man") || !alive _target) exitWith {};
if (_target getVariable ["Escorted", false]) exitWith {}; // Check that the target is not being escorted

_exit = false;
if (count _this > 1) then 
{
	_type = _this select 1;
	if (_type) then
	{
		if (captive _target) then {_exit = true};
	} else {
		if (!captive _target) then {_exit = true};
	};
} else {
	if (captive _target) then {_type = false}; // false to free, true to set captive
};
if (_exit) exitWith {}; // Exit if trying to set a captive as a captive or a free a freed person
if (count _this > 2) then {_action = _this select 2};

if (_type) then
{
	// Target is free so set captive
	[_target, true] remoteExec ["setCaptive", 2];
	_target setVariable ["Surrendered", true, true];
	
	// Disable AI features if target is an AI
	if !(isPlayer _target) then
	{
		[_target, "MOVE"] remoteExec ["disableAI", 2]; //2 means execute on server
		[_target, "ANIM"] remoteExec ["disableAI", 2];
	};
	
	//Play surrendered animation and cuff sound on all clients
	[_target,"AmovPercMstpSsurWnonDnon", "loop", "Surrendered", true] remoteExec ["FARM_fnc_animUpdate"];
	
	//Add action to restrain !TODO!: limit it to police only
	if (_action) then
	{
		[_target, "Restrain", "(_this select 3) spawn FARM_fnc_toggleBound", [_target], "_this != _target"] remoteExec ["FARM_fnc_addAction"];
	};
	
	// !TODO!: disable the ability of captives entered and leaving vehicles when arrested
} else 
{

	// Target has been assigned as captive so free
	
	[_target, false] remoteExec ["setCaptive", 2];
	_target setVariable ["Surrendered", false, true];
	// Re-enable AI features if target is an AI
	if !(isPlayer _target) then
	{
		[_target, "MOVE"] remoteExec ["enableAI", 2]; //2 means execute on server
		[_target, "ANIM"] remoteExec ["enableAI", 2];
	};

	// Release target from surrendered animation on all clients
	[_target] remoteExec ["FARM_fnc_animClear"];

};
