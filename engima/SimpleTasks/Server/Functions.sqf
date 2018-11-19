ENGTASKS_setAssignedAsCreated = {
	private ["_exceptTaskName"];
	
	_exceptTaskName = _this select 0;
	
	// Find all other CREATED or ASSIGNED tasks and set their task state to CREATED.
	{
		private ["_name", "_state"];
		
			_name = _x select 0;
			_state = _x select 2;

			if (_state == "ASSIGNED" && _name != _exceptTaskName) then {
				_x set [2, "CREATED"];			
			};
	} foreach ENGTASKS_TaskList;
};

// Adds a task to server list and distributes the new task to to all clients.
// Arguments:
//   [taskName, taskDescription, taskState]
ENGTASKS_CreateTaskServer = {
	private ["_taskName", "_taskState"];
	private ["_alreadyExistingTask", "_taskAlreadyExists"];

	_taskName = _this select 0;
	_taskState = _this select 2;

	_alreadyExistingTask = [_taskName] call ENGTASKS_GetTaskListItem;
	_taskAlreadyExists = !(count _alreadyExistingTask == 0);

	// Only create the task if it does not already exist
	if (!_taskAlreadyExists) then {
		// If task list does not exist (for wahtever reason - user might have deleted it), create it.
		if (isNil "ENGTASKS_TaskList") then {
			ENGTASKS_TaskList = [];
		};
		
		// Find all other ASSIGNED tasks and set their task state to CREATED.
		if (_taskState == "ASSIGNED") then {
			[_taskName] call ENGTASKS_setAssignedAsCreated;
		};
		
		// Add task to the task list and distribute it to all machines.
		ENGTASKS_TaskList set [count ENGTASKS_TaskList, +_this];
		publicVariable "ENGTASKS_TaskList";
	
		// Tell all machines to create the task locally.
		ENGTASKS_CreateTaskEventArgs = +_this;
		publicVariable "ENGTASKS_CreateTaskEventArgs";
		
		// If a player is on this machine, create task on it to.
		if (!isDedicated) then {
			ENGTASKS_CreateTaskEventArgs call ENGTASKS_CreateTaskLocal;
			ENGTASKS_CreateTaskEventArgs = [];
		};
	};
};

// Sets task state in the serverlist and distributes the change to alla machines in the network.
// Arguments:
//   [taskName, taskState]
ENGTASKS_SetTaskStateServer = {
	private ["_taskName", "_taskState"];
	private ["_existingTask", "_taskExists", "_existingTaskState"];

	_taskName = _this select 0;
	_taskState = _this select 1;

	_existingTask = [_taskName] call ENGTASKS_GetTaskListItem;
	_taskExists = (count _existingTask > 0);

	// Only set task state if the task exists
	if (_taskExists) then {

		_existingTaskState = _existingTask select 2;
		
		// Only set task state if it's set to a new state
		if (_existingTaskState != _taskState) then {
		
			// Find all other ASSIGNED tasks and set their task state to CREATED.
			if (_taskState == "ASSIGNED") then {
				[_taskName] call ENGTASKS_setAssignedAsCreated;
			};
			
			// Update task list and publish it on the network
			_existingTask set [2, _taskState];
			publicVariable "ENGTASKS_TaskList";
	
			// Tell all machines to update task locally.
			ENGTASKS_SetTaskStateEventArgs = +_this;
			publicVariable "ENGTASKS_SetTaskStateEventArgs";
			
			// If a player is on this machine, create task on it to.
			if (!isDedicated) then {
				ENGTASKS_SetTaskStateEventArgs call ENGTASKS_SetTaskStateLocal;
				ENGTASKS_SetTaskStateEventArgs = [];
			};
		};
	};
};

// Sets task description in the serverlist and distributes the change to alla machines in the network.
// Arguments:
//   [taskName, taskDescription]
ENGTASKS_SetTaskDescriptionServer = {
	private ["_taskName", "_taskDescription"];
	private ["_existingTask", "_taskExists", "_existingTaskDescription"];

	_taskName = _this select 0;
	_taskDescription = _this select 1;

	_existingTask = [_taskName] call ENGTASKS_GetTaskListItem;
	_taskExists = (count _existingTask > 0);
	
	// Only set task state if the task exists
	if (_taskExists) then {

		_existingTaskDescription = _existingTask select 1;
		
		// Only set task description if it's set to a new description
		if (!([_existingTaskDescription, _taskDescription] call BIS_fnc_areEqual)) then {
		
			// Update task list and publish it on the network
			_existingTask set [1, _taskDescription];
			publicVariable "ENGTASKS_TaskList";
	
			// Tell all machines to update task locally.
			ENGTASKS_SetTaskDescriptionEventArgs = +_this;
			publicVariable "ENGTASKS_SetTaskDescriptionEventArgs";
			
			// If a player is on this machine, create task on it to.
			if (!isDedicated) then {
				ENGTASKS_SetTaskDescriptionEventArgs call ENGTASKS_SetTaskDescriptionLocal;
				ENGTASKS_SetTaskDescriptionEventArgs = [];
			};
		};
	};
};

