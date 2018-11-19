/*
	File: static_flare.sqf
	Author: Danny, modified from ALIAS Roadflare Demo

	Description:
	Spawns in a static flare (useful for calling from a script)
	
	Arguments:
	_this select 0: OBJECT - object to attach flare too
	_this select 1: NUMBER - flare lifetime in seconds (OPTIONAL)
	
*/

private ["_object", "_lifetime","_colour","_sound_burn","_sound_set","_sound_start"];

if (!isServer) exitWith {};

_object = _this select 0;
_lifetime = 900; // Time until static flare goes out
if (count _this > 1) then {_lifetime = _this select 1};

if (isNull _object) exitWith {};
if (!isNil {_object getVariable "is_on_road_flare"}) exitWith {};
_object setVariable ["is_on_road_flare",true,true];

// Set colour of flare/chemlight tweak
_colour = [1,0,0];
_sound_set = [1,2,3] call BIS_fnc_selectRandom;
if (_sound_set==1) then {_sound_start="fl_start_1";_sound_burn="fl_burn_1"};
if (_sound_set==2) then {_sound_start="fl_start_2";_sound_burn="fl_burn_2"};
if (_sound_set==3) then {_sound_start="fl_start_3";_sound_burn="fl_burn_3"};

[_object,[_sound_start,100]] remoteExec ["say3d"];

[_object,_sound_burn] spawn {
	_flare = _this select 0;
	_sound = _this select 1;
	sleep 0.5;
	while {alive _flare} do 
	{
		[_flare,[_sound,300]] remoteExec ["say3d"];
		sleep 2+random 2;
	};
};

// Draw visual effects for flares and chemlight tweaks
[[_object,"static",_colour],"AL_scripts\roadflare\al_roadflare_effect.sqf"] remoteExec ["execVM",0,true];

// Cleanup expired flares/chemlights
if (_lifetime > 0) then
{
	[_object, _lifetime] spawn
	{
		sleep (_this select 1);
		deleteVehicle _this select 0;
	};
};