// by ALIAS
// STORM SCRIPT 
// Tutorial: https://www.youtube.com/user/aliascartoons

/*	============================
	==   MONSOON Parameters	  ==
	============================	*/

private ["_parameters"];

_parameters = 
[
	100, // Direction - in compass degrees from 0 to 360
	920, // Duration - in seconds
	true, // Violent - true propels random objects if true
	true, // Debris - true creates particle effects & branches
	true, // Fog - true creates local fog around players
	true, // Rain - true to create rain drops
	true, // Thunder - true to hear thunder and lightning, shows vanilla thunder otherwise
	1 // Thunder delay - delay between thunder strikes
];

_parameters execVM "AL_scripts\monsoon\al_monsoon.sqf";