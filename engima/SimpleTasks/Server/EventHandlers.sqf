/* Remote function call event handlers server*/

"ENGTASKS_CreateTaskServerEventArgs" addPublicVariableEventHandler {
	ENGTASKS_CreateTaskServerEventArgs call ENGTASKS_CreateTaskServer;
	ENGTASKS_CreateTaskServerEventArgs = [];
};

"ENGTASKS_SetTaskStateServerEventArgs" addPublicVariableEventHandler {
	ENGTASKS_SetTaskStateServerEventArgs call ENGTASKS_SetTaskStateServer;
	ENGTASKS_SetTaskStateServerEventArgs = [];
};

"ENGTASKS_SetTaskDescriptionServerEventArgs" addPublicVariableEventHandler {
	ENGTASKS_SetTaskDescriptionServerEventArgs call ENGTASKS_SetTaskDescriptionServer;
	ENGTASKS_SetTaskDescriptionServerEventArgs = [];
};

"ENGTASKS_SetTaskDestinationServerEventArgs" addPublicVariableEventHandler {
	ENGTASKS_SetTaskDestinationServerEventArgs call ENGTASKS_SetTaskDestinationServer;
	ENGTASKS_SetTaskDestinationServerEventArgs = [];
};

"ENGTASKS_SetTaskTargetServerEventArgs" addPublicVariableEventHandler {
	ENGTASKS_SetTaskTargetServerEventArgs call ENGTASKS_SetTaskTargetServer;
	ENGTASKS_SetTaskTargetServerEventArgs = [];
};

"ENGTASKS_DeleteTaskServerEventArgs" addPublicVariableEventHandler {
	ENGTASKS_DeleteTaskServerEventArgs call ENGTASKS_DeleteTaskServer;
	ENGTASKS_DeleteTaskServerEventArgs = [];
};
