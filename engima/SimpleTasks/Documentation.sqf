/*
 * ***** DOCUMENTATION FOR ENGIMA'S SIMPLE TASKS VER 1.17 *****
 *
 * *** MISSION TASKS INITIALIZATION ***
 *
 * The file MissionTasks.sqf in the mission's root folder contains the initial tasks to be present when mission 
 * starts. A mission task initialization is an array with task properties and might look like this:
 *
 * ENGTASKS_TaskList = [
 *     ["GetATLauncher", "Get the anti tank launcher.", "ASSIGNED"],
 *     ["MoveToRoad", "Move to road.", "CREATED", getMarkerPos "road_marker"],
 *     ["KillEnemyTank", ["Kill enemy tank.", "The tank to kill carries a red flag."], "CREATED", [enemy_tank, false]]
 * ];
 *
 * An item in this "task list" has the following format:
 *   [taskName, description, state (optional), target/destination (optional)]
 *
 *   taskName:           String - A handle for the task. Must be formatted as a variable (letters and digits 
 *                       only, and no spaces).
 *   description:        String or Array - Task description shown to player. If you send in a string, the 
 *                       task's long and short description is set to the string value sent in. Alternatively 
 *                       you can send in an array on format ["short description", "long description"].
 *   state:              String - Initial task state, one of the following: "CREATED" (default), "ASSIGNED", 
 *                       "SUCCEEDED", "FAILED", "CANCELED". Task state is optional, and if left out it will be 
 *                       "CREATED". Only one task can be "ASSIGNED".
 *   destination/target: Array - Specifying a static position, or specifying a target and a target option. If 
 *                       you send in a static position, the array format needs to be [x, y, z] (or just [x, y]).
 *                       If you send in a target, the array needs to be on format [target, precisePosition].
 *                         target:          Object - The object associated with the task.
 *                         precisePosition: Boolean - use exact position of the target for map marker / HUD 
 *                                          indicator instead of the position known to the owner of the task 
 *                                          (depending on the knowledge about the target).
 *
 * The above example will result in three tasks. The task GetATLauncher will be in state ASSIGNED. The task
 * MoveToRoad will have status created and a position marked on the map. The task KillEnemyTank will have
 * state CREATED, and map and HUD will point out the target. However, precisePosition is false, so the
 * target will only be pointed out if player unit "knows about" it.
 *
 *
 * * TASK STATE "ASSIGNED" (new in version 1.15) *
 *
 * Only one task in the task list can have status ASSIGNED. As soon as a second task is set to ASSIGNED, the 
 * task that had ASSIGNED earlier will get status CREATED. When a task is set to ASSIGNED it is also automatically 
 * selected as the "current task". E.g. its behavior will be like if a user clicks "Set as current task".
 *
 *
 * *** FUNCTIONS ***
 *
 * Functions are used to manipulate task list and task states during mission progress. The following functions may be 
 * called at any time from any context.
 *
 * ENGTASKS_CreateTask
 * Description:        Creates a task on all machines.
 * Arguments:          [taskName, description, state (optional), showNotification (optional)]
 *   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
 *   description:      String - Description displayed to player.
 *   state:            String - Task state. (Optional. Default = "CREATED".)
 *   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
 * Example:            ["GetATLauncher", "Get the anti tank launcher."] call ENGTASKS_CreateTask;
 *
 * ENGTASKS_SetTaskState
 * Description:        Sets task state on a task on all machines.
 * Arguments:          [taskName, state, showNotification (optional)]
 *   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
 *   state:            String - Task state to be set.
 *   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
 * Example 1:          ["GetATLauncher", "SUCCEEDED"] call ENGTASKS_SetTaskState;
 * Example 2:          ["GetATLauncher", "CANCELED", false] call ENGTASKS_SetTaskState;
 *
 * ENGTASKS_SetTaskDescription
 * Description:        Sets task description on a task on all machines.
 * Arguments:          [taskName, description, showNotification (optional)]
 *   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
 *   description:      String or Array - Description displayed to the player. If you send in a string, the 
 *                     task's long and short description is set to the string value sent in. Alternatively you can 
 *                     send in an array on format ["short description", "long description"].
 *   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
 * Example #1:         ["GetATLauncher", "Get AT launcher."] call ENGTASKS_SetTaskDescription;
 * Example #2:         ["GetATLauncher", ["Get AT launcher.", "Pick the red one"], false] call ENGTASKS_SetTaskDescription;
 *
 * ENGTASKS_SetTaskDestination
 * Sets task destination on a task on all machines.
 * Arguments: [taskName, taskDestination, showNotification (optional)]
 *   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
 *   taskDestination:  Array - A position on form [x, y, z] defining a map position.
 *   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
 * Example #1:         ["GetATLauncher", getPos ammoBox] call ENGTASKS_SetTaskDestination;
 * Example #2:         ["GetATLauncher", getPos ammoBox, false] call ENGTASKS_SetTaskDestination;
 *
 * ENGTASKS_SetTaskTarget
 * Sets task target on a task on all machines.
 * Arguments: [taskName, taskTarget, precisePosition (optional), showNotification (optional)]
 *   taskName:         String - Task handle. Must be formatted as a variable (letters and digits, and no spaces).
 *   taskTarget:       Object - A target object. Must exist on all machines in the network.
 *   precisePosition:  Boolean - true to always show precise position. false to reflect what player "knows about" target. (Optional. Default = true.)
 *   showNotification: Boolean - true to show notification to player. Otherwise false. (Optional. Default = true.)
 * Example #1:         ["KillTheBoss", boss] call ENGTASKS_SetTaskTarget;
 * Example #2:         ["KillTheBoss", boss, true, false] call ENGTASKS_SetTaskTarget;
 *
 * ENGTASKS_DeleteTask
 * Description: Deletes a task for all players in the singleplayer or multiplayer game.
 * Arguments:   Task name:  String - A handle for the task. Must be formatted as a variable (letters and digits 
 *                          only, and no spaces).
 * Example: ["GetATLauncher"] call ENGTASKS_DeleteTask;
 *
 * ENGTASKS_GetTaskDescription
 * Description: Gets the description of specified task.
 * Arguments:   [taskName]
 *                taskName: String - Handle that identifies the task.
 * Returns:     Task description. Empty string ("") if task does not exist.
 * Example:     _description = ["KillTheBoss"] call ENGTASKS_GetTaskDescription;
 *
 * ENGTASKS_GetTaskFullDescription
 * Description: Gets the full (long and short) description of specified task.
 * Arguments:   [taskName]
 *                taskName: String - Handle that identifies the task.
 * Returns:     Task description as an array on format [short description, long description]. Empty array ([]) if task does not exist.
 * Example:     _fullDescriptionArray = ["KillTheBoss"] call ENGTASKS_GetTaskFullDescription;
 *
 * ENGTASKS_GetTaskState
 * Description: Gets the task state of specified task.
 * Arguments:   [taskName]
 *                taskName: String - Handle that identifies the task.
 * Returns:     Task state. Empty string ("") if task does not exist.
 * Example:     _state = ["KillTheBoss"] call ENGTASKS_GetTaskState;
 *
 * ENGTASKS_GetTaskDestination
 * Description: Gets the destination of specified task.
 * Arguments:   [taskName]
 *                taskName: String - Handle that identifies the task.
 * Returns:     Task destination as an array position. Empty array ([]) if task does not exist.
 * Example:     _pos = ["KillTheBoss"] call ENGTASKS_GetTaskDestination;
 *
 * ENGTASKS_GetTaskTarget
 * Gets the target object of specified task.
 * Arguments: [taskName]
 *              taskName: String - Handle that identifies the task.
 * Returns:   Task target object. objNull if target object does not exist.
 * Example:   _boss = ["KillTheBoss"] call ENGTASKS_GetTaskTarget;
 *
 */