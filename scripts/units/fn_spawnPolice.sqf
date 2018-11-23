/* fn_spawnPolice.sqf
 * -- Spawn a police unit with varying stats & gear
 * Returns: Newly created unit
 * Arguments:
 *	_this select 0: ARRAY - position vector of the spawned unit
 *	_this select 1: NUMBER - skill level from 0-5. Default: 2 (OPTIONAL)
 *	_this select 2: SIDE or GROUP - group or side for spawned unit to be attached to. Default: FARM_VAR_sideAlly (OPTIONAL)
 */

params ["_pos"]; // Function arguments
private ["_group", "_weaps", "_hats", "_vests", "_uniform", "_satanicPower", "_skills", "_weaponNum"]; // make all variables private so if the script is called by another is doesn't affect the calling script
_satanicPower = 2;
if (count _this > 1) then {_satanicPower = _this select 1};
_group = FARM_VAR_sideAlly;
if (count _this > 2) then {_group = _this select 2};

_weaps = ["arifle_AK12_F", "SMG_05_F", "hgun_ACPC2_F"];
_hats = ["H_Beret_gen_F", "H_MilCap_gen_F", "H_Cap_police"];
_vests = ["V_TacVest_blk_POLICE", "V_TacVest_gen_F"];
_uniform = ["U_B_GEN_Commander_F", "U_B_GEN_Soldier_F"];

_skills = [_satanicPower] call FARM_fnc_randomSkill; // Ability to control those around them (420skillLevel) ;)
// We could make the skill level of the police officer an optional parameter
// I reckon then we should make the skill level of the officer and optional parameter
{_unit setSkill [_x select 0, _x select 1];} forEach _skills;

//Clear unit of weapons and gear first
{
	_unit removeMagazineGlobal (_x select 0);
} forEach magazinesAmmo _unit;

{
	_unit removeWeaponGlobal _x;
} forEach weapons _unit;

removeVest _unit;
removeUniform _unit;

// Add randomized weapons and equiment
_unit = ["B_GEN_Soldier_F", _group, _pos] call FARM_fnc_createUnit;
_unit addUniform _uniform select floor random 2;
_unit addVest _vests select floor random 2;
_unit addHeadgear _hats select floor random 2; // Remember arrays index at 0 
_weaponNum = floor random 3;
_unit addWeapon _weaps select _weaponNum;

// Add flashlight onto rifle or pistol flashlight onto pistol
if (_weaponNum == 2) then
{
	_unit addWeaponItem [_weaps select _weaponNum, "acc_flashlight_pistol"];
} else {
	_unit addWeaponItem [_weaps select _weaponNum, "acc_flashlight"];
};

_unit; // Return created unit

//Last but not least add the arguments in the header and we've got a good script :)