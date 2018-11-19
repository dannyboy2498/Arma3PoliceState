ENGTASKS_TasksLocallyCreated = false;
ENGTASKS_TaskPreName = "ENGTASKS_UniqueTaskName";

call compile preprocessFileLineNumbers "Engima\SimpleTasks\Common\Functions.sqf";
call compile preprocessFileLineNumbers "Engima\SimpleTasks\Common\UserFunctions.sqf";
call compile preprocessFileLineNumbers "Engima\SimpleTasks\Common\EventHandlers.sqf";

// If JIP, then task list will be set here (if task list has changed), and then we don't want to set mission init values.
// If not JIP, then task list is empty, so we set the mission init values.
// On server the task list will always be nil.
if (isNil "ENGTASKS_TaskList") then {
	call compile preprocessFileLineNumbers "MissionTasks.sqf";
};

// If JIP, then the creation of tasks will be a problem if not player variable is set, so wait for it to be set here.
if (!isDedicated) then {
	if (!(player == player)) then {
		waitUntil { player == player };
	};
};

call ENGTASKS_CreateTasksFromTaskList;

if (isServer) then {
	call compile preprocessFileLineNumbers "Engima\SimpleTasks\Server\EventHandlers.sqf";
	call compile preprocessFileLineNumbers "Engima\SimpleTasks\Server\Functions.sqf";
};
