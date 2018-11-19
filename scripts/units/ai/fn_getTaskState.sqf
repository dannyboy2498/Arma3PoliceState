private["_group","_state"];
_group = _this select 0;

_state = _group getvariable ["FARM_taskState","IDLE"];
_state;