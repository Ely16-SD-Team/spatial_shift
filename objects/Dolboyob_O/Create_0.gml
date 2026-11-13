BaseScale = [1,1]

BaseArmPos = [x,y];
BaseArmScale = [BaseScale[0],BaseScale[1]];
BaseArmRotate = 0;

BaseArm1Pos = [x,y];
BaseArm1Scale = [BaseScale[0],BaseScale[1]];
BaseArm1Rotate = 0;
tim = 0
BaseBodyPos = [x,y];
BaseBodyScale = [BaseScale[0],BaseScale[1]];
BaseBodyRotate = 0;

var _LegScaleBord = 0.03;

BaseLeg1Pos = [x,y];
BaseLeg1Scale = [BaseScale[0] - _LegScaleBord,BaseScale[1] - _LegScaleBord];
BaseLeg1Rotate = 0;

BaseLeg2Pos = [x,y];
BaseLeg2Scale = [BaseScale[0] - _LegScaleBord,BaseScale[1] - _LegScaleBord];
BaseLeg2Rotate = 0;

PlayerDir =  1;

function UpdatePos() {
    BaseArmPos  = [x - 4 * PlayerDir,  y - 32];
    BaseArm1Pos = [x + 25 * PlayerDir, y - 32];
    BaseBodyPos = [x + 25 * PlayerDir, y];
    BaseLeg1Pos = [x + 20 * PlayerDir, y];
    BaseLeg2Pos = [x + 10 * PlayerDir, y];
}


spd = 5;
depth = -10
dead = 0;
