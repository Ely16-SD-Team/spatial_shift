enum States {
	PLAYER_IDLE,
	PLAYER_WALK,
	PLAYER_RUN,
	PLAYER_SHOOT_IDLE,
	PLAYER_SHOOT_WALK
}

current_state = States.PLAYER_IDLE;

tim = 0;

AnimTest = false;

BaseScale = [image_xscale,image_yscale]

BaseArmPos = [x,y];
BaseArmScale = [BaseScale[0],BaseScale[1]];
BaseArmRotate = 0;

BaseArm1Pos = [x,y];
BaseArm1Scale = [BaseScale[0],BaseScale[1]];
BaseArm1Rotate = 0;

BaseBodyPos = [x,y];
BaseBodyScale = [BaseScale[0],BaseScale[1]];
BaseBodyRotate = 0;

BaseHeadBord = 2;
BaseHeadPos = [x,y + BaseHeadBord];
BaseHeadScale = [BaseScale[0],BaseScale[1]];
BaseHeadRotate = 0;

var _LegScaleBord = 0.03;

BaseLeg1Pos = [x,y];
BaseLeg1Scale = [BaseScale[0] - _LegScaleBord,BaseScale[1] - _LegScaleBord];
BaseLeg1Rotate = 0;

BaseLeg2Pos = [x,y];
BaseLeg2Scale = [BaseScale[0] - _LegScaleBord,BaseScale[1] - _LegScaleBord];
BaseLeg2Rotate = 0;

MoveSpeed = 2



PlayerDir = 1;

function PlayerGetPos () {
	return [x,y]
}

function PlayerSetPos (_x,_y,Dir) {
x = _x;
y = _y;
PlayerDir = Dir;
}

StepSound = Step_SN;

function PlayerSetSound (Sn) {
	StepSound = Sn;
}

