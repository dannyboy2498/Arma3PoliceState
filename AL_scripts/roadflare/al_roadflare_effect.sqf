// by ALIAS
// Roadflare DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons

private ["_al_roadflare","_flare_azimut","_fum_flare","_al_throwable_light","_al_spark","_press_implicit_x","_press_implicit_y"];

if (!hasInterface) exitWith {};

_al_roadflare	= _this select 0;
_type_roadflare = _this select 1;
_culoare_elem	= _this select 2;

_flare_azimut =  getDir _al_roadflare; //hint str _flare_azimut;

if (_flare_azimut<=90) then {
	_press_implicit_x = linearConversion [0, 90,_flare_azimut, 0, 1, true];
	_press_implicit_y = 1-_press_implicit_x;
};

if ((_flare_azimut>90)and(_flare_azimut<180)) then {
	_flare_azimut = _flare_azimut-90;
	_press_implicit_x = linearConversion [0, 90,_flare_azimut, 1, 0, true];
	_press_implicit_y = _press_implicit_x-1;
};

if ((_flare_azimut>180)and(_flare_azimut<270)) then {
	_flare_azimut = _flare_azimut-180;
	_press_implicit_x = linearConversion [0, 90,_flare_azimut, 0, -1, true];
	_press_implicit_y = (-1*_press_implicit_x)-1;
};

if ((_flare_azimut>270)and(_flare_azimut<360)) then {
	_flare_azimut = _flare_azimut-270;
	_press_implicit_x = linearConversion [0, 90,_flare_azimut, -1, 0, true];
	_press_implicit_y = 1+_press_implicit_x;
};

if (_type_roadflare=="static") then 
{
	_fum_flare = "#particlesource" createVehicleLocal getPosATL _al_roadflare;
	_fum_flare setParticleCircle [0,[0,0,0]];
	_fum_flare setParticleRandom [1,[0.1,0.1,0.1],[_press_implicit_x*0.5,_press_implicit_y*0.5,0.5],5,0.1,[1,0,0,0.1],0.5,0];
	_fum_flare setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1,5,[0,0,0],[_press_implicit_x*1.5,_press_implicit_y*1.5,0.1],10,10,7.9,0.4,[0.5,1,3,5],[[1,0,0,1],[1,0.1,0.01,0.5],[0.1,0,0,0.7],[0,0,0,0]],[0.08],1,0,"","",_al_roadflare];
	_fum_flare setDropInterval 0.05;

	_al_spark = "#particlesource" createVehicleLocal getPosATL _al_roadflare;
	_al_spark setParticleCircle [0,[0,0,0]];
	_al_spark setParticleRandom [0.01,[0,0,0],[2,2,2],0,0.01,[1,1,1,1],1,0];
	_al_spark setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard",1,0.5,[0,0,0],[0,0,0],0,20,7.9,0,[0.015,0.015,0.015],[[1,1,1,1],[1,1,1,1],[1,1,1,0.5]],[0.08],1,0,"","", _al_roadflare];
	_al_spark setDropInterval 0.01;

	_al_throwable_light = "#lightpoint" createVehicle getPosATL _al_roadflare;  
	_al_throwable_light setLightAmbient _culoare_elem;  
	_al_throwable_light setLightColor _culoare_elem;
	_al_throwable_light setLightBrightness al_Roadflare_brightness;
	_al_throwable_light setLightUseFlare true;
	_al_throwable_light setLightFlareSize 0.1;
	_al_throwable_light setLightFlareMaxDistance 2000;
	_al_throwable_light setLightAttenuation [/*start*/ 0.1, /*constant*/10, /*linear*/40, /*quadratic*/ 2000, /*hardlimitstart*/al_Roadflare_range/1.1,/* hardlimitend*/al_Roadflare_range]; 
	_al_throwable_light setLightDayLight true;

 sleep 0.1;
 _al_throwable_light setpos (getPosATL _al_roadflare);
 _flare_done = false;
 _flare_life = 0 spawn {sleep al_Roadflare_lifetime-4};
 _int_mic=0;
 
 while {!_flare_done} do 
 {
	_int_mic = 0.05 + random 0.1;
	_brifct = [-10,10] call BIS_fnc_selectRandom;
	sleep _int_mic;
	_flare_brig = al_Roadflare_brightness + random _brifct;
	_al_throwable_light setLightBrightness _flare_brig;
	if (scriptDone _flare_life) then {_flare_done = true;};
 };
 
 // fum putin
 _fum_flare setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [(rad _flare_azimut)/10,2-(rad _flare_azimut)/10, 0.5], 65, 10, 7.9, 0.2, [0.3, 5, 5], [[1, 1, 1, 0.05], [0.8, 0.8, 1, 0], [1, 1, 1, 0]], [0.08], 0.5, 0.3, "", "", _al_roadflare];
 _fum_flare setDropInterval 1;
 _al_spark setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 0.05, [0, 0, 0], [0, 0, 0], 0, 10, 7.9, 0.075, [0.03, 0.03, 0.03], [[1, 0.8, 0.8, 1], [0.25, 0.25, 0.25, 1], [1, 0.8, 0.7, 0.5]], [0.08], 1, 0, "", "", _al_roadflare];
 _al_spark setDropInterval 0.1;

 _flare_brig = 30;
 
 while {_flare_brig>0} do {
 _flare_brig = _flare_brig - 1;
 _al_throwable_light setLightBrightness _flare_brig;
 sleep 0.1;
 };
	
 deleteVehicle _al_throwable_light;
};

