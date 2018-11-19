/*
	File: fn_cfgSounds.sqf
	Author: Danny
	
	Description:
	Main handling system for sounds
	
	Arguments:
	_this select 0: STRING - sound classname
	_this select 1: STRING - "period" to retrieve length of soundfile
*/

private["_sound","_type"];
_sound = _this select 0;
_type = _this select 1;
if(_sound == "" or _type == "") exitWith {};


switch (_type) do
{
	case "period":
	{
		switch (_sound) do
		{
			case "cuffs_tighten": {0.337};
			case "radio_alert": {3.08};
			case "radio_bleep": {0.957};
			case "gendarmerie_siren": {1.11};
			case "siren_1": {5.748};
			case "siren_2": {0.33};
			case "siren_3": {0.51};
			case "taser_fire": {2.125};
			
			//Music
			case "car_radio": {110};
			
			// Player radio
			case "player_radio_1": {5.642};
			case "player_radio_2": {5.016};
			case "player_radio_3": {4.156};
			case "player_radio_4": {1.405};
			case "player_radio_5": {19.493};
			case "player_radio_6": {12.794};
			case "player_radio_7": {5.387};
			case "player_radio_8": {10.983};
			case "player_radio_9": {2.531};
			case "player_radio_10": {14.280};
			case "player_radio_11": {4.435};
			case "player_radio_12": {3.111};
			case "player_radio_13": {20.039};
			case "player_radio_14": {11.587};
			case "player_radio_15": {8.452};
			case "player_radio_16": {2.392};
			
			default {1};
		};
	};
};