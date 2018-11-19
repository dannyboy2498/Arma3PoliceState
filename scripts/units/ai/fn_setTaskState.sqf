private["_group","_state"];
_group = _this select 0;
_state = _this select 1;

_group setVariable ["FARM_taskState",_state,true];

if(FARM_Debug_AI) then {
	systemchat format["%1 is now in state %2",_group,_state];
};