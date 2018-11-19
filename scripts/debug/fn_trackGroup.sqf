private["_startpos","_endpos","_marker","_width","_length","_distanceY","_distanceX","_markername","_rotation","_text"];
_group = [_this,0] call bis_fnc_param;
_marker = _group getVariable "FARM_Debug_positionMarker";

if(isNil("_marker")) then 
{
	_markerName = format["FARM_Debug_positionMarker_%1",_group];
	_marker = createMarkerLocal [_markername,getposASL (leader _group)];
	_marker setMarkerShape "ICON";		
	_marker setMarkerType "mil_dot";
	_marker setMarkerColor ([side leader _group] call FARM_fnc_getSideColor);
	_group setvariable ["FARM_Debug_positionMarker",_marker,false];
};

while{!(isNull _group)} do {
	_marker setMarkerPos getPosATL (leader _group);
	_text = [_group] call FARM_fnc_getTaskState;
	_marker setMarkerText _text;
	if(count (units _group) == 0) exitWith {_marker setMarkerText "KIA";sleep 30;};
	sleep 5;
};
_group setVariable ["FARM_Debug_positionMarker",nil,false];
deleteMarker _marker;