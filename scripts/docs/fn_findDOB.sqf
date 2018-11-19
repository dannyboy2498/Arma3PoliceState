/*
	File: fn_findDOB.sqf
	Author: Danny
	
	Description:
	find a random date of birth
*/
private ["_age", "_year", "_date_max", "_date_mid", "_date_min", "_float_date", "_date"];

_age = round random [16, 40, 92];
_year = (date select 0) - _age;
_date_max = [0,12,31,0,0];
_date_mid = [0,8,1,0,0];
_date_min = [0,1,1,0,0];

_float_date = random [dateToNumber _date_min, dateToNumber _date_mid, dateToNumber _date_max];
_date = numberToDate [_year, _float_date];

_date
