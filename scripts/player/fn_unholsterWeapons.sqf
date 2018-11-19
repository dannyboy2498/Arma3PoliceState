/*
	File: fn_unholsterWeapons.sqf
	Author: Danny

	Description:
	Add weapons to object from holser object variable
	
	Arguments:
	_this select 0: OBJECT - unit to add weapons to
	
*/

private ["_unit","_holster", "_weaps", "_mags"];
_unit = _this select 0;

if(isNull _unit) exitWith {};
if (_unit getVariable ["taserOut", false]) exitWith {[_unit] spawn FARM_fnc_holsterTaser}; // if taser is out holster taser instead

// if carrying weapons drop them;
_weaps = weapons _unit;
_mags = magazinesAmmo _unit;
if (count _weaps > 0 || count _mags > 0) then
{
	_wh = "GroundWeaponHolder_Scripted" createVehicle position player;
	_items = (weaponsItems _unit);
	{
		_weapon = _x;
		_weaponIndex = _forEachIndex;
		_wh addWeaponCargoGlobal [_weapon,1];
		
		_accessories = _unit weaponAccessories _weapon;
		{
			_wh addItemCargoGlobal [_x, 1];
		} forEach _accessories;
		
		_weaponItems = (_items select _weaponIndex);
		_currentMag = (_weaponItems - _accessories - [_weapon]) select 0;

		if (count _currentMag > 0) then
		{
			_wh addMagazineAmmoCargo [(_currentMag select 0), 1, (_currentMag select 1)];
		};
		
		[_wh] spawn 
		{
			_box = _this select 0;
			while {!isNull _box} do
			{
				if (((weaponCargo _box) isEqualTo []) && ((magazineCargo _box) isEqualTo []) && ((everyContainer _box) isEqualTo []) && ((itemCargo _box) isEqualTo [])) exitWith {};
				sleep 1;
			};
			deleteVehicle _box;
		};
		
		
		_unit removeWeapon _weapon;
	} forEach _weaps;
	
	{
		_unit removeMagazineGlobal (_x select 0);
		_wh addMagazineAmmoCargo [(_x select 0), 1, (_x select 1)];
	} forEach _mags;
	
	sleep 0.1;
};

_holster = _unit getVariable ["holster", []];
if (count _holster == 0) exitWith {};

_weaps = _holster select 0;
_mags = _holster select 1;
_accessories = _holster select 2;

{_unit addWeapon _x} forEach _weaps;
{
	_weapon = _forEachIndex;
	{
		_unit addWeaponItem [_weaps select _weapon, _x];
	} forEach _x;
} forEach _accessories;
{_unit addMagazine [_x select 0, _x select 1]} forEach _mags;

_unit setVariable ["holster", [], true];
[_unit, "holsterKilled", "Killed"] spawn FARM_fnc_removeEventHandler;