/*
	File: fn_requestBackup.sqf
	Author: Danny

	Description:
	Adds a callout to all networked players (and perhaps AI police) for assistance
	
*/

playSound "askhelp";
["Backup Requested", "A fellow officer has asked for assistance.", "crime_1"] remoteExecCall ["FARM_fnc_addCall"];

// Delete it from current players pnc
calls deleteAt (count calls - 1);