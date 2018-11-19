//Environmental & Atmosphere
//

//add flies around dead bodies (eerie & dark!)
_deadBody = _this select 0;
_deadBPos = getPosATL _deadBody;

while {true} do {
	{if (_x isKindOf "Man") then {_x = _deadBody}} forEach allDead;
	_flies = [position _deadBPos, 0.05, 1.5] call bis_fnc_flies;
	hint "bzzzz";
	sleep 2;
};
	
//