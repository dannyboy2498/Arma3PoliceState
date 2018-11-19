private["_unit","_anim","_type","_var","_value","_targetValue"];
_unit = _this select 0;
_anim = _this select 1;
_type = "none";

if (isNull _unit) exitWith {};
if (animationState _unit == _anim || vehicle _unit != _unit || !alive _unit) exitWith {};

if ((count _this) > 2) then 
{	
	_type = _this select 2;
	if (animationState _unit != "") then {[_unit] call FARM_fnc_animClear};
};


_unit switchMove _anim;

switch (_type) do
{
	case "freeze":
	{
		_delay = 0;
		if (count _this > 3) then {_delay = _this select 3};
		sleep _delay;
		_unit enableSimulation false;
	};

	case "loop": 
	{
		[_unit, "animChange", "AnimChanged", format ["[(_this select 0), ""%1""] spawn FARM_fnc_animUpdate", _anim]] spawn FARM_fnc_addEventHandler;
	};
};