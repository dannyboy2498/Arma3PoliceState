params ["_title", "_desc", "_pos"];
private ["_calls","_id"];

// determine ID number to assign to call
_calls = count FARM_Dispatcher_calls;
_id = 0;
for [{_id=0}, {_id < _calls}, {_id = _id + 1}] do
{
	// exit if none of the active calls have id 0,1,2...
	if !(({_x select 0 == _id} count FARM_Dispatcher_calls) > 0) exitWith {};
};
		
FARM_Dispatcher_calls append [[_id, [_title, _desc, _pos]]];

if ( vehicle player != player ) then { playSound "chime"; };

_id 