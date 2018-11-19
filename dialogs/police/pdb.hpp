class pdb
{
	idd = -1;
	movingEnable = 0;

	class controls
	{

		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.05;
			y = 0.18;
			w = 0.5625;
			h = 0.58;
		};
		class IGUIBack_2201: IGUIBack
		{
			idc = 2201;
			x = 0.05;
			y = 0.14;
			w = 0.5625;
			h = 0.04;
			colorBackground[] = {0,0,1,1};
		};
		class IGUIBack_2202: IGUIBack
		{
			idc = 2202;
			x = 0.6375;
			y = 0.14;
			w = 0.325;
			h = 0.04;
			colorBackground[] = {0,0,1,1};
		};
		class IGUIBack_2203: IGUIBack
		{
			idc = 2203;
			x = 0.6375;
			y = 0.18;
			w = 0.325;
			h = 0.58;
		};
		class pdb_export: RscButton
		{
			idc = 1600;
			text = "Export Force Data"; //--- ToDo: Localize;
			x = 0.05;
			y = 0.78;
			w = 0.225;
			h = 0.04;
		};
		class pdb_import: RscButton
		{
			idc = 1601;
			text = "Import Force Data"; //--- ToDo: Localize;
			x = 0.2875;
			y = 0.78;
			w = 0.225;
			h = 0.04;
		};
		class pdb_results: RscListbox
		{
			idc = 1500;
			x = 0.65;
			y = 0.26;
			w = 0.3;
			h = 0.44;
		};
		class pdb_view: RscButton
		{
			idc = 1602;
			text = "View File"; //--- ToDo: Localize;
			x = 0.65;
			y = 0.7;
			w = 0.3;
			h = 0.04;
		};
		class pdb_search: RscEdit
		{
			idc = 1400;
			x = 0.65;
			y = 0.2;
			w = 0.25;
			h = 0.04;
		};
		class pdb_btnsearch: RscButton
		{
			idc = 1603;
			text = "Go"; //--- ToDo: Localize;
			x = 0.9;
			y = 0.2;
			w = 0.05;
			h = 0.04;
		};
		class RscFrame_1800: RscFrame
		{
			idc = 1800;
			text = "Information"; //--- ToDo: Localize;
			x = 0.0625;
			y = 0.2;
			w = 0.4;
			h = 0.22;
		};
		class RscPicture_1200: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.475;
			y = 0.2;
			w = 0.125;
			h = 0.22;
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Forename:"; //--- ToDo: Localize;
			x = 0.075;
			y = 0.22;
			w = 0.1125;
			h = 0.04;
		};
		class RscText_1001: RscText
		{
			idc = 1001;
			text = "Surname:"; //--- ToDo: Localize;
			x = 0.075;
			y = 0.26;
			w = 0.1125;
			h = 0.04;
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "DOB:"; //--- ToDo: Localize;
			x = 0.075;
			y = 0.3;
			w = 0.1125;
			h = 0.04;
		};
		class pdb_fname: RscText
		{
			idc = 1003;
			text = "default"; //--- ToDo: Localize;
			x = 0.1875;
			y = 0.22;
			w = 0.2625;
			h = 0.04;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class pdb_lname: RscText
		{
			idc = 1004;
			text = "default"; //--- ToDo: Localize;
			x = 0.1875;
			y = 0.26;
			w = 0.2625;
			h = 0.04;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class pdb_dob: RscText
		{
			idc = 1005;
			text = "0/0/0000"; //--- ToDo: Localize;
			x = 0.1875;
			y = 0.3;
			w = 0.2625;
			h = 0.04;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class RscFrame_1801: RscFrame
		{
			idc = 1801;
			text = "Previous Offences"; //--- ToDo: Localize;
			x = 0.0625;
			y = 0.44;
			w = 0.2875;
			h = 0.3;
		};
		class RscFrame_1802: RscFrame
		{
			idc = 1802;
			text = "Notes"; //--- ToDo: Localize;
			x = 0.3625;
			y = 0.44;
			w = 0.2375;
			h = 0.3;
		};
		class pdb_notes: RscEdit
		{
			idc = 1401;
			text = "default"; //--- ToDo: Localize;
			x = 0.3625;
			y = 0.46;
			w = 0.2375;
			h = 0.28;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class pdb_previous: RscListbox
		{
			idc = 1501;
			x = 0.075;
			y = 0.46;
			w = 0.275;
			h = 0.28;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class pdb_idnum: RscText
		{
			idc = 1006;
			text = "000-000-000"; //--- ToDo: Localize;
			x = 0.1875;
			y = 0.34;
			w = 0.2625;
			h = 0.04;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class RscText_1007: RscText
		{
			idc = 1007;
			text = "ID Number:"; //--- ToDo: Localize;
			x = 0.075;
			y = 0.34;
			w = 0.1125;
			h = 0.04;
		};
	};
};
