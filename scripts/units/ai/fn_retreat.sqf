private["_group","_targetposition","_searchRange","_oncomplete","_destinationPos","_waypoint","_homeMarker"];
if(!isServer) exitwith {};

_group = _this select 0;
_targetposition = _this select 1;

_oncomplete = "";
[_group,"FLEE"] call FARM_fnc_setTaskState;


	_homeMarker = _group getVariable "FARM_regroupMarker";
	if(!isNil("_homeMarker")) then {
		_oncomplete = format["[group this,""%1""] spawn a3e_fnc_Patrol;",_homeMarker];
	} else {
		_oncomplete = "[group this,nil] spawn a3e_fnc_Patrol;";
	};


_waypoint = [_group,_targetposition,"MOVE","LINE","FULL","AWARE",_oncomplete] call FARM_fnc_move;

if(!isNil("_waypoint")) then 
{
	_waypoint setWaypointTimeout [0, 0, 0];
};