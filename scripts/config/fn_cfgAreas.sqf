/*
	File: fn_cfgAreas.sqf
	Author: Danny
	
	Description:
	Config file for areas
	
	Arguments:
	_this select 0: STRING - location
	_this select 1: STRING - "code" to retrieve area code of location
*/

private["_area","_type"];
_area = _this select 0;
_type = _this select 1;

hint format ["%1", _area];
if(_area == "" or _type == "") exitWith {};


switch (_type) do
{
	case "code":
	{
		switch (_area) do
		{
			case "Tuvanka": {"21"};
			
			default {"00"};
		};
	};
};