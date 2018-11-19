/*
	File: fn_spawnLight.sqf
	Author: Danny

	Description:
	Spawn a lightpoint attach to an object source
	
	Arguments:
	_this select 0: OBJECT - object to attach light to
	_this select 1: ARRAY - [0->1 red, 0->1 green, 0->1 blue] colour array;
	_this select 2: ARRAY - [0->1 red, 0->1 green, 0->1 blue] colour array of light reflected off surrounding objects;
	_this select 3: NUMBER - 0->1 light brightness;
	_this select 4 (OPTIONAL): ARRAY - offset with respect to source;
	_this select 5 (OPTIONAL): NUMBER - length of time (in seconds) for the light to exist;
	
*/

private ["_source","_colour","_colourAmbient","_luminosity", "_offset", "_lifetime"];
_source = _this select 0;
_colour = _this select 1;
_colourAmbient = _this select 2;
_luminosity = _this select 3;
_offset = [0,0,0];
if (count _this > 4) then {_offset = _this select 4};
_lifetime = -1;
if (count _this > 5) then {_lifetime = _this select 5};

_light = "#lightpoint" createVehicleLocal (position _source);
_light setLightColor[_colour select 0, _colour select 1, _colour select 2];
_light setLightAmbient[_colour select 0, _colour select 1, _colour select 2];
_light setLightBrightness _luminosity;
_light attachTo [_source,_offset];

if (_lifetime != -1) then
{
	sleep _lifetime;
	deleteVehicle _light;
};

/* Example
_light setLightBrightness 0.01;
_light setLightColor[0.9, 0.9, 0.9];
_light setLightAmbient[0.7, 0.7, 0.7];

_light attachTo [player,[0,0,0]];
*/