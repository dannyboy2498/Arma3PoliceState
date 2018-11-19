class CfgFunctions
{
	class FARM
	{
		tag = "FARM";

		class Config
		{
			file = "scripts\config";
			class cfgSounds {};
			class cfgFaces {};
			class cfgAreas {};
		};
		
		// Dispatcher Added by Geari ------------------------------------------------
		class Dispatcher
		{
			file = "scripts\dispatcher";
			class acceptCall {};
			class addCall {};
			class addSpeech {};
			class generateCall {};
			class getLine {};
			class initDispatch {};
			class removeCall {};
			class requestBackup {};
			class showSpeech {};
			class updatePNC {};
			
		};
		// End of Geari's Additions  ------------------------------------------------
		
		class Documents
		{
			file = "scripts\docs";
			class assignIdentity {};
			class findDOB {};
			class findFaceOfType {};
			class findID {};
			class findIdIssueDates {};
			class findName {};
			class inspectDocuments {};
		};
		
		class EventHandlers
		{
			file = "scripts\eventhandlers";
			class keyPressed {};
			class firedLTL {};
			class handleDamageLTL {};
		};
		
		class Misc
		{
			file = "scripts\misc";
			class dateToString {};
		};
		
		class Network
		{
			file = "scripts\network";
			class setTexture {};
			class say3D {};
			class stopSound {};
			class animUpdate {};
			class animClear {};
			class spawnLight {};
			class addAction {};
			class removeAction {};
			class addEventHandler {};
			class removeEventHandler {};
			class orderInCargo {};
			class orderOutCargo {};
		};
		
		class Player
		{
			file = "scripts\player";
			class holsterWeapons {};
			class unholsterWeapons {};
		};
		
		class Police
		{
			file = "scripts\police";
			class toggleCaptive {};
			class toggleBound {};
			class toggleSiren {};
			class toggleLightbar {};
			class escort {};
			class escortStop {};
			class putInNearestVehicle {};
			class putInVehicle {};
			class takeOutVehicle {};
			class holsterTaser {};
			class unholsterTaser {};
			class setStunned {};
			class applyLTL {};
			class removeLTL {};
		};
		
		class Units
		{
			file = "scripts\units";
			class createUnit {};
			class randomSkill {};
			class spawnBandit {};
			class spawnCivilian {};
		};

	};
};

class CfgRemoteExec
{
	class Functions
	{
		mode = 2;
		jip = 0;
		
		class FARM_fnc_animUpdate {};
		class FARM_fnc_animClear {};
		class FARM_fnc_say3D {};
		class FARM_fnc_stopSound {};
		class FARM_fnc_setTexture {};
		class FARM_fnc_spawnLight {};
		class FARM_fnc_addAction {};
		class FARM_fnc_removeAction {};
		class FARM_fnc_orderInCargo {};
		class FARM_fnc_orderOutCargo {};
		class FARM_fnc_addEventHandler {};
		class FARM_fnc_removeEventHandler {};
		
		// Added by Geari
		class FARM_fnc_addCall {};
		
		class VCOM_fnc_Enable {};
	}
};