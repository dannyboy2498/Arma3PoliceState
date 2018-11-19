ENGTASKS_setCreatedAndAssignedAsCreated = {
	private ["_taskName", "_realTaskName"];
	private ["_sFnc"];
	
	_taskName = _this select 0;
	_realTaskName = _this select 1;
	
	// Find all other CREATED or ASSIGNED tasks and set their task state to CREATED.
	{
		private ["_name", "_state"];
		
		_name = _x select 0;
		_state = _x select 2;

		if ((_state == "CREATED" || _state == "ASSIGNED") && _name != _taskName) then {
			_sFnc = _realTaskName + " setTaskState ""CREATED"";";
			call compile _sFnc;
		};
	} foreach ENGTASKS_TaskList;
};

// Gets an existing task from the global task list.
// Returns a task array ([taskName, taskDescription, taskState, taskDestination/taskTarget]). En empty array if the task was not found ([]).
ENGTASKS_GetTaskListItem = {
	private ["_taskVarName"];
	private ["_result"];
	
	_taskVarName = _this select 0;
	_result = [];
	
	{
		if ((_x select 0) == _taskVarName) then {
			_result = _x
		};
	} foreach ENGTASKS_TaskList;

	_result
};

// Creates all local tasks from the global task list.
ENGTASKS_CreateTasksFromTaskList = {
	private ["_taskName", "_taskDescription", "_taskState", "_taskTargetDestination"];
	private ["_index", "_array", "_assignedIndex"];
	
	// Find index for task with state ASSIGNED
	_index = 0;
	{
		if (count _x > 2) then { _taskState = _x select 2; } else { _taskState = "CREATED"; };

		_assignedIndex = -1;
		if (_taskState == "ASSIGNED") then {
			_assignedIndex = _index;
		};

		_index = _index + 1;
	} foreach ENGTASKS_TaskList;

	// Create the tasks
	_index = 0;
	{
		_taskName = _x select 0;
		_taskDescription = _x select 1;
		if (count _x > 2) then { _taskState = _x select 2; } else { _taskState = "CREATED"; };
		if (count _x > 3) then { _taskTargetDestination = _x select 3; } else { _taskTargetDestination = []; };
		
		if (_taskState == "ASSIGNED" && _index != _assignedIndex) then {
			_taskState = "CREATED";
		};
		
		// If task description is a string, split it up on short and long description.
		if (typename _taskDescription == "STRING") then {
			_taskDescription = [_taskDescription, _taskDescription];
		};
		
		_array = [_taskName, _taskDescription, _taskState, _taskTargetDestination, false];
		ENGTASKS_TaskList set [_index, _array];
		
		_array call ENGTASKS_CreateTaskLocal;
		_index = _index + 1;
	} foreach ENGTASKS_TaskList;
	
	ENGTASKS_TasksLocallyCreated = true;
};

// Creates a task on current machine.
// Arguments:
//   [taskName, taskDescription, taskState (optional), showNotification (optional), taskTargetDestination (optional)]
ENGTASKS_CreateTaskLocal = {
	private ["_taskName", "_taskDescription", "_taskState", "_showNotification", "_taskTargetDestination"];
	private ["_realTaskName", "_sFnc", "_isDestination", "_isTarget"];

	_taskName = _this select 0;
	_taskDescription = _this select 1;
	_taskState = _this select 2;
	_taskTargetDestination = _this select 3;
	_showNotification = _this select 4;
	
	_realTaskName = ENGTASKS_TaskPreName + _taskName;
	
	// Create task
	_sFnc = _realTaskName + " = player createSimpleTask [""" + (_taskDescription select 0) + """];";
	call compile _sFnc;
	
	// Set task description
	_sFnc = _realTaskName + " setSimpleTaskDescription [""" + (_taskDescription select 1) + """, """ + (_taskDescription select 0) + """, """"];";
	call compile _sFnc;
	
	if (_taskState == "ASSIGNED") then {
		[_taskName, _realTaskName] call ENGTASKS_setCreatedAndAssignedAsCreated;
	
		// Set task as current task
		_sFnc = "player setCurrentTask " + _realTaskName + ";";
		call compile _sFnc;
	};

	// Set task state
	_sFnc = _realTaskName + " setTaskState """ + _taskState + """;";
	call compile _sFnc;
	
	if (count _taskTargetDestination > 0) then {
		_isDestination = typename (_taskTargetDestination select 0) == "SCALAR";
		_isTarget = !_isDestination;
		
		// If task destination is set, set task destination
		if (_isDestination) then {
			_sFnc = _realTaskName + " setSimpleTaskDestination " + str _taskTargetDestination + ";";
			call compile _sFnc;
		};
		if (_isTarget) then {
			_sFnc = _realTaskName + " setSimpleTaskTarget " + str _taskTargetDestination + ";";
			call compile _sFnc;
		};
	};
	
	// Show notification to user
	if (_showNotification) then {
		["TaskCreated", ["", _taskDescription select 0]] call BIS_fnc_showNotification;
	};
};

// Sets task state on a task on the local machine.
// Arguments:
//   [Task name, Task state]
ENGTASKS_SetTaskStateLocal = {
	private ["_taskName", "_taskState", "_showNotification"];
	private ["_realTaskName", "_sFnc", "_taskDescription", "_notificationType"];

	_taskName = _this select 0;
	_taskState = _this select 1;
	_showNotification = _this select 2;

	_realTaskName = ENGTASKS_TaskPreName + _taskName;
	
	// Determine notification type
	_notificationType = "Task" + _taskState;

	// Get description
	_sFnc = "taskDescription " + _realTaskName;
	_taskDescription = (call compile _sFnc);
	
	// Set task state
	_sFnc = _realTaskName + " setTaskState """ + _taskState + """;";
	call compile _sFnc;
	
	if (_taskState == "ASSIGNED") then {
		[_taskName, _realTaskName] call ENGTASKS_setCreatedAndAssignedAsCreated;
	
		// Set task as current task
		_sFnc = "player setCurrentTask " + _realTaskName + ";";
		call compile _sFnc;
	};
	
	// Show
	if (_showNotification) then {
		[_notificationType, ["", _taskDescription select 1]] call BIS_fnc_showNotification;
	};
};

// Sets task description on a task on the local machine.
// Arguments:
//   [taskName, taskDescription, showNotification]
ENGTASKS_SetTaskDescriptionLocal = {
	private ["_taskName", "_taskDescription", "_showNotification"];
	private ["_sFnc"];

	_taskName = _this select 0;
	_taskDescription = _this select 1;
	_showNotification = _this select 2;

	_taskName = ENGTASKS_TaskPreName + _taskName;
	
	// Set task description
	_sFnc = _taskName + " setSimpleTaskDescription [""" + (_taskDescription select 1) + """, """ + (_taskDescription select 0) + """, """"];";
	call compile _sFnc;

	// Show
	if (_showNotification) then {
		["TaskUpdated", ["", _taskDescription select 0]] call BIS_fnc_showNotification;
	};
};

