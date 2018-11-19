/*
	File: fn_toggleSiren.sqf
	Author: Danny

	Description:
	Toggle police siren on vehicle
	
	Arguments:
	_this select 0: OBJECT - target vehicle object
	
*/

_source = _this select 0;
_siren = _source getVariable ["siren", 0];

switch (_siren) do
{
	case 0:
	{
		hint "Siren setting: 1";
		_source setVariable ["siren", 1, true];
		[_source,"siren_1", true] remoteExec ["FARM_fnc_say3D"];
	};
	
	case 1:
	{
		hint "Siren setting: 2";
		_source setVariable ["siren", 2, true];
		[_source, "siren_1"] remoteExec ["FARM_fnc_stopSound"];
		[_source,"siren_2", true] remoteExec ["FARM_fnc_say3D"];
	};

	case 2:
	{
		hint "Siren setting: 3";
		_source setVariable ["siren", 3, true];
		[_source, "siren_2"] remoteExec ["FARM_fnc_stopSound"];
		[_source,"siren_3", true] remoteExec ["FARM_fnc_say3D"];
		
	};
	
	default
	{
		hint "Siren setting: Off";
		_source setVariable ["siren", 0, true];
		[_source, "siren_3"] remoteExec ["FARM_fnc_stopSound"];
	};
};