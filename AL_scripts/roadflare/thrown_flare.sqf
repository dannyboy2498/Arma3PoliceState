// by ALIAS
// edited by Danny
// Roadflare DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons

private ["_magazine_fired","_lifetime","_type_flare","_flare_sound_burn","_flare_set","_flare_sound_start","_al_color_flare","_al_throwable_light","_flare_brig","_inter_flare","_int_mic","_al_throwable","_type_throwable","_flare_life","_flare_done"];

if (!isServer) exitWith {};

_al_throwable = _this select 0;
_magazine_fired = _this select 1;

// you need to list in array bellow the class names for flares you want to alter
_type_throwable = ["Chemlight_blue","Chemlight_red","Chemlight_yellow","Chemlight_green",al_flare_obj];

//hint format ["%1,%2,%3,%4,%5,%6,%7",_this select 1, _this select 2, _this select 3, _this select 4, _this select 5,_al_throwable, al_flare_obj];
if !(_magazine_fired in _type_throwable) exitWith {}; // Exit if not a valid throwable (stops errors)
if (isNull _al_throwable) exitWith {};
if (!isNil {_al_throwable getVariable "is_on_road_flare"}) exitWith {};
_al_throwable setVariable ["is_on_road_flare",true,true];

// Set colour of flare/chemlight tweak
_al_color_flare = switch (typeOf _al_throwable) do 
{
	case "Chemlight_blue": {[0.2,0.2,1]};
	case "Chemlight_yellow": {[0.7,1,0]};
	case "Chemlight_green": {[0.2,1,0.2]};
	case "Chemlight_red": {[1,0,0]};
	default {[1,0,0]};
};

// Determine whether to turn chemlight into flare
if (_magazine_fired == al_flare_obj) then
{
	_type_flare = "roadster";
	
	// Play flare sfx effects for static and thrown flares
	_flare_set = [1,2,3] call BIS_fnc_selectRandom;
	if (_flare_set==1) then {_flare_sound_start="fl_start_1";_flare_sound_burn="fl_burn_1"};
	if (_flare_set==2) then {_flare_sound_start="fl_start_2";_flare_sound_burn="fl_burn_2"};
	if (_flare_set==3) then {_flare_sound_start="fl_start_3";_flare_sound_burn="fl_burn_3"};

	[_al_throwable,[_flare_sound_start,100]] remoteExec ["say3d"];

	[_al_throwable,_flare_sound_burn] spawn {
		_al_flare_voice = _this select 0;
		_al_flare_arde = _this select 1;
		sleep 0.5;
		while {alive _al_flare_voice} do {
		[_al_flare_voice,[_al_flare_arde,300]] remoteExec ["say3d"];
		sleep 2+random 2 ;
		};
	};
	_lifetime = al_Roadflare_lifetime;
} else {
	_type_flare == "chemlit";
	_lifetime = 900; // Time until chemlight goes out
};

// Draw visual effects for flares and chemlight tweaks
[[_al_throwable,_type_flare,_al_color_flare],"AL_scripts\roadflare\al_roadflare_effect.sqf"] remoteExec ["execVM",0,true];

// Cleanup expired flares/chemlights
if (_lifetime > 0) then
{
	[_al_throwable, _lifetime] spawn
	{
		sleep (_this select 1);
		deleteVehicle _this select 0;
	};
};