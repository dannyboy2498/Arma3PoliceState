private["_group","_position","_type","_formation","_speed","_combatmode","_onComplete","_script","_marker","_markername"];

_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param;
_position = [_this,1,[0,0,0],[[]]] call BIS_fnc_param;
_type = [_this,2,"MOVE",[""]] call BIS_fnc_param;
_formation = [_this,3,"COLUMN",[""]] call BIS_fnc_param;
_speed = [_this,4,"LIMITED",[""]] call BIS_fnc_param;
_combatMode = [_this,5,"SAFE",[""]] call BIS_fnc_param;
_onComplete = [_this,6,"",[""]] call BIS_fnc_param;


if(FARM_DEBUG_AI) then 
{
	if(_group getVariable ["FARM_DEBUG_tracked", false]) then 
	{
		[_group] spawn FARM_fnc_trackGroup;
		_group setVariable ["FARM_DEBUG_tracked", true, true];
	};
};
if(FARM_DEBUG_AI) then 
{
	_marker = _group getvariable ["a3e_debug_moveMarker","noMarker"];
	if(_marker == "noMarker") then {
		_marker = [getpos ((units _group) select 0),_position] call a3e_fnc_drawMapLine;
		_group setvariable ["a3e_debug_moveMarker",_marker,false];
	} else {
		[getpos leader _group,_position,_marker] call a3e_fnc_drawMapLine;
	};
};

if(count (waypoints _group) <= 1) then 
{
	_group addWaypoint [[0,0,0], 1];
};

[_group, 1] setWaypointPosition [_position, 1];
[_group, 1] setWaypointBehaviour _combatmode;
[_group, 1] setWaypointSpeed _speed;
[_group, 1] setWaypointFormation _formation;
[_group, 1] setWaypointType _type;
[_group, 1] setWaypointCompletionRadius 10;
[_group, 1] setWaypointStatements ["true", _onComplete];
_group setCurrentWaypoint [_group, 1];

[_group, 1]; //Return Waypoint