/*
	File: fn_updatePNC.sqf
	Author: Danny & Geari

	Description:
	Fills PNC dialog with dispatcher calls
	
*/
private ["_index", "_indexLast"];

if (IsNull (FindDisplay FARM_Dispatcher_PNCDialog)) exitWith {};
if (vehicle player == player) exitWith {closeDialog 2;};

lbClear FARM_Dispatcher_PNCContainer;
{
	_index = lbAdd [FARM_Dispatcher_PNCContainer, (_x select 1) select 0];
} forEach FARM_Dispatcher_calls;

/*
_indexLast = -1;
while {!isNull (FindDisplay FARM_Dispatcher_PNCDialog)} do
{
	_index = lbCurSel FARM_Dispatcher_PNCContainer;
	if (_index != _indexLast) then 
	{
		if (_index == -1) then {ctrlSetText [FARM_Dispatcher_PNCCallInfo, ""]} else {ctrlSetText [FARM_Dispatcher_PNCCallInfo, ((FARM_Dispatcher_calls select _index) select 1) select 1]};
		_indexLast = _index;
	};
	sleep 0.1;
};*/