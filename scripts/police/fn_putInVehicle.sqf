/*
	File: fn_putInVehicle.sqf
	Author: Danny

	Description:
	Transfer escorted unit into target vehicle
	
	Arguments:
	_this select 0: OBJECT - escorter
	_this select 1: OBJECT - escorted
	_this select 2: OBJECT - vehicle
	
*/

params ["_caller", "_target", "_vehicle"];

if (isNull _caller || isNull _target || isNull _vehicle) exitWith {};
if (!alive _target || !alive _target || !alive _vehicle) exitWith {};

if (!isNull _target) then
{
	_freeCargoPositions = _vehicle emptyPositions "Cargo";
	if (_freeCargoPositions > 0) then
	{
		private ["_suspectsVar","_suspectsTotal", "_num"];
		[_target] spawn FARM_fnc_escortStop; // stop Escorting
		[_target,_vehicle, true] remoteExec ["FARM_fnc_orderInCargo", 2];
		
		waitUntil {vehicle _target == _vehicle};
		// Make sure they don't escape the vehicle
		_index = _vehicle getCargoIndex _target;
		_vehicle lockCargo [_index, true];
		_target setVariable ["Passenger", true, true];
		[_target, _vehicle] spawn
		{
			_target = _this select 0;
			_vehicle = _this select 1;
			
			while {_target getVariable ["Restrained", false] && _target getVariable ["Passenger", false]} do 
			{
				if !(_target in _vehicle) then {[_target,_vehicle, true] remoteExec ["FARM_fnc_orderInCargo", 2]};
				sleep 0.1;
			};
		};
		
		_suspectsVar = _vehicle getVariable ["suspects", []];
		
		// determine suspect ID number to assign to action/suspect
		_suspectsTotal = count _suspectsVar;
		_num = 1; //suspect number id
		for [{_num=1}, {_num <= _suspectsTotal}, {_num = _num + 1}] do
		{
			// exit if none of the current suspects in vehicle have id 1,2,3...
			if !({_x select 0 == _num} count _suspectsVar > 0) exitWith {};
		};
		_vehicle setVariable ["suspects", _suspectsVar + [[_num, _target]], true];
		[_vehicle, format ["Take suspect %1 out of car", _num], "(_this select 3) spawn FARM_fnc_takeOutVehicle", [_caller,_vehicle,_target, _num], "vehicle _this == _this"] remoteExec ["FARM_fnc_addAction"];
	} else {
		hint "There is no empty space in the back of this vehicle";
	};
} else {
	[_caller, "Place in nearest vehicle"] call FARM_fnc_removeAction;
};


