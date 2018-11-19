/*
	File: fn_findIdIssueDates.sqf
	Author: Danny
	
	Description:
	find a random issue/expiry dates for documents
*/
private ["_age", "_date_length_min", "_date_length_mid", "_date_length_max",
	"_float_length_min", "_float_length_mid", "_float_length_max", "_float_length","_date_length",
	"_float_date", "_float_issue_mid", "_float_issue_max", "_float_issue_min",
	"_float_issue", "_date_issue", "_float_expiry", "_date_expiry","_dates"];

_date_length_min = [2,1,1,0,0]; // in years,months,days,hours,minutes
_date_length_mid = [3,8,1,0,0];
_date_length_max = [4,11,1,0,0];

// find how long the document is issued for
_float_length_min = (dateToNumber _date_length_min) + 2; //date in float + years
_float_length_mid = (dateToNumber _date_length_mid) + 3;
_float_length_max = (dateToNumber _date_length_max) + 4;
_float_length = random [_float_length_min, _float_length_mid, _float_length_max];
_date_length = numberToDate [floor _float_length, _float_length % floor _float_length];

// find out when document is issued
_float_date = dateToNumber date + (date select 0);
_float_issue_mid = _float_date - (_float_length_mid*0.5);
_float_issue_max = _float_issue_mid + _float_length_max;
_float_issue_min = _float_issue_mid - _float_length_max;

_float_issue = random [_float_issue_min, _float_issue_mid, _float_issue_max];
_date_issue = numberToDate [floor _float_issue, _float_issue % floor _float_issue];
_float_expiry = _float_issue + _float_length;
_date_expiry = numberToDate [floor _float_expiry, _float_expiry % floor _float_expiry];

_dates = [_date_issue, _date_expiry];
_dates


