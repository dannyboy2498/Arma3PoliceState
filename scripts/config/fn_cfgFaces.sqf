/*
	File: fn_cfgFaces.sqf
	Author: Danny
	
	Description:
	Config file for faces
	
	Arguments:
	_this select 0: STRING - face classname
	_this select 1: STRING - "image" to receive image name of corresponding face
*/

private["_face","_type"];
_face = _this select 0;
_type = _this select 1;
if(_face == "" or _type == "") exitWith {};


switch (_type) do
{
	case "image":
	{
		switch (_face) do
		{
			// African
			case "AfricanHead_01": {"african_1"};
			case "AfricanHead_02": {"african_2"};
			case "AfricanHead_03": {"african_3"};
			case "Barklem": {"african_b"};
			
			// Asian
			case "AsianHead_A3_01": {"asian_1"};
			case "AsianHead_A3_02": {"asian_2"};
			case "AsianHead_A3_03": {"asian_3"};
			case "AsianHead_A3_04": {"asian_4"};
			case "AsianHead_A3_05": {"asian_5"};
			case "AsianHead_A3_06": {"asian_6"};
			case "AsianHead_A3_07": {"asian_7"};
			
			// White
			case "WhiteHead_01": {"white_1"};
			case "WhiteHead_02": {"white_2"};
			case "WhiteHead_03": {"white_3"};
			case "WhiteHead_04": {"white_4"};
			case "WhiteHead_05": {"white_5"};
			case "WhiteHead_06": {"white_6"};
			case "WhiteHead_07": {"white_7"};
			case "WhiteHead_08": {"white_8"};
			case "WhiteHead_09": {"white_9"};
			case "WhiteHead_10": {"white_10"};
			case "WhiteHead_11": {"white_11"};
			case "WhiteHead_12": {"white_12"};
			case "WhiteHead_13": {"white_13"};
			case "WhiteHead_14": {"white_14"};
			case "WhiteHead_15": {"white_15"};
			case "WhiteHead_16": {"white_16"};
			case "WhiteHead_17": {"white_17"};
			case "WhiteHead_18": {"white_18"};
			case "WhiteHead_19": {"white_19"};
			case "WhiteHead_20": {"white_20"};
			case "WhiteHead_21": {"white_21"};
			case "Sturrock": {"white_s"};
			
			// Tanoan
			case "TanoanHead_A3_01": {"tanoan_1"};
			case "TanoanHead_A3_02": {"tanoan_2"};
			case "TanoanHead_A3_03": {"tanoan_3"};
			case "TanoanHead_A3_04": {"tanoan_4"};
			case "TanoanHead_A3_05": {"tanoan_5"};
			case "TanoanHead_A3_06": {"tanoan_6"};
			case "TanoanHead_A3_07": {"tanoan_7"};
			case "TanoanHead_A3_08": {"tanoan_8"};
			
			default {"white_1"};
		};
	};
};