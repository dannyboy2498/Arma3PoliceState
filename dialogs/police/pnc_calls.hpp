class PncCalls
{
	idd = 2200;
	movingEnable = 0;
	onLoad = "if (!isNull (FindDisplay 2200)) then {closeDialog 2} else {[] spawn FARM_fnc_updatePNC};";

	class controls
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.0875;
			y = 0.18;
			w = 0.3375;
			h = 0.56;
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;
			x = 0.0875;
			y = 0.14;
			w = 0.3375;
			h = 0.04;
			colorBackground[] = {0,0,1,1};
		};
		class IGUIBack_2203: IGUIBack
		{
			idc = 2203;
			x = 0.4375;
			y = 0.18;
			w = 0.3125;
			h = 0.38;
		};
		class pnc_list: RscListbox
		{
			idc = 1500;
			x = 0.1;
			y = 0.2;
			w = 0.3125;
			h = 0.52;
		};
		class pnc_close: RscButton
		{
			idc = 1601;
			text = "Close";
			x = 0.0875;
			y = 0.792;
			w = 0.3375;
			h = 0.04;
			action = "closeDialog 2;";
		};
		class pnc_accept: RscButton
		{
			idc = 1600;
			text = "Accept Call"; //--- ToDo: Localize;
			x = 0.0875;
			y = 0.748;
			w = 0.3375;
			h = 0.04;
			action = "call FARM_fnc_acceptCall;";
		};

		class pnc_description: RscText
		{
			idc = 1000;
			text = ""; //--- ToDo: Localize;
			x = 0.45;
			y = 0.2;
			w = 0.2875;
			h = 0.34;
		};
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;
			x = 0.4375;
			y = 0.14;
			w = 0.3125;
			h = 0.04;
			colorBackground[] = {0,0,1,1};
		};
	};
};