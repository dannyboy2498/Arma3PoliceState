/*
	File: fn_acceptCall.sqf
	Author: Danny & Geari

	Description:
	Accepts selected callout in PNC dialog and makes the corresponding setpiece active
	
*/
if (IsNull (FindDisplay FARM_Dispatcher_PNCDialog)) exitWith {};
if ( vehicle player == player) exitWith {closeDialog 2;};

if ( lbCurSel FARM_Dispatcher_PNCContainer >= 0 ) then
{
	_index = lbCurSel FARM_Dispatcher_PNCContainer;

	// Update description and notify
	ctrlSetText [FARM_Dispatcher_PNCCallInfo, ((FARM_Dispatcher_calls select _index) select 1) select 1];

	if (((FARM_Dispatcher_calls select _index) select 1) select 0 == "Backup Reqested" ) then {
		playSound "help";
	}
	else {
		playSound "update";
	};

	// Spawn waypoint
	deleteWaypoint [group player, currentWaypoint group player];
	_pos = ((FARM_Dispatcher_calls select _index) select 1) select 2;
	_wp = group player addWaypoint [getMarkerPos _pos, 0];

	// Remove it from call list
	FARM_Dispatcher_calls deleteAt _index;
	call FARM_fnc_updatePnc;
};