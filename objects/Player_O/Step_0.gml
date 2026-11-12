function UpdatePos () {
BaseArmPos = [x - (25 * PlayerDir), y - 28];
BaseArm1Pos = [x - (25 * PlayerDir), y - 28];
BaseBodyPos = [x,y];
BaseHeadPos = [x,y + BaseHeadBord];
BaseLeg1Pos = [x,y];
BaseLeg2Pos = [x,y];
}



// Input
var _key_right = keyboard_check(ord("D"));
var _key_left  = keyboard_check(ord("A"));

var _move_dir = _key_right - _key_left;





// SIN COS
tim ++;


if (global.PlayerGun == 0) {

if (_move_dir != 0) {
    PlayerDir = _move_dir;
}

UpdatePos ();

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

var _F = MoveSpeed * 2;

var _move = dsin(tim * 5) * _F; 
var _move1 = dsin(tim * 5) * 1;
var _arm = dsin(tim * 5) * 4; 
var _head = dsin(tim * 5) * 1; 

var _vx = _move_dir * MoveSpeed;
if (place_meeting(x + _vx, y, AllWall_O)) {
        
    while (!place_meeting(x + sign(_vx), y, AllWall_O)) {
        x += sign(_vx); 
}  

ChangeToIdle();

} else {
       
    BaseLeg1Rotate = _move;
	if (_move == _F || _move = -_F) { audio_play_sound(StepSound,0,0) } 
    BaseLeg2Rotate = -_move;
	/*
	BaseLeg1Pos[1] += _move1; 
	BaseLeg2Pos[1] += -_move1;
	*/
    BaseArmRotate  = _arm;
    BaseHeadPos[1] += _head;

   x += _vx; 
} 


if (_move_dir == 0) { ChangeToIdle () }

break;

}

} else {
	
if (mouse_x >= x) {
PlayerDir = 1;
} else {
	PlayerDir = -1; 
}

UpdatePos ();
	
var _raw_rad = point_direction(x, y, mouse_x, mouse_y);
var _base_angle = (PlayerDir == 1) ? 0 : 180;
var _target_rot = clamp(angle_difference(_raw_rad, _base_angle), -20, 20);

FinalyRot = lerp(FinalyRot, _target_rot, 0.05) + random_range(-0.1,0.1);	
	
switch(current_state) {

case States.PLAYER_SHOOT_IDLE:

var _wave = (dsin(tim * 4) + 1) / 2;
var _scale = BaseScale[0] + (_wave * 0.05);
var _scale1 = BaseScale[1] + (_wave * 0.05);
var _headrot = 1 + (_wave * 2);

// breath
BaseBodyScale[0] = _scale;
BaseBodyScale[1] = _scale1;

// Head Rot
BaseHeadRotate = _headrot;
BaseHeadPos[0] = BaseHeadPos[0] + random_range(-0.1,0.1)
BaseHeadPos[1] = BaseHeadPos[1] + random_range(-0.1,0.1)

// Moving
if (_move_dir != 0) { 
	current_state = States.PLAYER_SHOOT_WALK; 
}

// Arm 
BaseArmRotate = FinalyRot ;
BaseArm1Rotate = FinalyRot ;



break;

case States.PLAYER_SHOOT_WALK:

var _F = MoveSpeed * 2;

var _move = dsin(tim * 5) * _F; 
var _move1 = dsin(tim * 5) * 1;
var _arm = dsin(tim * 5) * 4; 
var _head = dsin(tim * 5) * 1; 

var _vx = _move_dir * MoveSpeed;
if (place_meeting(x + _vx, y, AllWall_O)) {
        
    while (!place_meeting(x + sign(_vx), y, AllWall_O)) {
        x += sign(_vx); 
}  

ChangeToIdle();

} else {
       
    BaseLeg1Rotate = _move;
	if (_move == _F || _move = -_F) { audio_play_sound(StepSound,0,0) } 
    BaseLeg2Rotate = -_move;
	/*
	BaseLeg1Pos[1] += _move1; 
	BaseLeg2Pos[1] += -_move1;
	*/
    BaseArmRotate  = _arm;
    BaseHeadPos[1] += _head;

   x += _vx; 
} 

// Arm 
BaseArmRotate = FinalyRot;
BaseArm1Rotate = FinalyRot;

//Head
BaseHeadPos[0] = BaseHeadPos[0] + random_range(-0.1,0.1)
BaseHeadPos[1] = BaseHeadPos[1] + random_range(-0.1,0.1)

if (_move_dir == 0) { ChangeToIdle () }

break;

}

}











if (keyboard_check_pressed(vk_f1)) { global.PlayerGun = 1 current_state =  States.PLAYER_SHOOT_IDLE }



function ChangeToIdle () {
    BaseLeg1Rotate = 0;
    BaseLeg2Rotate = 0;
	BaseHeadPos[1] = y + BaseHeadBord;
    if (global.PlayerGun == 0) {
    BaseArmRotate = 0;
    current_state = States.PLAYER_IDLE;
} else {
    current_state = States.PLAYER_SHOOT_IDLE;
}
}
if (global.PlayerStop == true) { ChangeToIdle (); }

if (global.ReserchMask == false){
MoveSpeed = 2
}else {
MoveSpeed = 3
}
