/*
	File: fn_removeAction.sqf
	Author: Danny

	Description:
	locally remove first action by title
	
	Arguments:
	_this select 0: OBJECT - object to remove action from
	_this select 1: STRING - the displayed text of the action
	
*/

private ["_target", "_title", "_actionsVar", "_actionIndex"];
_target = _this select 0;
_title = _this select 1;

if (isNull _target) exitWith {};

_actionsVar = _target getVariable ["actions", []];
_actionIndex = [_actionsVar, _title] call BIS_fnc_findInPairs; //find index of action title/id pair in array

if (_actionIndex != -1) then
{
	private ["_id", "_actions"];
	_id = (_actionsVar select _actionIndex) select 1;

	_target removeAction _id;
	
	_actions = {_x select 0 == _title} count _actionsVar; // actions of the same title
	if (_actions > 0) then
	{
		[_target, "actions", [[_title, _id]]] call BIS_fnc_variableSpaceRemove;
	};
};
