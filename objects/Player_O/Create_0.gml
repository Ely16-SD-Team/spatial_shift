
enum States {
	PLAYER_IDLE,
	PLAYER_WALK,
	PLAYER_RUN
}

current_state = States.PLAYER_IDLE;

tim = 0;

BaseScale = [0.8,0.8]

BaseArmPos = [x,y];
BaseArmScale = [BaseScale[0],BaseScale[1]];
BaseArmRotate = 0;

BaseBodyPos = [x,y];
BaseBodyScale = [BaseScale[0],BaseScale[1]];
BaseBodyRotate = 0;

BaseHeadPos = [x,y];
BaseHeadScale = [BaseScale[0],BaseScale[1]];
BaseHeadRotate = 0;

BaseLeg1Pos = [x,y];
BaseLeg1Scale = [BaseScale[0],BaseScale[1]];
BaseLeg1Rotate = 0;

BaseLeg2Pos = [x,y];
BaseLeg2Scale = [BaseScale[0],BaseScale[1]];
BaseLeg2Rotate = 0;

MoveSpeed = 4;
PlayerDir = 1;