if (_type_roadflare=="roadster") then 
{
	_fum_flare = "#particlesource" createVehicleLocal getPosATL _al_roadflare;
	_fum_flare setParticleCircle [0,[0,0,0]];
	_fum_flare setParticleRandom [1,[0.1,0.1,0.1],[_press_implicit_x*0.5,_press_implicit_y*0.5,0.5],5,0.1,[1,0,0,0.1],0.5,0];
	_fum_flare setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1,5,[0,0,0],[_press_implicit_x*1.5,_press_implicit_y*1.5,0.1],10,10,7.9,0.4,[0.5,1,3,5],[[1,0,0,1],[1,0.1,0.01,0.5],[0.1,0,0,0.7],[0,0,0,0]],[0.08],1,0,"","",_al_roadflare];
	_fum_flare setDropInterval 0.05;

	_al_spark = "#particlesource" createVehicleLocal getPosATL _al_roadflare;
	_al_spark setParticleCircle [0,[0,0,0]];
	_al_spark setParticleRandom [0.01,[0,0,0],[2,2,2],0,0.01,[1,1,1,1],1,0];
	_al_spark setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard",1,0.5,[0,0,0],[0,0,0],0,20,7.9,0,[0.015,0.015,0.015],[[1,1,1,1],[1,1,1,1],[1,1,1,0.5]],[0.08],1,0,"","", _al_roadflare];
	_al_spark setDropInterval 0.01;
	
	waitUntil {vectorMagnitude velocity _al_roadflare < 0.2};
	
	_al_throwable_light = "#lightpoint" createVehicle getPosATL _al_roadflare;  
	_al_throwable_light setLightAmbient _culoare_elem;  
	_al_throwable_light setLightColor _culoare_elem;
	_al_throwable_light setLightBrightness al_Roadflare_brightness;
	_al_throwable_light setLightUseFlare true;
	_al_throwable_light setLightFlareSize 0.1;
	_al_throwable_light setLightFlareMaxDistance 2000;
	_al_throwable_light setLightAttenuation [0.1,10,40,2000,al_Roadflare_range/1.1,al_Roadflare_range]; 
	_al_throwable_light setLightDayLight true;

	sleep 0.1;
	_al_throwable_light attachTo [ _al_roadflare,[0, 0, 0.01]];
	_flare_done = false;
	_flare_life = 0 spawn {sleep al_Roadflare_lifetime-4;};
	_int_mic=0;
	
	while {!_flare_done} do {
		_int_mic = 0.05 + random 0.1;
		_brifct = [-10,10] call BIS_fnc_selectRandom;
		sleep _int_mic;
		_flare_brig = al_Roadflare_brightness + random _brifct;
		_al_throwable_light setLightBrightness _flare_brig;
		if (scriptDone _flare_life) then {_flare_done = true;};
	};
	detach _al_throwable_light;
	 // fum putin
	 _fum_flare setParticleParams [["\A3\data_f\cl_basic", 1, 0, 1], "", "Billboard", 1, 2, [0, 0, 0], [(rad _flare_azimut)/10,2-(rad _flare_azimut)/10, 0.5], 65, 10, 7.9, 0.2, [0.3, 5, 5], [[1, 1, 1, 0.05], [0.8, 0.8, 1, 0], [1, 1, 1, 0]], [0.08], 0.5, 0.3, "", "", _al_roadflare];
	 _fum_flare setDropInterval 1;
	 _al_spark setParticleParams [["\A3\data_f\cl_exp", 1, 0, 1], "", "Billboard", 1, 0.05, [0, 0, 0], [0, 0, 0], 0, 10, 7.9, 0.075, [0.03, 0.03, 0.03], [[1, 0.8, 0.8, 1], [0.25, 0.25, 0.25, 1], [1, 0.8, 0.7, 0.5]], [0.08], 1, 0, "", "", _al_roadflare];
	 _al_spark setDropInterval 0.1;

	_flare_brig = 30;
	while {_flare_brig>0} do {
		_flare_brig = _flare_brig - 1;
		_al_throwable_light setLightBrightness _flare_brig;
		sleep 0.1;
	};
	deleteVehicle _al_throwable_light;	
};

if (_type_roadflare=="chemlit") then 
{
	waitUntil {vectorMagnitude velocity _al_roadflare < 0.2};
	if (al_chem) then {
		_al_throwable_light = "#lightpoint" createVehicle getPosATL _al_roadflare;  
		_al_throwable_light setLightAmbient _culoare_elem;  
		_al_throwable_light setLightColor _culoare_elem;
		_al_throwable_light setLightIntensity 50;
		_al_throwable_light setLightBrightness 10;
		_al_throwable_light setLightUseFlare false;
		_al_throwable_light setLightFlareSize 0.5;
		_al_throwable_light setLightFlareMaxDistance 2000;
		_al_throwable_light setLightAttenuation [0.1,100,50,500,10,20]; 
		_al_throwable_light setLightDayLight true;
		_al_throwable_light attachTo [ _al_roadflare,[0, 0, 0.01]];
		
		//sleep al_Roadflare_lifetime;
		while {!isNull _al_roadflare} do {sleep 0.5};
		deleteVehicle _al_throwable_light;
	};
};