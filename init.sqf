isClient = false;
isJIP = false;

if (!isDedicated) then { isClient = true };
if (isNull player) then { isJIP = true };

// Initialise Server Core
if (isServer) then //Server only
{
	[] spawn 
	{
		diag_log format ["############################# %1 #############################", missionName];
		diag_log "Initializing Server...";
	
		diag_log "Initializing Enigma Functions...";
		execVM "engima\Civilians\Init.sqf";
		execVM "engima\Traffic\Init.sqf";
		// compile preprocessFileLineNumbers "engima\SimpleTasks\Init.sqf";
		diag_log "Enigma Functions Loaded.";
		
		diag_log "Initializing VCOM Functions...";
		execVM "VCOM\Driving\init.sqf";
		diag_log "VCOM Functions Loaded.";
		
		execVM "AL_scripts\ini_roadflare.sqf";
		
		// Handle damage serverside only
		{[_x, "handledDamageLTL", "HandleDamage", "[_this select 0, _this select 2, _this select 3] call FARM_fnc_handleDamageLTL"] spawn FARM_fnc_addEventHandler;} forEach allUnits;
		
		// Make sure date and time are synced for all clients
		setTimeMultiplier 30;
		if (isMultiplayer) then 
		{
			waitUntil {time > 0};
			setDate (missionStart select [0,5]);
		};
		
		// Initialise Radio Dispatcher
		[] spawn
		{
			while {true} do
			{
				_sound = "player_radio_" + (str ceil random 16);
				_justPlayers = allPlayers - entities "HeadlessClient_F";
				{
					[_x,_sound] remoteExec ["say3D"];
				} forEach _justPlayers;
				
				_radio_time = random 5; //in minutes
				sleep ((_radio_time * 60) + ([_sound,"period"] call FARM_fnc_cfgSounds));
				if (ceil random 100 > 70) then 
				{
					[] spawn FARM_fnc_generateCall;
				};
			};
		};
		[] spawn
		{
			while {true} do
			{
				sleep ((round(random 15))*60);
				if (ceil random 100 > 90) then 
				{
					execVM "AL_scripts\ini_monsoon.sqf";
					sleep (15*60);
				};
			};
		};
	};
};

if (isClient) then
{
	[] spawn
	{
		if (hasInterface) then // Normal player
		{
			//9999 cutText ["Initialising client...", "BLACK", 0.01];
			waitUntil {!isNull player};
			//removeAllWeapons player;
			FARM_respawnEH = {
				removeAllWeapons (_this select 0);
			};
			player addEventHandler ["Respawn", FARM_respawnEH];
			
			// Reset group & side
			[player] joinSilent createGroup playerSide;
			execVM "initClient.sqf";

			//if ((vehicleVarName player) select [0,17] == "BIS_fnc_objectVar") then { player setVehicleVarName "" }; // undo useless crap added by BIS
		};
	};
};

if (hasInterface || isServer) then
{
	//Init 3rd party scripts
	[] spawn FARM_fnc_initDispatch;
};

