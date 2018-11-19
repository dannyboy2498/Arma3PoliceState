#define radio_volume 0.6

class CfgSounds
{
	sounds[] = {};

	class chime
	{
		name = "pnc_chime";
		sound[] = {"sounds\chime.ogg", 1, 1, 100};
		titles[] = { 0, "" };
	};
	class update
	{
		name = "pnc_update";
		sound[] = {"sounds\pnc_update.ogg", 1, 1, 100};
		titles[] = { 0, "" };
	};
	class help
	{
		name = "pnc_assistance";
		sound[] = {"sounds\pnc_assistance.ogg", 1, 1, 100};
		titles[] = { 0, "" };
	};
	class askhelp
	{
		name = "radio_help";
		sound[] = {"sounds\radio_help.ogg", 1, 1, 100};
		titles[] = { 0, "" };
	};

	class siren_1
	{
		name = "siren_1";
		sound[] = {"sounds\siren1.ogg", 1, 1};
		titles[] = {0, ""};
	};
	
	class siren_2
	{
		name = "siren_2";
		sound[] = {"sounds\siren2.ogg", 1, 1};
		titles[] = {0, ""};
	};
	
	class siren_3
	{
		name = "siren_3";
		sound[] = {"sounds\siren3.ogg", 1, 1};
		titles[] = {0, ""};
	};
	
	class gendarmerie_siren
	{
		name = "gendarmerie_siren";
		sound[] = {"sounds\gendarmerie_siren.ogg", db+10, 1};
		titles[] = {0, ""};
	};

	class taser_fire
 	{
  		name = "taser_fire";
  		sound[] = {"sounds\taser_fire.ogg", 0.4, 1};
  		titles[] = {0, ""};
 	};

	class cuffs_tighten
 	{
  		name = "cuffs_tighten";
  		sound[] = {"sounds\cuffs_tighten.ogg", 0.2, 1};
  		titles[] = {0, ""};
 	};
	
