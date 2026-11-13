if (dead == 0) {
tim ++

x += spd * PlayerDir;

var _F = spd * 2;

if (place_meeting(x + PlayerDir, y, NPCTRIGER_O)) {
    PlayerDir = -PlayerDir;
}

var _move = dsin(tim * 5) * _F; 
var _move1 = dsin(tim * 5) * 1;
var _arm = 90 * PlayerDir + (dsin(tim * 8) * 30 * PlayerDir);

BaseLeg1Rotate = _move;
BaseLeg2Rotate = -_move;
BaseArmRotate  = _arm;
BaseArm1Rotate  = _arm;

UpdatePos ();
} else { instance_destroy() }