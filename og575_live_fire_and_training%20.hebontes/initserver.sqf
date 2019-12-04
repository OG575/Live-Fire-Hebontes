// Score boards
{
	// Reset vectors
	[_x, 0, 0] call BIS_fnc_setPitchBank;
	
	// Disable simulation
	if (isMultiplayer) then {
		_x enableSimulationGlobal false;
	} else {
		_x enableSimulation false;
	};
} forEach [
	BIS_weaponsFiringRange_board,
	BIS_grenadesFiringRange_board,
	BIS_vehiclesFiringRange_board
	];