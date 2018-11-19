/*
	File: fn_findID.sqf
	Author: Danny
	
	Description:
	retrieve unique civ ID from details
*/
private ["_name", "_dob", "_dobString", "_areaCode", "_year", "_lastdigits", "_randID"];
_name = _this select 0;
_dob = _this select 1;
_areaCode = _this select 2;
_civID = _this select 3;

_dobString = [_dob] call FARM_fnc_dateToString;
_year = _dobString select 0;
_lastdigits = if (count _year > 1) then 
{
	[_year select [count _year - 1, 1], _year select [count _year - 2, 1]]
} else {
	[_year select [0], _year select [0]]
};
_civID = ([[_civID]] call FARM_fnc_dateToString) select 0;
_id = format ["TP%1-%2-%3%4%5-%6%7%8", _areaCode, toUpper ((_name select 2) select [0, 4]), toUpper ((_name select 2) select [4, 1]), _lastdigits select 1, _dobString select 1, _lastdigits select 0, toUpper ((_name select 1) select [0, 1]), _civID];

_id 