// Sets task destination in the serverlist and distributes the change to alla machines in the network.
// Arguments:
//   [taskName, taskDestination]
ENGTASKS_SetTaskDestinationServer = {
	private ["_taskName", "_taskDestination"];
	private ["_existingTask", "_taskExists", "_existingTaskDestination"];

	_taskName = _this select 0;
	_taskDestination = _this select 1;

	_existingTask = [_taskName] call ENGTASKS_GetTaskListItem;
	_taskExists = (count _existingTask > 0);

	// Only set task state if the task exists
	if (_taskExists) then {

		_existingTaskDestination = _existingTask select 3;
		
		// Only set task state if it's set to a new state
		if (!([_taskDestination, _existingTaskDestination] call BIS_fnc_areEqual)) then {

			// Update task list and publish it on the network
			_existingTask set [3, _taskDestination];
			publicVariable "ENGTASKS_TaskList";
	
			// Tell all machines to update task locally.
			ENGTASKS_SetTaskDestinationEventArgs = +_this;
			publicVariable "ENGTASKS_SetTaskDestinationEventArgs";
			
			// If a player is on this machine, create task on it to.
			if (!isDedicated) then {
				ENGTASKS_SetTaskDestinationEventArgs call ENGTASKS_SetTaskDestinationLocal;
				ENGTASKS_SetTaskDestinationEventArgs = [];
			};
		};
	};
};

// Sets task target in the serverlist and distributes the change to alla machines in the network.
// Arguments:
//   [taskName, taskTarget, precisePosition]
ENGTASKS_SetTaskTargetServer = {
	private ["_taskName", "_taskTarget", "_precisePosition"];
	private ["_existingTask", "_taskExists", "_existingTaskTargetItem"];

	_taskName = _this select 0;
	_taskTarget = _this select 1;
	_precisePosition = _this select 2;

	_existingTask = [_taskName] call ENGTASKS_GetTaskListItem;
	_taskExists = (count _existingTask > 0);

	// Only set task state if the task exists
	if (_taskExists) then {

		_existingTaskTargetItem = _existingTask select 3;
		
		// Only set task state if it's set to a new state
		if (!([[_taskTarget, _precisePosition], _existingTaskTargetItem] call BIS_fnc_areEqual)) then {

			// Update task list and publish it on the network
			_existingTask set [3, [_taskTarget, _precisePosition]];
			publicVariable "ENGTASKS_TaskList";
	
			// Tell all machines to update task locally.
			ENGTASKS_SetTaskTargetEventArgs = +_this;
			publicVariable "ENGTASKS_SetTaskTargetEventArgs";
			
			// If a player is on this machine, create task on it to.
			if (!isDedicated) then {
				ENGTASKS_SetTaskTargetEventArgs call ENGTASKS_SetTaskTargetLocal;
				ENGTASKS_SetTaskTargetEventArgs = [];
			};
		};
	};
};

// Deletes a task from the serverlist and distributes the change to alla machines in the network.
// Arguments:
//   [Task name]
ENGTASKS_DeleteTaskServer = {
	private ["_taskName"];
	private ["_existingTask", "_taskExists", "_taskList", "_index"];

	_taskName = _this select 0;

	_existingTask = [_taskName] call ENGTASKS_GetTaskListItem;
	_taskExists = (count _existingTask > 0);
	_index = 0;

	// Only set task state if the task exists
	if (_taskExists) then {
		_taskList = [];

		// Update task list and publish it on the network
		{
			private ["_name"];
			
			_name = _x select 0;
			
			if (_name != _taskName) then {
				_taskList set [_index, +_x];
				_index = _index + 1;
			};
		} foreach ENGTASKS_TaskList;

		// Distribute task list to the network
		ENGTASKS_TaskList = _taskList;
		publicVariable "ENGTASKS_TaskList";
		
		// Tell all machines to update task locally.
		ENGTASKS_DeleteTaskEventArgs = +_this;
		publicVariable "ENGTASKS_DeleteTaskEventArgs";
		
		// If a player is on this machine, create task on it to.
		if (!isDedicated) then {
			ENGTASKS_DeleteTaskEventArgs call ENGTASKS_DeleteTaskLocal;
			ENGTASKS_DeleteTaskEventArgs = [];
		};
	};
};
