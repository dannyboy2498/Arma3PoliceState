// Creates a task on all machines.
// Arguments: [taskName, description, state (optional), showNotification (optional)]
//   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
//   description:      String - Description displayed to player.
//   state:            String - Task state. (Optional. Default = "CREATED".)
//   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
ENGTASKS_CreateTask = {
	private ["_taskName", "_taskDescription", "_taskState", "_showNotification", "_taskDestinationTarget"];

	_taskName = _this select 0;
	_taskDescription = _this select 1;
	if (count _this > 2) then { _taskState = _this select 2; } else { _taskState = "CREATED"; };
	if (count _this > 3) then { _taskDestinationTarget = _this select 3; } else { _taskDestinationTarget = []; };
	if (count _this > 4) then { _showNotification = _this select 4; } else { _showNotification = true; };

	// If the task description is a string, correct it to be an array.
	if (typename _taskDescription == "STRING") then {
		_taskDescription = [_taskDescription, _taskDescription];
	};

	ENGTASKS_CreateTaskServerEventArgs = [_taskName, _taskDescription, _taskState, _taskDestinationTarget, _showNotification];
	
	if (isServer) then {
		ENGTASKS_CreateTaskServerEventArgs call ENGTASKS_CreateTaskServer;
	}
	else {
		publicVariableServer "ENGTASKS_CreateTaskServerEventArgs";
	};
	
	ENGTASKS_CreateTaskServerEventArgs = [];
};

// Sets task state on a task on all machines.
// Arguments: [taskName, state, showNotification (optional)]
//   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
//   state:            String - Task state. (Optional. Default = "CREATED".)
//   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
ENGTASKS_SetTaskState = {
	private ["_taskName", "_taskState", "_showNotification"];

	_taskName = _this select 0;
	_taskState = _this select 1;
	if (count _this > 2) then { _showNotification = _this select 2; } else { _showNotification = true; };

	ENGTASKS_SetTaskStateServerEventArgs = [_taskName, _taskState, _showNotification];
	
	if (isServer) then {
		ENGTASKS_SetTaskStateServerEventArgs call ENGTASKS_SetTaskStateServer;
	}
	else {
		publicVariableServer "ENGTASKS_SetTaskStateServerEventArgs";
	};
	
	ENGTASKS_SetTaskStateServerEventArgs = [];
};

// Sets task description on a task on all machines.
// Arguments: [taskName, description, showNotification (optional)]
//   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
//   description:      String - Description displayed to player.
//   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
ENGTASKS_SetTaskDescription = {
	private ["_taskName", "_taskDescription", "_showNotification"];

	_taskName = _this select 0;
	_taskDescription = _this select 1;
	if (count _this > 2) then { _showNotification = _this select 2; } else { _showNotification = true; };

	// If the task description is a string, correct it to be an array.
	if (typename _taskDescription == "STRING") then {
		_taskDescription = [_taskDescription, _taskDescription];
	};

	ENGTASKS_SetTaskDescriptionServerEventArgs = [_taskName, _taskDescription, _showNotification];
	
	if (isServer) then {
		ENGTASKS_SetTaskDescriptionServerEventArgs call ENGTASKS_SetTaskDescriptionServer;
	}
	else {
		publicVariableServer "ENGTASKS_SetTaskDescriptionServerEventArgs";
	};
	
	ENGTASKS_SetTaskStateServerEventArgs = [];
};

// Sets task destination on a task on all machines.
// Arguments: [taskName, taskDestination, showNotification (optional)]
//   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
//   taskDestination:  Array - A position on form [x, y, z] defining a map position.
//   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
ENGTASKS_SetTaskDestination = {
	private ["_taskName", "_taskDestination", "_showNotification"];

	_taskName = _this select 0;
	_taskDestination = _this select 1;
	if (count _this > 2) then { _showNotification = _this select 2; } else { _showNotification = true; };

	ENGTASKS_SetTaskDestinationServerEventArgs = [_taskName, _taskDestination, _showNotification];
	
	if (isServer) then {
		ENGTASKS_SetTaskDestinationServerEventArgs call ENGTASKS_SetTaskDestinationServer;
	}
	else {
		publicVariableServer "ENGTASKS_SetTaskDestinationServerEventArgs";
	};
	
	ENGTASKS_SetTaskStateServerEventArgs = [];
};

// Sets task target on a task on all machines.
// Arguments: [taskName, taskTarget, precisePosition (optional), showNotification (optional)]
//   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
//   taskTarget:       Object - A target object. Must exist on all machines in the network.
//   precisePosition:  Boolean - true to always show precise position. false to reflect what player "knows about" target. (Optional. Default = true.)
//   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
ENGTASKS_SetTaskTarget = {
	private ["_taskName", "_taskTarget", "_precisePosition", "_showNotification"];

	_taskName = _this select 0;
	_taskTarget = _this select 1;
	if (count _this > 2) then { _precisePosition = _this select 2; } else { _precisePosition = true; };
	if (count _this > 3) then { _showNotification = _this select 3; } else { _showNotification = true; };

	ENGTASKS_SetTaskTargetServerEventArgs = [_taskName, _taskTarget, _precisePosition, _showNotification];
	
	if (isServer) then {
		ENGTASKS_SetTaskTargetServerEventArgs call ENGTASKS_SetTaskTargetServer;
	}
	else {
		publicVariableServer "ENGTASKS_SetTaskTargetServerEventArgs";
	};
	
	ENGTASKS_SetTaskStateServerEventArgs = [];
};

