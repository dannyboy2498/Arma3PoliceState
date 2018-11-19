/*
	File: fn_orderInCargo.sqf
	Author: Danny

	Description:
	globally order a target object to embark in vehicle (MUST LOCALLY EXECUTE ON THE CLIENT THAT OWNS THE OBJECT)
	
	Arguments:
	_this select 0: OBJECT - object to be ordered to embark
	_this select 1: OBJECT - vehicle for the target to be ordered into
	_this select 2 (OPTIONAL) : BOOL - true if necessary that target enters vehicle for later script handling
	
*/

private ["_target", "_vehicle", "_forced", "_index"];
_target = _this select 0;
_vehicle = _this select 1;
_forced = false;
if (count _this > 2) then {_forced = _this select 2};

if (isNull _target || isNull _vehicle) exitWith {};
if (!alive _target || !alive _vehicle) exitWith {};

_target assignAsCargo _vehicle;
_target action ["getInCargo",_vehicle];

if (_forced) then 
{
	sleep 1;
	if !(_target in _vehicle) then 
	{
		_target moveInCargo _vehicle;
	};
};
