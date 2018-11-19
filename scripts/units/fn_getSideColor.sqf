private["_side","_color"];
_side = [_this,0] call bis_fnc_param;

switch(_side) do {
	case (civilian):{_color = "ColorPurple";};
	case (FARM_VAR_sideAlly):{_color = "ColorBlue";};
	case (FARM_VAR_sideEnemy):{_color = "ColorRed";};
	case (FARM_VAR_sideNeutral):{_color = "ColorWhite";};
	default {_color = "ColorBlack";};
};
_color;
