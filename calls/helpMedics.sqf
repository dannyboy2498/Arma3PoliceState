// helpMedics.sqf
// By Geari (sorry in advance)
// Triggered by an action on the medic
params["_me"];

[_me, "Start Assistance"] remoteExec ["FARM_fnc_removeAction"];

// Get in the ambulance and set a waypoint
[_me] orderGetIn true;
_wp = group _me addWaypoint [getPos _me, 400];

_patient = createGroup civilian createUnit ["C_Man_casual_1_F_tanoan", waypointPosition [group _me, currentWaypoint group _me], [], 0, "NONE"];
_patient setDamage random 1;
