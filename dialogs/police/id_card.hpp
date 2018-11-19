class IDcard
{
	idd = FARM_Dialog_IDcard;
	movingEnable = 1;
	onLoad = "if (!isNull (FindDisplay 2000)) exitWith {closeDialog 0};";
	
	class controls
	{
		class id_card: IGUIBack
		{
			idc = 2200;
			x = 0.175;
			y = 0.16;
			w = 0.65;
			h = 0.52;
			colorBackground[] = {0,0.1,0,0.6};
		};
		class id_photo: RscPicture
		{
			idc = 1200;
			text = "images\faces\tanoan_1.jpg";
			x = 0.209975;
			y = 0.2;
			w = 0.126136;
			h = 0.198114;
		};
		class id_close: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.7375;
			y = 0.7;
			w = 0.0875;
			h = 0.04;
			action = "closeDialog 0";
		};
		class RscText_1000: RscText
		{
			idc = 1000;
			text = "Issue:"; //--- ToDo: Localize;
			x = 0.2;
			y = 0.42;
			w = 0.1;
			h = 0.04;
		};
		class id_issue: RscText
		{
			idc = 1001;
			text = "00/00/0000"; //--- ToDo: Localize;
			x = 0.2;
			y = 0.443367;
			w = 0.1125;
			h = 0.06;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class RscText_1002: RscText
		{
			idc = 1002;
			text = "Expiry:"; //--- ToDo: Localize;
			x = 0.2;
			y = 0.5;
			w = 0.1125;
			h = 0.04;
		};
		class id_expiry: RscText
		{
			idc = 1003;
			text = "00/00/0000"; //--- ToDo: Localize;
			x = 0.201263;
			y = 0.52505;
			w = 0.1125;
			h = 0.06;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class id_authority: RscText
		{
			idc = 1004;
			text = "TPG"; //--- ToDo: Localize;
			x = 0.375;
			y = 0.6;
			w = 0.0625;
			h = 0.06;
			colorText[] = {1,0,1,1};
		};
		class RscText_1005: RscText
		{
			idc = 1005;
			text = ">>>>>"; //--- ToDo: Localize;
			x = 0.5375;
			y = 0.6;
			w = 0.075;
			h = 0.06;
		};
		class id_idnum: RscText
		{
			idc = 1006;
			text = "TP00-AZIK-I000-0A00"; //--- ToDo: Localize;
			x = 0.6;
			y = 0.6;
			w = 0.2;
			h = 0.06;
		};
		class RscText_1007: RscText
		{
			idc = 1007;
			text = "TANOAN NATIONAL ID CARD"; //--- ToDo: Localize;
			x = 0.35;
			y = 0.18;
			w = 0.2625;
			h = 0.06;
		};
		class id_forename: RscText
		{
			idc = 1008;
			text = "Aatami"; //--- ToDo: Localize;
			x = 0.4625;
			y = 0.28;
			w = 0.225;
			h = 0.06;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class id_surname: RscText
		{
			idc = 1010;
			text = "Azikiwe"; //--- ToDo: Localize;
			x = 0.4625;
			y = 0.24;
			w = 0.225;
			h = 0.06;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class RscText_1011: RscText
		{
			idc = 1011;
			text = "DOB:"; //--- ToDo: Localize;
			x = 0.35;
			y = 0.4;
			w = 0.15;
			h = 0.06;
		};
		class id_dob: RscText
		{
			idc = 1012;
			text = "00/00/0000"; //--- ToDo: Localize;
			x = 0.4625;
			y = 0.4;
			w = 0.1125;
			h = 0.06;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class RscText_1013: RscText
		{
			idc = 1013;
			text = "Nationality:"; //--- ToDo: Localize;
			x = 0.35;
			y = 0.34;
			w = 0.15;
			h = 0.06;
		};
		class id_nationality: RscText
		{
			idc = 1014;
			text = "Tanoan"; //--- ToDo: Localize;
			x = 0.4625;
			y = 0.34;
			w = 0.225;
			h = 0.06;
			colorText[] = {0.7,0.7,0.7,1};
		};
		class RscText_1015: RscText
		{
			idc = 1015;
			text = "ISSUING AUTHORITY:"; //--- ToDo: Localize;
			x = 0.1875;
			y = 0.6;
			w = 0.2;
			h = 0.06;
			colorText[] = {1,1,0,1};
		};
		class RscText_1009: RscText
		{
			idc = 1009;
			text = "Name:"; //--- ToDo: Localize;
			x = 0.35;
			y = 0.24;
			w = 0.15;
			h = 0.06;
		};
		class id_flag: RscPicture
		{
			idc = 1201;
			text = "images\tanoa_flag.jpg";
			x = 0.675;
			y = 0.36;
			w = 0.121465;
			h = 0.0949494;
		};
	};
};