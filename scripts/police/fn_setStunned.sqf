/*
	File: fn_setStunned.sqf
	Author: Danny

	Description:
	Temporarily make unit appear stunned
	
	Arguments:
	_this select 0: OBJECT - unit to stun
	
*/

private ["_target","_exit"];
_target = _this select 0;

if (isNull _target) exitWith {};
if (!(_target isKindOf "Man") || !alive _target) exitWith {};
if (_target getVariable ["Restrained", false]) exitWith {}; // Check that the target is not being escorted
if (_target getVariable ["Stunned", false]) exitWith {};

_target setVariable ["Stunned", true, true];

// Disable AI features if target is an AI
if !(isPlayer _target) then
{
	[_target, "MOVE"] remoteExec ["disableAI", 2]; //2 means execute on server
	[_target, "ANIM"] remoteExec ["disableAI", 2];
};

//Play stunned animation
[_target,"ApanPknlMstpSnonWnonDnon_G01", "loop", "Stunned", true] remoteExec ["FARM_fnc_animUpdate"];

sleep 20;
if (_target getVariable ["Stunned", false]) then
{

	// Free from stunned state
	_target setVariable ["Stunned", false, true];
	
	// Re-enable AI features if target is an AI
	if !(isPlayer _target) then
	{
		[_target, "MOVE"] remoteExec ["enableAI", 2]; //2 means execute on server
		[_target, "ANIM"] remoteExec ["enableAI", 2];
	};

	// Release target from stunned animation on all clients
	[_target] remoteExec ["FARM_fnc_animClear"];
};