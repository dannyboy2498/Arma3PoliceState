/*
	File: fn_say3D.sqf
	Author: Danny

	Description:
	Plays a sound on a local client
	
	Arguments:
	_this select 0: OBJECT - object that sound is coming from
	_this select 1: STRING - sound classname to play
	_this select 2 (OPTIONAL): BOOL - true to loop sound
	
*/
private ["_source","_sound", "_soundNum","_soundsVar", "_soundID","_exit","_soundEmitter"];

_source = _this select 0;
_sound = _this select 1;
_loop = false;
if (count _this > 2) then 
{
	_loop = _this select 2;
};
_exit = false;

if(isNull _source OR _sound == "") exitWith {};

_soundsVar = _source getVariable ["sounds", []];
_soundNum = count _soundsVar;
if (_soundNum > 0) then
{
	for [{_i=0},{_i < _soundNum}, {_i=_i+1}] do 
	{
		if ((_soundsVar select _i) select 0 == _sound) exitWith {_exit = true};
	};
};

if (_exit) exitWith {};

_soundEmitter = "#particlesource" createVehicleLocal position _source;
_soundEmitter hideObject true;
_soundEmitter attachTo [_source];

_period = [_sound,"period"] call FARM_fnc_cfgSounds;
_soundEmitter setVariable ["parent",_source];

_soundsVar = _soundsVar + [[_sound, _soundEmitter]];
_source setVariable ["sounds", _soundsVar];

// Stop sound when source is dead or deleted
[_source,_sound,_soundEmitter] spawn 
{
	_source = _this select 0;
	_sound = _this select 1;
	_soundEmitter = _this select 2;
	while {!isNull _soundEmitter} do 
	{
		if (!alive _source or isNull _source) then {detach _soundEmitter; deleteVehicle _soundEmitter; _soundEmitter = objNull};
	};
};

if (_loop) then 
{
	while {!isNull _soundEmitter} do
	{
		_soundEmitter say3D _sound;
		sleep (_period);
	};
	
	[_source, _sound] call FARM_fnc_stopSound;
	
} else 
{
	_soundEmitter say3D _sound;
	sleep _period;
	[_source, _sound] call FARM_fnc_stopSound;
};