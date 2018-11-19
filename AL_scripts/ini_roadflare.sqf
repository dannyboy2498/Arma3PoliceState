// by ALIAS
// Road Flare DEMO
// Tutorial: https://www.youtube.com/user/aliascartoons


// Road FLARE - recommended for vanilla missions and assets only, with mods you might have problems

// flare brightness, replace 30 with desired value
al_Roadflare_brightness= 30;
publicvariable "al_Roadflare_brightness";

// flare range - scalar in meters, replace 80 with desired value
al_Roadflare_range = 80;
publicvariable "al_Roadflare_range";

// flare lifetime - scalar in seconds, replace 600 with desired value
al_Roadflare_lifetime = 380;
publicvariable "al_Roadflare_lifetime";

// Chemlights Tweak - make al_chem false if you want to disable chemlight feature
al_chem = true;
publicVariable "al_chem";

// Throwable object you want to use as road flare, make sure you get the classname right!!!
// in this example i use the red chemlight
al_flare_obj = "Chemlight_red";
publicVariable "al_flare_obj";

sleep 1;

// If you want to use ROAD FLARE place the line below in init.sqf>>>>>>>
player addEventHandler ["Fired",{[[_this select 6,_this select 5],"AL_scripts\roadflare\thrown_flare.sqf"] remoteExec ["execVM",0,true]}];

/*
If you want to have a object placed from editor to work as a road flare read below

* In the init field of the object put this
null=[[this],"AL_roadflare\static_flare.sqf"] remoteExec ["execVM",0,true];

or use this when you want to create the flare on the fly using an existing object

null=[[your_object_name,"static"],"AL_scripts\roadflare\static_flare.sqf"] remoteExec ["execVM",0,true];
/*