BaseScale = [0.95,0.95]

BaseArmPos = [x,y];
BaseArmScale = [BaseScale[0],BaseScale[1]];
BaseArmRotate = 0;

BaseArm1Pos = [x,y];
BaseArm1Scale = [BaseScale[0],BaseScale[1]];
BaseArm1Rotate = 0;
tim =  random(1000);
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

PlayerDir = choose(-1, 1);

var _chances =[7,7,7,3,2,1,1,0]; 

var _total = 0;
for (var i = 0; i < array_length(_chances); i++) {
    _total += _chances[i];
}

var _roll = random(_total);
var _current = 0;
form = 0; 

for (var i = 0; i < array_length(_chances); i++) {
    _current += _chances[i];
    if (_roll < _current) {
        form = i;
        break;
    }
}

function UpdatePos() {
    BaseArmPos  = [x - 4 * PlayerDir,  y - 32];
    BaseArm1Pos = [x + 25 * PlayerDir, y - 32];
    BaseBodyPos = [x + 25 * PlayerDir, y];
    BaseLeg1Pos = [x + 18 * PlayerDir, y];
    BaseLeg2Pos = [x + 35 * PlayerDir, y];
}

rnd = irandom_range(3,5);
rnd0 = irandom_range(5,8);
spd = irandom_range(3,6);
depth = 0
dead = 0;