	// PLAYER
	class player_radio_1
 	{
  		name = "player_radio_1";
  		sound[] = {"sounds\player\radio1.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_2
 	{
  		name = "player_radio_2";
  		sound[] = {"sounds\player\radio2.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_3
 	{
  		name = "player_radio_3";
  		sound[] = {"sounds\player\radio3.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_4
 	{
  		name = "player_radio_4";
  		sound[] = {"sounds\player\radio4.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_5
 	{
  		name = "player_radio_5";
  		sound[] = {"sounds\player\radio5.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_6
 	{
  		name = "player_radio_6";
  		sound[] = {"sounds\player\radio6.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_7
 	{
  		name = "player_radio_7";
  		sound[] = {"sounds\player\radio7.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_8
 	{
  		name = "player_radio_8";
  		sound[] = {"sounds\player\radio8.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_9
 	{
  		name = "player_radio_9";
  		sound[] = {"sounds\player\radio9.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_10
 	{
  		name = "player_radio_10";
  		sound[] = {"sounds\player\radio10.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_11
 	{
  		name = "player_radio_11";
  		sound[] = {"sounds\player\radio11.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_12
 	{
  		name = "player_radio_12";
  		sound[] = {"sounds\player\radio12.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_13
 	{
  		name = "player_radio_13";
  		sound[] = {"sounds\player\radio13.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_14
 	{
  		name = "player_radio_14";
  		sound[] = {"sounds\player\radio14.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_15
 	{
  		name = "player_radio_15";
  		sound[] = {"sounds\player\radio15.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	class player_radio_16
 	{
  		name = "player_radio_16";
  		sound[] = {"sounds\player\radio16.ogg", radio_volume, 1};
  		titles[] = {0, ""};
 	};
	
	// FLARES
	class fl_start_1
	{
		name = "fl_start_1";
		sound[] = {"\sounds\flare\fl_start_1.ogg", 1, 1};
		titles[] = {1, ""};
	};	
	class fl_burn_1
	{
		name = "fl_burn_1";
		sound[] = {"\sounds\flare\fl_burn_1.ogg", 1, 1};
		titles[] = {1, ""};
	};
	class fl_start_2
	{
		name = "fl_start_2";
		sound[] = {"\sounds\flare\fl_start_2.ogg", 1, 1};
		titles[] = {1, ""};
	};	
	class fl_burn_2
	{
		name = "fl_burn_2";
		sound[] = {"\sounds\flare\fl_burn_2.ogg", 1, 1};
		titles[] = {1, ""};
	};
	class fl_start_3
	{
		name = "fl_start_3";
		sound[] = {"\sounds\flare\fl_start_3.ogg", 1, 1};
		titles[] = {1, ""};
	};	
	class fl_burn_3
	{
		name = "fl_burn_3";
		sound[] = {"\sounds\flare\fl_burn_3.ogg", 1, 1};
		titles[] = {1, ""};
	};
	
	// MONSOON
	class bcg_wind
	{
		name = "bcg_wind";
		sound[] = {"\sounds\monsoon\bcg_wind.ogg", db+5, 1};
		titles[] = {1, ""};
	};	
	class rafala_1
	{
		name = "rafala_1";
		sound[] = {"\sounds\monsoon\rafala_1.ogg", db+10, 1};
		titles[] = {1, ""};
	};	
	class rafala_2
	{
		name = "rafala_2";
		sound[] = {"\sounds\monsoon\rafala_2.ogg", db+5, 1};
		titles[] = {1, ""};
	};	
	class rafala_4_dr
	{
		name = "rafala_4_dr";
		sound[] = {"\sounds\monsoon\rafala_4_dr.ogg", db+10, 1};
		titles[] = {1, ""};
	};	
	class rafala_5_st
	{
		name = "rafala_5_st";
		sound[] = {"\sounds\monsoon\rafala_5_st.ogg", db+10, 1};
		titles[] = {1, ""};
	};
	class rafala_6
	{
		name = "rafala_6";
		sound[] = {"\sounds\monsoon\rafala_6.ogg", db+15, 1};
		titles[] = {1, ""};
	};	
	class rafala_7
	{
		name = "rafala_7";
		sound[] = {"\sounds\monsoon\rafala_7.ogg", db+10, 1};
		titles[] = {1, ""};
	};	
	class rafala_8
	{
		name = "rafala_8";
		sound[] = {"\sounds\monsoon\rafala_8.ogg", db+15, 1};
		titles[] = {1, ""};
	};	
	class rafala_9
	{
		name = "rafala_9";
		sound[] = {"\sounds\monsoon\rafala_9.ogg", db+10, 1};
		titles[] = {1, ""};
	};
	class 01_far
	{
		name = "01_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\01_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 02_far
	{
		name = "02_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\02_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 03_far
	{
		name = "03_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\03_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 04_far
	{
		name = "04_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\04_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 05_far
	{
		name = "05_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\05_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 06_far
	{
		name = "06_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\06_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 07_far
	{
		name = "07_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\07_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 08_far
	{
		name = "08_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\08_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 09_far
	{
		name = "09_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\09_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 10_far
	{
		name = "10_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\10_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 11_far
	{
		name = "11_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\11_far.ogg",1, 1.0};
		titles[] = {0, ""};	
	};	
	class 12_far
	{
		name = "12_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\12_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 13_far
	{
		name = "13_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\13_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 14_far
	{
		name = "14_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\14_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 16_far
	{
		name = "16_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\16_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 17_far
	{
		name = "17_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\17_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 18_far
	{
		name = "18_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\18_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 19_far
	{
		name = "19_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\19_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 20_far
	{
		name = "20_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\20_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 21_far
	{
		name = "21_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\21_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 22_far
	{
		name = "22_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\22_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 23_far
	{
		name = "23_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\23_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 24_far
	{
		name = "24_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\24_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 25_far
	{
		name = "25_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\25_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 26_far
	{
		name = "26_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\26_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};	
	class 27_far
	{
		name = "27_far"; // Name for mission editor
		sound[] = {"\sounds\monsoon\27_far.ogg", 1, 1.0};
		titles[] = {0, ""};	
	};
};