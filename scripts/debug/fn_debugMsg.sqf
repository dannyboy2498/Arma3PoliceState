private["_msg"];
_msg = [_this, 0, "Empty message", [""]] call BIS_fnc_param;
if (!FARM_Debug) exitWith {};

waitUntil{time>2};
systemchat _msg;
diag_log("#FARM " + _msg);