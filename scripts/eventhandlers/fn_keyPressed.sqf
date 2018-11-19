/*
	File: fn_keyHandler.sqf
	Author: Danny

	Description:
	Main key handler for keyDown event
*/

private ["_ctrl","_key","_shift","_ctrlKey","_alt","_interruptionKeys"];
_ctrl = _this select 0;
_key = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;
_interruptionKeys = [17,30,31,32]; // W,A,S,D


if((_key in (actionKeys "GetOver") || _key in (actionKeys "salute")) && (player getVariable ["Restrained",false])) exitWith {true};
//hint format ["%1", _key];
switch (_key) do 
{	
	case 33: // F key (action key)
	{
		if (role == "Police") then
		{
			_nObj = vehicle player;
			if (_nObj != player) then // check whether player is in vehicle
			{
				if !(_shift) then 
				{
					[_nObj] spawn FARM_fnc_toggleSiren;
				} else {
					[_nObj] spawn FARM_fnc_toggleLightbar;
				};
				
			} else 
			{
				_nObj = cursorTarget;
				if !(_shift) then 
				{
					_target = player getVariable ["LiftedObject", objNull];
					if (!isNull _target) then
					{
						[_target] spawn FARM_fnc_escortStop;
						
					} else {
						
						if (!isNull _nObj) then
						{
							if (_nObj isKindOf "Man") then 
							{
								if (captive _nObj || _nObj getVariable ["Stunned", false] || isPlayer _nObj) then
								{
									if ((player distance _nObj) < 2) then 
									{
										if (_nObj getVariable ["Restrained", false]) then
										{
											[player, _nObj] spawn FARM_fnc_escort;
										} else {
											[_nObj, true] spawn FARM_fnc_toggleBound;
										};
									};
								} else 
								{
									[_nObj, true] spawn FARM_fnc_toggleCaptive;
								};
							} else {
								if (_nObj isKindOf "Car") then 
								{
									if (((player distance _nObj) < 8) && (alive driver _nObj) && !(isNull driver _nObj)) then {[driver _nObj, _nObj] remoteExec ["FARM_fnc_orderOutCargo", owner _nObj]};
								};
							};
						};
					
					};
				} else {
					if (_nObj isKindOf "Man") then 
					{
						if ((player distance _nObj) < 2) then 
						{
							[_nObj, false] spawn FARM_fnc_toggleBound;
						};
					} else {
						if (_nObj isKindOf "Car") then 
						{
							hint "Impounding Vehicle...";
							sleep 2;
							deleteVehicle  _nObj;
							hint "Vehicle successfully impounded!";
						};
					};
				};
			};
		} else {
			if (_shift) then 
			{
				_weps = player getVariable ["holster", []];
				if (count _weps > 0) then 
				{
					[player] spawn FARM_fnc_unholsterWeapons;
				} else {
					[player] spawn FARM_fnc_holsterWeapons;
				};
			} else {
				_target = cursorTarget;
				if (!isNull _target) then
				{
					if (!isPlayer _target) then 
					{
						if (_target isKindOf "Man") then 
						{
							[_target] spawn FARM_fnc_setStunned;
						} else {
							if ((_target isKindOf "Car")) then 
							{
								if (((player distance _target) < 8) and (alive driver _target) and !(isNull driver _target)) then {[driver _target, _target] remoteExec ["FARM_fnc_orderOutCargo", owner _target]};
							};
						};
					};
				};
			};
		};
	};
	
	case 21: // Y Key
	{
		if (vehicle player == player) then 
		{
			[cursorTarget] spawn FARM_fnc_inspectDocuments;
		} else {
			createDialog "PncCalls";
		};
	};
	
	case 48: //B Key
	{
		//systemChat "whehey";
		//[] spawn FARM_fnc_generateCall;
		_objs = ((nearestObjects [player,["Man"],5]) - [player]);
		if (count _objs > 0) then 
		{
			_nObj = _objs select 0;
			if (!alive _nObj) then
			{
				player action ["hideBody", _nObj];
				hint format["Here lies %1, may they rest in peace", name _nObj];
				sleep 5;
				deleteVehicle _nObj;
			};
		};
	};
	
	case 20: //T Key
	{
		if (role == "Police") then
		{
			if !(_shift) then 
			{
				_taser = player getVariable ["taserOut", false];
				if (_taser) then 
				{
					[player] spawn FARM_fnc_holsterTaser;
				} else {
					[player] spawn FARM_fnc_unholsterTaser;
				};
			} else {
				/*
				_ltl = player getVariable ["ltl", []];
				if (count _ltl > 0) then
				{
					hint "LTL rounds removed";
					[player] spawn FARM_fnc_removeLTL;
				} else {
					hint "LTL rounds applied";
					[player, 0.1, 0.5] spawn FARM_fnc_applyLTL;
				};
				*/
			};
		};
	};

	case 18 : // E Key
	{
		// Emptied
	};
	
	case 59: // F1 Key
	{
		// Emptied
	};
};
_handled

