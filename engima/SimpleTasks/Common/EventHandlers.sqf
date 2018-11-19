/* Remote function call event handlers client */

"ENGTASKS_CreateTaskEventArgs" addPublicVariableEventHandler {
	ENGTASKS_CreateTaskEventArgs call ENGTASKS_CreateTaskLocal;
	ENGTASKS_CreateTaskEventArgs = [];
};

"ENGTASKS_SetTaskStateEventArgs" addPublicVariableEventHandler {
	ENGTASKS_SetTaskStateEventArgs call ENGTASKS_SetTaskStateLocal;
	ENGTASKS_SetTaskStateEventArgs = [];
};

"ENGTASKS_SetTaskDescriptionEventArgs" addPublicVariableEventHandler {
	ENGTASKS_SetTaskDescriptionEventArgs call ENGTASKS_SetTaskDescriptionLocal;
	ENGTASKS_SetTaskDescriptionEventArgs = [];
};

"ENGTASKS_SetTaskDestinationEventArgs" addPublicVariableEventHandler {
	ENGTASKS_SetTaskDestinationEventArgs call ENGTASKS_SetTaskDestinationLocal;
	ENGTASKS_SetTaskDestinationEventArgs = [];
};

"ENGTASKS_SetTaskTargetEventArgs" addPublicVariableEventHandler {
	ENGTASKS_SetTaskTargetEventArgs call ENGTASKS_SetTaskTargetLocal;
	ENGTASKS_SetTaskTargetEventArgs = [];
};

"ENGTASKS_DeleteTaskEventArgs" addPublicVariableEventHandler {
	ENGTASKS_DeleteTaskEventArgs call ENGTASKS_DeleteTaskLocal;
	ENGTASKS_DeleteTaskEventArgs = [];
};

/* Other event handlers */

onTeamSwitch {
	// Remove all tasks for the target unit
	{
		_to removeSimpleTask _x;
	} foreach simpleTasks _to;
	
	// Add all tasks again
	ENGTASKS_TasksLocallyCreated = false;
	call ENGTASKS_CreateTasksFromTaskList;
};
