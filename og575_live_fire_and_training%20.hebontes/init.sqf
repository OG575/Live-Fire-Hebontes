////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//                           init.sqf                                         //
//              this file is executed on both server and clients              //
////////////////////////////////////////////////////////////////////////////////

enableEnvironment [hasInterface, hasInterface];
enablesaving [false, false];

////////////////////////////////////////////////////////////////////////////////
// radom start time														
////////////////////////////////////////////////////////////////////////////////
if (isServer) then
{
myNewTime = random 24;
publicVariable "myNewTime";
};
waitUntil{not isNil "myNewTime"};
skipTime myNewTime;

setTimeMultiplier 6;

////////////////////////////////////////////////////////////////////////////////
//   TCL X																		//
////////////////////////////////////////////////////////////////////////////////

TCL_System=[0,True,[EAST, RESISTANCE],True,True,True,5,True,0,True,False];


// initialise common variable for rifle range script
[] spawn RR_fnc_initCommon;

// initialise each preplaced rifle range in the mission
// [<RangeID>,<DrillTypes>(Optional),<NumberOfLanes>(Optional),<DisplayName>(Optional),<Description>(Optional),<RangeImage>(Optional),<Marker>(Optional),<MarkerPos>,<MarkerType>(Optional),<MarkerColour>(Optional)] spawn RR_fnc_initRifleRange
//["ETR",nil,nil,nil,"Almyra Salt Flats ETR",nil,nil,true,getMarkerPos "ETR_Marker_1"] spawn RR_fnc_initRifleRange;
["ETR2",["LMG","ETR"],7,3,"LMG ETR",nil,nil,true,getMarkerPos "ETR_Marker_0"] spawn RR_fnc_initRifleRange;



////////////////////////////////////////////////////////////////////////////////
// Shut the hell up  - Mute Orders and Reports				         
////////////////////////////////////////////////////////////////////////////////

{_x setSpeaker "NoVoice"} forEach playableUnits;

enableSentences false;
