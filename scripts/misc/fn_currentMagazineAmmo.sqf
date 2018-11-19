/*

*/

private ["_unit", "_weapon"];
_unit = _this select 0;
_weapon = currentWeapon _unit;
if (_count _this > 1) then {_weapon = _this select 1};

_items = weaponsItems;
_accessories = [];

//working out if needed