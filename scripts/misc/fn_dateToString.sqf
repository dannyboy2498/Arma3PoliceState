/*
	File: fn_dateToString.sqf
	Author: Danny
	
	Description:
	convert a numerical date into a string date
*/
private ["_date", "_dateString"];
_date = _this select 0;
_dateString = [];
{
	if (count str _x == 1) then 
	{
		_dateString pushBack format ["0%1", _x];
	} else {
		_dateString pushBack str _x;
	};
} forEach _date;
_dateString 