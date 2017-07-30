// Initialise the global array that allows the lookup of the depth of a given object
// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
// NOTE: MacroExpansion is used to insert the array initialisation at import time
gml_pragma( "global", "__global_object_depths()");

// insert the generated arrays here
global.__objectDepths[0] = 0; // oGame
global.__objectDepths[1] = 0; // oGenerateWorld
global.__objectDepths[2] = 0; // oParSolid
global.__objectDepths[3] = 0; // oTouchCompatible
global.__objectDepths[4] = 0; // oParJumpThru
global.__objectDepths[5] = 0; // oSpike
global.__objectDepths[6] = 6; // oJumpThru
global.__objectDepths[7] = 0; // oParDestructable
global.__objectDepths[8] = 0; // oSlope1R
global.__objectDepths[9] = 0; // oSlope1L
global.__objectDepths[10] = 0; // oSlope2L
global.__objectDepths[11] = 0; // oSlope2R
global.__objectDepths[12] = -100; // oGame_new
global.__objectDepths[13] = 0; // oBlock
global.__objectDepths[14] = 1; // oPushBlock
global.__objectDepths[15] = 0; // oParEntity
global.__objectDepths[16] = 0; // oBlockDestructable
global.__objectDepths[17] = -10; // oParticlePlayer
global.__objectDepths[18] = -100; // oFxRoomGoTo
global.__objectDepths[19] = 1; // oPlayer_new
global.__objectDepths[20] = -100; // oFxRoomRestart
global.__objectDepths[21] = -1; // oFGGrass1
global.__objectDepths[22] = 0; // oArrow
global.__objectDepths[23] = -1; // oFGGrass2
global.__objectDepths[24] = -2; // oParticleBgGrass
global.__objectDepths[25] = 0; // oParCrate
global.__objectDepths[26] = 0; // oPlayerAtkBox
global.__objectDepths[27] = -2; // oParticleFgGrass
global.__objectDepths[28] = 2; // oCrateSmall
global.__objectDepths[29] = 1; // oCoin
global.__objectDepths[30] = -100; // oFxFadeIn
global.__objectDepths[31] = 0; // oRope
global.__objectDepths[32] = 3; // oBGGrass1
global.__objectDepths[33] = 3; // oBGGrass2
global.__objectDepths[34] = -1; // oParGrass
global.__objectDepths[35] = 0; // oRopeSpawner
global.__objectDepths[36] = 0; // oFxFire
global.__objectDepths[37] = 0; // oLanternSpawner
global.__objectDepths[38] = 0; // oCrawler
global.__objectDepths[39] = 1; // oCratePoof
global.__objectDepths[40] = 0; // oPiece


global.__objectNames[0] = "oGame";
global.__objectNames[1] = "oGenerateWorld";
global.__objectNames[2] = "oParSolid";
global.__objectNames[3] = "oTouchCompatible";
global.__objectNames[4] = "oParJumpThru";
global.__objectNames[5] = "oSpike";
global.__objectNames[6] = "oJumpThru";
global.__objectNames[7] = "oParDestructable";
global.__objectNames[8] = "oSlope1R";
global.__objectNames[9] = "oSlope1L";
global.__objectNames[10] = "oSlope2L";
global.__objectNames[11] = "oSlope2R";
global.__objectNames[12] = "oGame_new";
global.__objectNames[13] = "oBlock";
global.__objectNames[14] = "oPushBlock";
global.__objectNames[15] = "oParEntity";
global.__objectNames[16] = "oBlockDestructable";
global.__objectNames[17] = "oParticlePlayer";
global.__objectNames[18] = "oFxRoomGoTo";
global.__objectNames[19] = "oPlayer_new";
global.__objectNames[20] = "oFxRoomRestart";
global.__objectNames[21] = "oFGGrass1";
global.__objectNames[22] = "oArrow";
global.__objectNames[23] = "oFGGrass2";
global.__objectNames[24] = "oParticleBgGrass";
global.__objectNames[25] = "oParCrate";
global.__objectNames[26] = "oPlayerAtkBox";
global.__objectNames[27] = "oParticleFgGrass";
global.__objectNames[28] = "oCrateSmall";
global.__objectNames[29] = "oCoin";
global.__objectNames[30] = "oFxFadeIn";
global.__objectNames[31] = "oRope";
global.__objectNames[32] = "oBGGrass1";
global.__objectNames[33] = "oBGGrass2";
global.__objectNames[34] = "oParGrass";
global.__objectNames[35] = "oRopeSpawner";
global.__objectNames[36] = "oFxFire";
global.__objectNames[37] = "oLanternSpawner";
global.__objectNames[38] = "oCrawler";
global.__objectNames[39] = "oCratePoof";
global.__objectNames[40] = "oPiece";


// create another array that has the correct entries
var len = array_length_1d(global.__objectDepths);
global.__objectID2Depth = [];
for( var i=0; i<len; ++i ) {
	var objID = asset_get_index( global.__objectNames[i] );
	if (objID >= 0) {
		global.__objectID2Depth[ objID ] = global.__objectDepths[i];
	} // end if
} // end for