class Speech
{
	idd = -1;
	movingEnable = 0;
	onLoad = "ctrlSetText[1100, 'fuck'];";

	class controls
	{
		class IGUIBack_2200: IGUIBack
		{
			idc = 2200;
			x = 0.275;
			y = 0.46;
			w = 0.5;
			h = 0.26;
		};
		class RscText_1100: RscText
		{
			idc = 1100;
			text = "Loading..";
			x = 0.2875;
			y = 0.48;
			w = 0.475;
			h = 0.22;
		};
		class RscButton_1600: RscButton
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.5375;
			y = 0.732;
			w = 0.2375;
			h = 0.04;
			action = "closeDialog 2;";
		};
	};
};
