/*
	File: fn_inspectDocuments.sqf
	Author: Danny
	
	Description:
	inspect documents of unit
*/
private ["_unit", "_idVar", "_docsVar", "_dobString", "_issueDates","_index", "_idData", "_image", "_issueString", "_expiryString", "_areaCode"];
_unit = _this select 0;

if (isNull _unit) exitWith {};
if !(_unit isKindOf "Man") exitWith {};

_idVar = _unit getVariable ["Identity", []];
if (count _idVar == 0) then {_idVar = [_unit, false] call FARM_fnc_assignIdentity};

_docsVar = _unit getVariable ["Documents", []];
if (count _docsVar == 0) then 
{
	// assign national ID card
	_issueDates = [] call FARM_fnc_findIdIssueDates;
	_docsVar = [["NationalID", [_issueDates select 0, _issueDates select 1, "Tanoan", ceil random 99]]];
	_unit setVariable ["Documents", _docsVar, true];
};

_index = [_docsVar, "NationalID"] call BIS_fnc_findInPairs;
if (_index != -1) then 
{
	_idData = (_docsVar select _index) select 1;


createDialog "IDcard";

// Update Identity details
ctrlSetText [1010, toUpper ((_idVar select 0) select 2)]; // names
ctrlSetText [1008, ((_idVar select 0) select 1)];

_dobString = [(_idVar select 1)] call FARM_fnc_dateToString;
ctrlSetText [1012, format ["%1/%2/%3", _dobString select 2, _dobString select 1, _dobString select 0]]; // dob

_image = [_idVar select 2, "image"] call FARM_fnc_cfgFaces;
ctrlSetText [1200, format ["images\faces\%1.jpg", _image]]; // face image


// Update document details
ctrlSetText [1014, _idData select 1];

_issueString = [(_idData select 0)] call FARM_fnc_dateToString;
_expiryString = [(_idData select 1)] call FARM_fnc_dateToString;
ctrlSetText [1001, format ["%1/%2/%3", _issueString select 2, _issueString select 1, _issueString select 0]]; // issue date
ctrlSetText [1003, format ["%1/%2/%3", _expiryString select 2, _expiryString select 1, _expiryString select 0]]; // expiry date

//_areaCode = [_idVar select 3, "code"] call FARM_fnc_cfgAreas;
_areaCode = "21";
ctrlSetText [1006, [_idVar select 0, _idVar select 1, _areaCode, (_idData select 3)] call FARM_fnc_findID];
} else {
	hint "Target has no documents on them";
};