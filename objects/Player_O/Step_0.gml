function UpdatePos () {
BaseArmPos = [x,y];
BaseBodyPos = [x,y];
BaseHeadPos = [x,y];
BaseLeg1Pos = [x,y];
BaseLeg2Pos = [x,y];
}

UpdatePos ();

// Input
var _key_right = keyboard_check(ord("D"));
var _key_left  = keyboard_check(ord("A"));

var _move_dir = _key_right - _key_left;

if (_move_dir != 0) {
    PlayerDir = _move_dir;
}


// SIN COS
tim ++;

switch(current_state) {

case States.PLAYER_IDLE:

var _wave = (dsin(tim * 2) + 1) / 2;
var _scale = BaseScale[0] + (_wave * 0.05);
var _scale1 = BaseScale[1] + (_wave * 0.05);
var _headrot = 1 + (_wave * 2);

// breath
BaseBodyScale[0] = _scale;
BaseBodyScale[1] = _scale1;

// Head Rot
BaseHeadRotate = _headrot;

// Moving
if (_move_dir != 0) { 
	current_state = States.PLAYER_WALK; 
}

break;

case States.PLAYER_WALK:

var _move = dsin(tim * 5) * 10; 
var _arm = dsin(tim * 5) * 4; 
var _head = dsin(tim * 5) * 1; 

// Leg
BaseLeg1Rotate = _move;
BaseLeg2Rotate = -_move;

// Arm
BaseArmRotate = _arm;
BaseHeadPos[1] += _head;

x += _move_dir * MoveSpeed;

if (_move_dir == 0) {
    BaseLeg1Rotate = 0;
    BaseLeg2Rotate = 0;
	BaseArmRotate =  0;
	BaseHeadPos[1] = y;
    current_state = States.PLAYER_IDLE;
}

break;

}


