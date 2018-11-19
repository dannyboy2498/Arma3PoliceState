/* generateCall.sqf
* By Geari (sorry in advance)
* Edited by Danny
* It is important to spawn the scene when the call is generated, 
* as this will ensure two players do not spawn the scene multiple times.
*
* Position for call
* Later on this can be moved to a function and you can specify a type
* of location. There can be ranges used to different types.
* Eg: Robbery markers are 0-15
*/


if (((count FARM_Dispatcher_calls) + 1) > FARM_Dispatcher_MaxCalls) exitWith {};

private ["_pos","_marker", "_marker_sea", "_spawn","_type","_args", "_id", "_pieceObjects"];
FARM_Dispatcher_activeCalls = FARM_Dispatcher_activeCalls + 1;

// Get position for call
_pos = round random FARM_Dispatcher_maxCrimePositions;
_marker = "crime_" + str(_pos);
_marker_sea = "sea_location_" + str(round random FARM_Dispatcher_maxSeaPositions);

_spawn = getMarkerPos _marker;

// Type of call
_type = round random 7;
_pieceObjects = [];
_args = switch (_type) do
{
	// Medics need assistance
	case 1: {
		
		private ["_amb", "_med"];
		// Spawn amb. and medic, add action
		_amb = "C_Van_02_medevac_F" createVehicle _spawn;
		_medic = createGroup civilian createUnit ["C_Man_Paramedic_01_F", _spawn, [], 0, "NONE"];
		[_medic, "handledDamageLTL", "HandleDamage", "[_this select 0, _this select 2, _this select 3] call FARM_fnc_handleDamageLTL"] spawn FARM_fnc_addEventHandler;
		[_medic, "Start Assistance", "(_this select 3) execVM ""calls\helpMedics.sqf""", [_medic]] remoteExec ["FARM_fnc_addAction"];

		_medic assignAsDriver _amb;
		[_medic] remoteExec ["VCOM_fnc_Enable", 2];
		_pieceObjects append [_medic, _amb];
		["Medics Need Assistance", "Medical crew are facing a potentially dangerous situation."]
	};

	// Shots fired
	case 2: {
		private ["_unit"];
		_unit = [_spawn, (round random 2) + 1] call FARM_fnc_spawnBandit;
		_pieceObjects pushBack [_unit];
		["Shots Fired", "Reports of automatic gunfire."]
	};

	// Stolen vehicle
	case 3: {
		private ["_car","_shooter"];
		// Spawn perp and car
		_car = "C_Hatchback_01_F" createVehicle _spawn;
		_shooter = [_spawn, (round random 2) + 1] call FARM_fnc_spawnBandit;
		
		// Get in car and drive somewhere
		_shooter assignAsDriver _car;
		[_shooter] orderGetIn true;
		_wp = group _shooter addWaypoint [_spawn, 2000];
		_pieceObjects append [_shooter, _car];
		["Vehicle Stolen","A citizen has had their vehicle stolen."]
	};

	// Robbery
	case 4: {
		private ["_vic"];
		// Spawn victim and speech
		_vic = [civilian, "C_Man_casual_1_F_tanoan", _spawn] call FARM_fnc_createUnit;
		[_vic, 0] spawn FARM_fnc_addSpeech;
		_pieceObjects pushBack [_vic];
		["Robbery", "A citizen has been the victim of a robbery."]
	};

	// Fight
	case 5: {
		private ["_man1","_man2"];
		// Spawn dudes and set health
		_grp = createGroup civilian;
		_man1 = [_grp, "C_Man_casual_2_F_tanoan", _spawn, random 1] call FARM_fnc_createUnit;
		_man2 = [_grp, "C_Man_casual_3_F_tanoan", _spawn, random 1] call FARM_fnc_createUnit;
		
		[_man1, 1] spawn FARM_fnc_addSpeech;
		[_man2, 1] spawn FARM_fnc_addSpeech;
		_pieceObjects append [_man1, _man2];
		["Fight in Progress", "Reports of two males fighting."]
	};

	case 6: 
	{
		private ["_unit","_boat"];
		_boat = "C_Boat_Transport_02_F" createVehicle getMarkerPos _marker_sea;
		_unit = [civilian, getMarkerPos _marker_sea] call FARM_fnc_spawnCivilian;
		_unit assignAsDriver _boat;
		[_unit] orderGetIn true;
		null=[[_boat],"AL_scripts\roadflare\static_flare.sqf"] remoteExec ["execVM",0,true];
		_pieceObjects append [_unit, _boat];
		["Boat Stranded", "Reports of a emergency flare have been sighted at sea"]
	};
	case 7: 
	{
		private ["_unit","_island"];
		_island = "CraterLong" createVehicle getMarkerPos _marker_sea;
		_unit = [civilian, getMarkerPos _marker_sea] call FARM_fnc_spawnCivilian;
		_pieceObjects append [_unit, _island];
		["Person Stranded", "Reports of a people sighted stranded on an island"]
	};
	// TODO Add Smugglers
	default {
		["Officer Needs Assistance", ""]
	};
};
// Sync call and update gui
_id = [_args select 0, _args select 1, _marker] remoteExec ["FARM_fnc_addCall"];

// Update display if open
call FARM_fnc_updatePnc;

// Add expiry & timeout
[_id] spawn 
{
	sleep FARM_Dispatcher_defaultCallTimeout;
	[_this select 0] remoteExec ["FARM_fnc_removeCall"];
	sleep ((FARM_Dispatcher_defaultCallLifespan*60) - FARM_Dispatcher_defaultCallTimeout);
	_justPlayers = allPlayers - entities "HeadlessClient_F";
	{
		_obj = _x;
		_exit = false;
		while {!_exit} do 
		{
			_exit = true;
			{
				if (_x distance _obj < 200) then {_exit = false;};
			} forEach _justPlayers;
			sleep 5;
		};
		deleteVehicle _x;
	} forEach _pieceObjects;
	FARM_Dispatcher_activeCalls = FARM_Dispatcher_activeCalls - 1;
};