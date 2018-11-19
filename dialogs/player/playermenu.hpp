class PlayerMenu
{
	idd = -1;
	movingEnabled = 0;
	
	class controlsBackground
	{ 
		class Menu_background: RscText
		{
			idc = -1;
			x = 0.0625;
			y = 0.15;
			w = 0.875;
			h = 0.65;
			colorBackground[] = {1,1,1,0.5};
		};
		class Background_frame: RscFrame
		{
			idc = -1;
			x = 0.0625;
			y = 0.15;
			w = 0.875;
			h = 0.65;
			colorText[] = {0,0,0,1};
		};
		class Menu_title_back: RscText
		{
			idc = -1;
			x = 0.0625;
			y = 0.15;
			w = 0.875;
			h = 0.05;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class Menu_title: RscText
		{
			idc = 1000;
			text = "Player Menu";
			x = 0.078125;
			y = 0.151431;
			w = 0.21875;
			h = 0.05;
			colorText[] = {1,1,1,1};
		};
		class Player_weight: RscText
		{
			idc = 1002;
			text = "Weight:";
			x = 0.703125;
			y = 0.15;
			w = 0.09375;
			h = 0.05;
			colorText[] = {1,1,1,1};
		};
		class Stats_back: RscText
		{
			idc = -1;
			x = 0.078125;
			y = 0.225;
			w = 0.265625;
			h = 0.2;
			colorBackground[] = {0.2,0.2,0.2,0.9};
		};
		class Stats_title_back: RscText
		{
			idc = 1017;
			x = 0.078125;
			y = 0.225;
			w = 0.265625;
			h = 0.05;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
		class Stats_title: RscText
		{
			idc = 1018;
			text = "Stats";
			x = 0.09375;
			y = 0.225;
			w = 0.109375;
			h = 0.05;
			colorText[] = {1,1,1,1};
		};
		class Finance_back: RscText
		{
			idc = -1;
			x = 0.078125;
			y = 0.475;
			w = 0.265625;
			h = 0.3;
			colorBackground[] = {0.2,0.2,0.2,0.9};
		};
		class Finance_title_back: RscText
		{
			idc = -1;
			x = 0.078125;
			y = 0.45;
			w = 0.265625;
			h = 0.05;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
		class Finance_title: RscText
		{
			idc = 1008;
			text = "Finance";
			x = 0.09375;
			y = 0.45;
			w = 0.109375;
			h = 0.05;
			colorText[] = {1,1,1,1};
		};
		class Finance_bankmoney: RscText
		{
			idc = 1011;
			text = "Bank:";
			x = 0.09375;
			y = 0.55;
			w = 0.09375;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
		};
		class Finance_money: RscText
		{
			idc = 1012;
			text = "Money:";
			x = 0.09375;
			y = 0.5;
			w = 0.125;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
		};
		class Finance_button_drop: RscButton
		{
			idc = 1601;
			text = "Drop";
			x = 0.265625;
			y = 0.625;
			w = 0.0625;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
			colorBackground[] = {0.1,0.1,0.1,1};
			colorBackgroundActive[] = {0.6,0.6,0.6,1};
			colorFocused[] = {0.6,0.6,0.6,1};
		};
		class Finance_button_give: RscButton
		{
			idc = 1600;
			text = "Give";
			x = 0.265625;
			y = 0.7;
			w = 0.0625;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
			colorBackground[] = {0.1,0.1,0.1,1};
			colorBackgroundActive[] = {0.6,0.6,0.6,1};
			colorFocused[] = {0.6,0.6,0.6,1};
		};
		class Inventory_back: RscText
		{
			idc = -1;
			x = 0.375;
			y = 0.225;
			w = 0.53125;
			h = 0.55;
			colorBackground[] = {0.2,0.2,0.2,0.9};
		};
		class Inventory_title_back: RscText
		{
			idc = -1;
			x = 0.375;
			y = 0.225;
			w = 0.53125;
			h = 0.05;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
		class Inventory_title: RscText
		{
			idc = 1009;
			text = "Inventory";
			x = 0.390625;
			y = 0.225;
			w = 0.140625;
			h = 0.05;
			colorText[] = {1,1,1,1};
		};
		class Inventory_frame: RscFrame
		{
			idc = -1;
			x = 0.390625;
			y = 0.3;
			w = 0.5;
			h = 0.306734;
			colorText[] = {0.9,0.9,0.9,1};
		};
		class Inventory_button_use: RscButton
		{
			idc = 1602;
			text = "Use";
			x = 0.390625;
			y = 0.7;
			w = 0.09375;
			h = 0.05;
			action = "if (lbCurSel 1500 != -1) then {execVM 'useitem.sqf'};";
			colorText[] = {0.9,0.9,0.9,1};
			colorBackground[] = {0.1,0.1,0.1,1};
			colorBackgroundActive[] = {0.6,0.6,0.6,1};
			colorFocused[] = {0.6,0.6,0.6,1};
		};
		class Inventory_button_destroy: RscButton
		{
			idc = 1603;
			text = "Destroy";
			x = 0.578125;
			y = 0.7;
			w = 0.09375;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
			colorBackground[] = {0.1,0.1,0.1,1};
			colorBackgroundActive[] = {0.6,0.6,0.6,1};
			colorFocused[] = {0.6,0.6,0.6,1};
		};
		class Inventory_button_drop: RscButton
		{
			idc = 1604;
			text = "Drop";
			x = 0.6875;
			y = 0.7;
			w = 0.09375;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
			colorBackground[] = {0.1,0.1,0.1,1};
			colorBackgroundActive[] = {0.6,0.6,0.6,1};
			colorFocused[] = {0.6,0.6,0.6,1};
		};
		class Inventory_button_give: RscButton
		{
			idc = 1605;
			text = "Give";
			x = 0.796875;
			y = 0.7;
			w = 0.09375;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
			colorBackground[] = {0.1,0.1,0.1,1};
			colorBackgroundActive[] = {0.6,0.6,0.6,1};
			colorFocused[] = {0.6,0.6,0.6,1};
		};
		
	};
	
	class controls
	{
		class Player_value_weight: RscText
		{
			idc = 1020;
			text = "0/0";
			x = 0.796875;
			y = 0.15;
			w = 0.109375;
			h = 0.05;
			colorText[] = {1,1,1,1};
		};
		class Stats_picture_food: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.09375;
			y = 0.35;
			w = 0.03125;
			h = 0.05;
		};
		class Stats_value_hunger: RscText
		{
			idc = 1013;
			text = "100%";
			x = 0.125;
			y = 0.35;
			w = 0.078125;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
		};
		class Stats_picture_water: RscPicture
		{
			idc = 1201;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.09375;
			y = 0.293266;
			w = 0.03125;
			h = 0.05;
		};
		class Stats_value_thirst: RscText
		{
			idc = 1014;
			text = "100%";
			x = 0.125;
			y = 0.293266;
			w = 0.078125;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
		};
		class Stats_picture_health: RscPicture
		{
			idc = 1202;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.21875;
			y = 0.293266;
			w = 0.03125;
			h = 0.05;
		};
		class Stats_value_health: RscText
		{
			idc = 1019;
			text = "100%";
			x = 0.25;
			y = 0.293266;
			w = 0.078125;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
		};
		class Finance_combo: RscCombo
		{
			idc = 2100;
			x = 0.09375;
			y = 0.7;
			w = 0.15625;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class Finance_edit: RscEdit
		{
			idc = 1400;
			text = "1";
			x = 0.09375;
			y = 0.625;
			w = 0.15625;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class Finance_value_money: RscText
		{
			idc = 1015;
			text = "0";
			x = 0.1875;
			y = 0.5;
			w = 0.140625;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
		};
		class Finance_value_bankmoney: RscText
		{
			idc = 1016;
			text = "0";
			x = 0.1875;
			y = 0.55;
			w = 0.140625;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
		};
		class Inventory_edit: RscEdit
		{
			idc = 1401;
			text = "1";
			x = 0.390625;
			y = 0.625;
			w = 0.1875;
			h = 0.05;
		};
		class Inventory_listbox: RscListbox
		{
			idc = 1500;
			x = 0.390625;
			y = 0.3;
			w = 0.5;
			h = 0.3;
			colorText[] = {0.9,0.9,0.9,1};
		};
		class Inventory_combo: RscCombo
		{
			idc = 2101;
			x = 0.59375;
			y = 0.625;
			w = 0.296875;
			h = 0.05;
			colorText[] = {0.9,0.9,0.9,1};
			colorBackground[] = {0.1,0.1,0.1,1};
		};
	};
};