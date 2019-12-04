/*
	Author: Mossarelli

	Description:
	Function called by the logic to initialize the whole lane.

	Parameter(s):
		0:	Logic Object.

	Returns:
	N/A
*/

private ["_object"];
_object = _this select 0;

//Error Message.
if (isNull _object) exitWith
{
	[
		"Error: There's no Logic referred in the script. Make sure there's one Logic per firing lane."
	] call BIS_fnc_errorMsg;
};

//Init the Array for the targets. For each target synced to the logic, they will be added to this variable.
_object setVariable ["MossLogicTargetArray",[],true];

//Get the objects that are synced to the logic.
_synced_objects = synchronizedObjects _object;

//Error Message.
if (count (_synced_objects) < 2) exitWith
{
	[
		"Error: Make sure to sync all signs and targets to the logic in the editor."
	] call BIS_fnc_errorMsg;
};

//Use Target's lane number to make a unique variable for the texture.
_logicname = ([( str _object),11,12] call BIS_fnc_trimString);

//Make unique variable.
_texturename = format ["pics\Range\%1.jpg",_logicname];

//Init all the objects.
{
	if (_x isKindOf MOSS_TargetObject) then
	{
		[_x,_object] call Moss_fnc_TargetInit;
	};
	if (_x isKindOf MOSS_SignObject) then
	{
		_x setObjectTexture [0,_texturename];
		[_x,_object] call Moss_fnc_SignInit;
	};
	if (_x isKindOf MOSS_MonitorObject) then
	{
		[_x,_object] call Moss_fnc_CameraInit;
	};
	if (_x isKindOf MOSS_TableObject) then
	{
		[_x] call Moss_fnc_RifleOnTable;
	};
	if (_x isKindOf MOSS_Box) then
	{
		clearItemCargo _x;
		clearMagazineCargo _x;
		clearWeaponCargo _x;
		_x addMagazineCargo [MOSS_Magazine,30];
	};
	if (_x isKindOf MOSS_NumberSignObject) then
	{
		_x setObjectTexture [0,_texturename];
	};
} foreach _synced_objects;

