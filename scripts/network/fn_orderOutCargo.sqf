/*
	File: fn_orderOutCargo.sqf
	Author: Danny

	Description:
	globally cause a target object to disembark (MUST LOCALLY EXECUTE ON THE CLIENT THAT OWNS THE OBJECT)
	
	Arguments:
	_this select 0: OBJECT - passenger to disembark
	_this select 1: OBJECT - vehicle for the passenger to disembark from
	_this select 2 (OPTIONAL) : BOOL - true if necessary that target leaves vehicle for later script handling
	
*/

private ["_target", "_vehicle", "_forced", "_index"];
_target = _this select 0;
_vehicle = _this select 1;
_forced = false;
if (count _this > 2) then {_forced = _this select 2};

if (isNull _target || isNull _vehicle) exitWith {};
if (!alive _target || !alive _vehicle) exitWith {};

unassignVehicle _target;
_target action ["Eject",_vehicle];

if (_forced) then // mainly used by police
{
	sleep 1;
	if (_target in _vehicle) then 
	{
		moveOut _target;
	};
};