// Deletes a task on all machines
// Arguments: [taskName, showNotification (optional)]
//   taskName:         String - Task handle of task to be deleted.
//   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
ENGTASKS_DeleteTask = {
	private ["_taskName", "_showNotification"];

	_taskName = _this select 0;
	if (count _this > 1) then { _showNotification = _this select 1; } else { _showNotification = true; };

	ENGTASKS_DeleteTaskServerEventArgs = [_taskName, _showNotification];
	
	if (isServer) then {
		ENGTASKS_DeleteTaskServerEventArgs call ENGTASKS_DeleteTaskServer;
	}
	else {
		publicVariableServer "ENGTASKS_DeleteTaskServerEventArgs";
	};
	
	ENGTASKS_DeleteTaskServerEventArgs = [];
};

// Gets the short description of specified task.
// Arguments: [taskName]
//              taskName: String - Handle that identifies the task.
// Returns: Task description. Empty string ("") if task does not exist.
ENGTASKS_GetTaskDescription = {
	private ["_taskName"];
	private ["_result", "_taskItem", "_taskExists"];
	
	_taskName = _this select 0;
	
	_result = "";
	
	_taskItem = [_taskName] call ENGTASKS_GetTaskListItem;
	_taskExists = !(count _taskItem == 0);

	if (_taskExists) then {
		_result = (_taskItem select 1) select 0; // The description is an array with short and long description. Return the short one.
	};
	
	_result
};

// Gets the full (long and short) description of specified task.
// Arguments: [taskName]
//              taskName: String - Handle that identifies the task.
// Returns: Task description as an array on format [short description, long description]. Empty array ([]) if task does not exist.
ENGTASKS_GetTaskFullDescription = {
	private ["_taskName"];
	private ["_result", "_taskItem", "_taskExists"];
	
	_taskName = _this select 0;
	
	_result = [];
	
	_taskItem = [_taskName] call ENGTASKS_GetTaskListItem;
	_taskExists = !(count _taskItem == 0);

	if (_taskExists) then {
		_result = (_taskItem select 1); // The description is an array with short and long description.
	};
	
	_result
};

// Gets the task state of specified task.
// Arguments: [taskName]
//              taskName: String - Handle that identifies the task.
// Returns: Task state. Empty string ("") if task does not exist.
ENGTASKS_GetTaskState = {
	private ["_taskName"];
	private ["_result", "_taskItem", "_taskExists"];
	
	_taskName = _this select 0;
	
	_result = "";
	
	_taskItem = [_taskName] call ENGTASKS_GetTaskListItem;
	_taskExists = !(count _taskItem == 0);

	if (_taskExists) then {
		_result = _taskItem select 2;
	};
	
	_result
};

// Gets the destination of specified task.
// Arguments: [taskName]
//              taskName: String - Handle that identifies the task.
// Returns: Task destination. Empty array ([]) if task does not exist.
ENGTASKS_GetTaskDestination = {
	private ["_taskName"];
	private ["_result", "_taskItem", "_taskExists", "_taskTargetDestination", "_isDestination"];
	
	_taskName = _this select 0;
	
	_result = [];
	
	_taskItem = [_taskName] call ENGTASKS_GetTaskListItem;
	_taskExists = !(count _taskItem == 0);

	if (_taskExists) then {
		_taskTargetDestination = _taskItem select 3;
		_isDestination = typename (_taskTargetDestination select 0) == "SCALAR";
		
		if (_isDestination) then {
			_result = _taskTargetDestination;
		};
	};
	
	_result
};

// Gets the target object of specified task.
// Arguments: [taskName]
//              taskName: String - Handle that identifies the task.
// Returns:   Task target object. objNull if target object does not exist.
ENGTASKS_GetTaskTarget = {
	private ["_taskName"];
	private ["_result", "_taskItem", "_taskExists", "_taskTargetDestination", "_isDestination"];
	
	_taskName = _this select 0;
	
	_result = objNull;
	
	_taskItem = [_taskName] call ENGTASKS_GetTaskListItem;
	_taskExists = !(count _taskItem == 0);

	if (_taskExists) then {
		_taskTargetDestination = _taskItem select 3;
		_isDestination = typename (_taskTargetDestination select 0) == "SCALAR";

		if (!_isDestination) then {
			_result = _taskTargetDestination select 0;
		};
	};
	
	_result
};
