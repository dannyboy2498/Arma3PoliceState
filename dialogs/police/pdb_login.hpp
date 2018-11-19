class pdb_login
{
	idd = -1;
	movingEnable = 0;

	class controls
	{

		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.25;
			y = 0.2;
			w = 0.5625;
			h = 0.58;
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;
			x = 0.25;
			y = 0.16;
			w = 0.5625;
			h = 0.04;
			colorBackground[] = {0,0,1,1};
		};
		class RscEdit_1400: RscEdit
		{
			idc = 1400;
			text = "login_username"; //--- ToDo: Localize;
			x = 0.4;
			y = 0.4;
			w = 0.25;
			h = 0.04;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Username:"; //--- ToDo: Localize;
			x = 0.3875;
			y = 0.34;
			w = 0.15;
			h = 0.06;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Password:"; //--- ToDo: Localize;
			x = 0.3875;
			y = 0.44;
			w = 0.1;
			h = 0.1;
		};
		class RscEdit_1401: RscEdit
		{
			idc = 1401;
			x = 0.4;
			y = 0.52;
			w = 0.25;
			h = 0.04;
		};
		class login_submit: RscButton
		{
			idc = 1600;
			text = "Login >>"; //--- ToDo: Localize;
			x = 0.4;
			y = 0.6;
			w = 0.25;
			h = 0.06;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "WARNING: Only access PDB from a secure terminal!"; //--- ToDo: Localize;
			x = 0.3125;
			y = 0.24;
			w = 0.4625;
			h = 0.06;
		};
	};
};