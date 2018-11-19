//Compile important functions for this script.
VCOM_DRIVE_DEBUG = 0;
VCOM_fnc_VehicleDetection = compile preprocessFile "VCOM\Driving\Functions\VCOM_fnc_VehicleDetection.sqf";
VCOM_fnc_IsDriver = compile preprocessFile "VCOM\Driving\Functions\VCOM_fnc_IsDriver.sqf";

VCOM_fnc_Enable =
{
	_driver = _this select 0;
	if (local _driver) then 
	{
		_CheckVariable = _driver getVariable "VCOM_FSMRunning";
		if (isNil ("_CheckVariable")) then {_CheckVariable = 0;};
		if (!(isplayer _driver) && (_CheckVariable isEqualTo 0)) then {null = [_driver] execFSM "VCOM\Driving\Functions\AIDRIVEBEHAVIOR.fsm";};
	};
};