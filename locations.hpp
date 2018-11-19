class CfgNotifications
{
	class Default
	{
		title = ""; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = ""; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = ""; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {1,1,1,1}; // Icon and text color
		duration = 5; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};


	class LocationDiscovered
	{
		title = "Location Discovered";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa"; 
		description = "You have discovered %1";
		duration = 5; 
		priority = 0;
	};
	
	class ContactEstablished
	{
		title = "Contact Established";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa"; 
		description = "Contact has been established with the local resistance of %1";
		duration = 5; 
		priority = 0;
	};
	
	class info
	{
		title = "%1"; // Tile displayed as text on black background. Filled by arguments.
		iconPicture = "\A3\ui_f\data\map\markers\military\warning_ca.paa"; // Small icon displayed in left part. Colored by "color", filled by arguments.
		iconText = ""; // Short text displayed over the icon. Colored by "color", filled by arguments.
		description = "%2"; // Brief description displayed as structured text. Colored by "color", filled by arguments.
		color[] = {0,0.7,1,1}; // Icon and text color
		duration = 8; // How many seconds will the notification be displayed
		priority = 0; // Priority; higher number = more important; tasks in queue are selected by priority
		difficulty[] = {}; // Required difficulty settings. All listed difficulties has to be enabled
	};

};