/*
	File: fn_toggleLighbar.sqf
	Author: Danny

	Description:
	Toggle police lightbar on vehicle
	
	Arguments:
	_this select 0: OBJECT - target vehicle object
	
*/

_source = _this select 0;

if (isNull _source) exitWith {};
if (!alive _source || !(_source isKindOf "Car")) exitWith {};

_lb = _source getVariable ["lightbar", false];

if !(_lb) then 
{
	// Off so turn on lightbar
	hint "Lightbar On";
	_source setVariable ["lightbar", true, true];
	while {_source getVariable "lightbar" && alive _source} do 
	{
		[_source,[0,0.05,0.4],[0,0.05,0.1],0.8,[0,0,2], 0.3] remoteExec ["FARM_fnc_spawnLight"];
		sleep 0.4;
	};
} else {
	// On so turn off lightbar
	hint "Lightbar Off";
	_source setVariable ["lightbar", false, true];
};
