// PNC Variables
FARM_Dispatcher_MaxCalls = 12;
FARM_Dispatcher_defaultCallTimeout = 60; //in seconds
FARM_Dispatcher_defaultCallLifespan = 10; //in minutes

/* --------------------- *
 *  DO NOT CHANGE BELOW  *
 * --------------------- */
 
//PNC window class IDs
FARM_Dispatcher_PNCDialog = 2200;
FARM_Dispatcher_PNCContainer = 1500;
FARM_Dispatcher_PNCCallInfo = 1000;

//Dummy variables
FARM_Dispatcher_calls = [];
FARM_Dispatcher_activeCalls = 0;
FARM_Dispatcher_maxCrimePositions = 63; // Markers called crime_ - Starting from 1 not 0
FARM_Dispatcher_maxSeaPositions = 34; 

// PNC Functions
// UPDATE: Functions moved to seperate scripts handled by functions.hpp

// Removed updatePnc
// TODO: updatePnc should check to ensure its the pnc window thats open

// Removed acceptCall
// TODO: Call should be deleted from other players after a
// short timer (in case multiple players want to get the waypoint)

// Removed callForBackup
// The callPos needs to be jiggled as it takes a marker name, but the players dont have markers
// We could make markers with their name like in altis life?

