/*
	File: fn_addAction.sqf
	Author: Danny

	Description:
	locally addAction for a specific client
	
	Arguments:
	_this select 0: OBJECT - object to addAction to
	_this select 1: STRING - text to display on action
	_this select 2: STRING - script to compile and execute
	_this select 3 (OPTIONAL): ARRAY - params to pass to function
	_this select 4 (OPTIONAL): STRING - string containing conditional code of when to show action
	
*/

private ["_target", "_text", "_script", "_args", "_priority", "_showWin", "_hoU", "_short", "_cond", "_actionsVar", "_actionsNum", "_id"];
_target = _this select 0;
_text = _this select 1;
_script = _this select 2;
_args = [];
_priority = 1.5;
_showWin = true;
_hoU = true;
_short = "";
_cond = "true";

if ((count _this) > 3) then {_args = _this select 3};
if ((count _this) > 4) then {_cond = _this select 4};

if(isNull _target || _text == "") exitWith {};

_actionsVar = _target getVariable ["actions", []];
_actionsNum = count _actionsVar;
_exit = false;
if (_actionsNum > 0) then
{
	for [{_i=0},{_i < _actionsNum}, {_i=_i+1}] do 
	{
		if ((_actionsVar select _i) select 0 == _text) exitWith {_exit = true};
	};
};

if (_exit) exitWith {};

_id = _target addAction [_text,compile _script,_args,_priority,_showWin,_hoU,_short,_cond];

_actionsVar = _actionsVar + [[_text, _id]];
_target setVariable ["actions", _actionsVar];

// Remove action when target is dead or deleted
[_target,_text,_id] spawn 
{
	_target = _this select 0;
	_title = _this select 1;
	_id = _this select 2;
	while {!isNull _target} do
	{
		if (!alive _target) then {[_target, _title] remoteExec ["FARM_fnc_removeAction"]};
		sleep 1;
	};
};