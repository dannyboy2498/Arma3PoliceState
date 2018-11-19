/*
	File: fn_handleDamageLTL.sqf
	Author: Danny
*/
private ["_unit", "_damage", "_projectile","_staminaFactor","_ltlArray","_damageRatioHealth", "_damageRatioStamina"];
_unit = _this select 0;
_damageTotal = _this select 1;
_projectile = _this select 2; //currently person who caused damaged because arma likes to be difficult

_ltlArray = _projectile getVariable ["ltl", []];
_damPrev = _unit getVariable ["DamagePrevious", 0];
_damage = _damageTotal;

//systemChat format["_damageTotal = %1,_damPrev = %2,_damage = %3", _damageTotal, _damPrev,_damage, _stamina];
if (count _ltlArray > 0) then
{
	// projectile is less than lethal so handle damage differently
	
	_damageRatioHealth = _ltlArray select 0;
	_damageRatioStamina = _ltlArray select 1;
	
	_handledDamage = 0;
	if (_handledDamage < 1) then
	{
		_stamina = (getFatigue _unit) + (_damage*_damageRatioStamina);
		if (_stamina < 1) then
		{
			_unit setFatigue _stamina;
			
		} else {
			[_unit] spawn FARM_fnc_setStunned;
		};
	};
	_unit setVariable ["DamagePrevious", _handledDamage, true];
	
	_handledDamage
	
} else {
	// projectile is not less than lethal so handle damage normally
	_damage
};