// Sets task destination on a task on the local machine.
// Arguments: [taskName, taskDestination, showNotification]
//   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
//   taskDestination:  Array - A position on form [x, y, z] defining a map position.
//   showNotification: Boolean - true to show notification to player. Otherwise false.
ENGTASKS_SetTaskDestinationLocal = {
	private ["_taskName", "_taskDestination", "_showNotification"];
	private ["_sFnc", "_taskDescription"];
	
	_taskName = _this select 0;
	_taskDestination = _this select 1;
	_showNotification = _this select 2;

	_taskName = ENGTASKS_TaskPreName + _taskName;
	
	// Get description
	_sFnc = "taskDescription " + _taskName;
	_taskDescription = (call compile _sFnc) select 1;
	
	// Set task destination
	_sFnc = _taskName + " setSimpleTaskDestination _taskDestination;";
	call compile _sFnc;

	// Show notification
	if (_showNotification) then {
		["TaskUpdated", ["", _taskDescription]] call BIS_fnc_showNotification;
	};
};

// Sets task target on a task on the local machine.
// Arguments: [taskName, taskTarget, precisePosition, showNotification]
//   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
//   taskTarget:       Object - A target object. Must exist on all machines in the network.
//   precisePosition:  Boolean - true to always show precise position. false to reflect what player "knows about" target. (Optional. Default = true.)
//   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
ENGTASKS_SetTaskTargetLocal = {
	private ["_taskName", "_taskTarget", "_precisePosition", "_showNotification"];
	private ["_sFnc", "_taskDescription"];

	_taskName = _this select 0;
	_taskTarget = _this select 1;
	_precisePosition = _this select 2;
	_showNotification = _this select 3;

	_taskName = ENGTASKS_TaskPreName + _taskName;
	
	// Get description
	_sFnc = "taskDescription " + _taskName;
	_taskDescription = (call compile _sFnc);
	
	// Set task target
	_sFnc = _taskName + " setSimpleTaskTarget " + str [_taskTarget, _precisePosition] + ";";
	call compile _sFnc;

	// Show
	if (_showNotification) then {
		["TaskUpdated", ["", _taskDescription select 1]] call BIS_fnc_showNotification;
	};
};

// Deletes a task on the local machine.
// Arguments:
//   [Task name]
ENGTASKS_DeleteTaskLocal = {
	private ["_taskName", "_showNotification"];
	private ["_sFnc", "_taskDescription"];

	_taskName = _this select 0;
	_showNotification = _this select 1;

	_taskName = ENGTASKS_TaskPreName + _taskName;
	
	// Get description
	_sFnc = "taskDescription " + _taskName;
	_taskDescription = (call compile _sFnc);
	
	// Delete local task
	_sFnc = "player removeSimpleTask " + _taskName + ";";
	call compile _sFnc;
	
	if (_showNotification) then {
		["TaskUpdated", ["", ("Task deleted: " + (_taskDescription select 1))]] call BIS_fnc_showNotification;
	};
};
