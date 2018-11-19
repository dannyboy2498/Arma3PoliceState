waitUntil {!(IsNull (findDisplay 46))};
_keyDown = (findDisplay 46) displayAddEventHandler ["KeyDown", {_this spawn FARM_fnc_keyPressed}];

/*
FARM_playerTracker = {
	_beg = ASLToAGL eyePos player; 
	_endE = (_beg vectorAdd (eyeDirection player vectorMultiply 100)); 
	drawLine3D [ _beg, _endE, [0,1,0,1]]; 
	_endW = (_beg vectorAdd (player weaponDirection currentWeapon player vectorMultiply 100)); 
	drawLine3D [_beg, _endW, [1,0,0,1]];
};
["playerTracker", "onEachFrame", FARM_playerTracker] call BIS_fnc_addStackedEventHandler;
*/
execVM "initVars.sqf";
if (playerSide == west) then
{
	role = "Police";
	player setVariable ["Role", "Police", true];
} else {
	role = "Criminal";
	player setVariable ["Role", "Criminal", true];
};