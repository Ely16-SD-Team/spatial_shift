
enum States {
	PLAYER_IDLE,
	PLAYER_WALK,
	PLAYER_RUN
}

current_state = States.PLAYER_IDLE;

tim = 0;

BaseArmPos = [x,y];
BaseArmScale = [1,1];
BaseArmRotate = 0;

BaseBodyPos = [x,y];
BaseBodyScale = [1,1];
BaseBodyRotate = 0;

BaseHeadPos = [x,y];
BaseHeadScale = [1,1];
BaseHeadRotate = 0;

BaseLeg1Pos = [x,y];
BaseLeg1Scale = [1,1];
BaseLeg1Rotate = 0;

BaseLeg2Pos = [x,y];
BaseLeg2Scale = [1,1];
BaseLeg2Rotate = 0;

MoveSpeed = 4;
PlayerDir = 1;