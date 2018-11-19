/*
	File: fn_animUpdate.sqf
	Author: Danny

	Description:
	TERRIBLY PRIMITIVE ANIM SYNC SCRIPT
	
	Arguments:
	_this select 0: OBJECT - object to force animate
	_this select 1: STRING - animation classname
	_this select 2 (OPTIONAL) : STRING - "loop" for animation looping, "freeze" to disable simulation and freeze in a specific state
	
	following arguments are necessary only if (_this select 2) is supplied:
	_this select 3: STRING - _this select 0 getVariable _this select 3 - variable to look for in object
	_this select 4: NUMBER OR STRING OR BOOL - anim plays while _this select 3 == _this select 4
	_this select 5 (FOR "freeze"): NUMBER - how long to wait animation to play for before freezing
	
	
*/

private["_unit","_anim","_exit","_type","_var","_value","_targetValue"];
_unit = _this select 0;
_anim = _this select 1;

if (isNull _unit) exitWith {};

_exit = false;
if ((count _this) > 2) then 
{
	_type = _this select 2;
	_var = _this select 3;	
	_targetValue = _this select 4;
	_value = _unit getVariable _var;
	if (typeName _value != typeName _targetValue) then {_exit = true};
};

if (_exit) exitWith {};

_unit switchMove _anim;

if (!isNil "_type") then 
{
	switch (_type) do
	{
		case "freeze":
		{
			_delay = 0;
			if (count _this > 5) then {_delay = _this select 5};
			sleep _delay;
			_unit enableSimulation false;
			//waitUntil{(_unit getVariable _var) != _targetValue; sleep 0.1};
		};

		case "loop": 
		{
			if (typeName _targetValue == "BOOL") then 
			{
				if (_targetValue) then
				{
					while {_unit getVariable _var && alive _unit} do
					{
						if (vehicle _unit == _unit) then
						{
							if (animationState _unit != _anim) then {_unit switchMove _anim};
							sleep 0.1;
						};
					};
				} else {
					while {!(_unit getVariable _var) && alive _unit} do
					{
						if (vehicle _unit == _unit) then
						{
							if (animationState _unit != _anim) then {_unit switchMove _anim};
							sleep 0.1;
						};
					};
				};
			} else {
				while {(_unit getVariable _var) == _targetValue && alive _unit} do
				{
					if (vehicle _unit == _unit) then
					{
						if (animationState _unit != _anim) then {_unit switchMove _anim};
						sleep 0.1;
					};
				};
			};
		};
	};
};