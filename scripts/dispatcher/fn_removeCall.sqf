private ["_id", "_index"];
_id = _this select 0;

_index = [FARM_Dispatcher_calls, _id] call BIS_fnc_findInPairs;
FARM_Dispatcher_calls deleteAt _index;

// Callout expired but still exists