/*
	File: fn_cfgFaces.sqf
	Author: Danny
	
	Description:
	Config for faces
*/

private ["_type"];
_type = "all";
if (count _this > 0) then {_type = _this select 0};

_faces_african = ["AfricanHead_01","AfricanHead_02","AfricanHead_03"];
_faces_african_special = ["Barklem"];
_faces_african_total = _faces_african + _faces_african_special;


_faces_asian = ["AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","AsianHead_A3_04","AsianHead_A3_05","AsianHead_A3_06","AsianHead_A3_07"];
_faces_asian_total = _faces_asian;

_faces_tanoan = ["TanoanHead_A3_01","TanoanHead_A3_02","TanoanHead_A3_03","TanoanHead_A3_04","TanoanHead_A3_05","TanoanHead_A3_06","TanoanHead_A3_07","TanoanHead_A3_08"];
//_faces_tanoan_special = ["TanoanBossHead"];
_faces_tanoan_total = _faces_tanoan;

_faces_white = ["WhiteHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10",
	"WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15","WhiteHead_16","WhiteHead_17","WhiteHead_18","WhiteHead_19","WhiteHead_20",
	"WhiteHead_21"];
_faces_white_special = ["Sturrock"];
_faces_white_total = _faces_white + _faces_white_special;

_faces = _faces_african + _faces_asian + _faces_tanoan + _faces_white;
_faces_special = _faces_african_special + _faces_white_special;
_faces_total = _faces + _faces_special;

_face_array = switch (_type) do
{
	case "african": {_faces_african};
	case "asian": {_faces_asian};
	case "tanoan": {_faces_tanoan};
	case "white": {_faces_white};
	case "all": {_faces_total};
	
	default {_faces};
};

_random_face = _face_array select (floor (random (count _face_array)));
_random_face