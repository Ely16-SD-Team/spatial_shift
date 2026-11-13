// Knok
 _dt = min(0.1, delta_time / 1000000)
ArmRecoil = lerp(ArmRecoil, 0, 0.2);

// Input
var _key_right = keyboard_check(ord("D"));
var _key_left  = keyboard_check(ord("A"));

var _move_dir = _key_right - _key_left;

// SIN COS
tim ++;


if (global.PlayerGun == 0) {

if (global.PlayerStop == 0) {
if (_move_dir != 0) {
    PlayerDir = _move_dir;
}
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
	
var _len  = 120; 
var _down = 20; 

var _real_angle = ((PlayerDir == 1) ? FinalyRot : (180 + FinalyRot));
var _perp_angle = _real_angle - (90 * PlayerDir); 

var _muzzle_x = BaseArmPos[0] + lengthdir_x(_len, _real_angle) + lengthdir_x(_down, _perp_angle);
var _muzzle_y = BaseArmPos[1] + lengthdir_y(_len, _real_angle) + lengthdir_y(_down, _perp_angle);
	
	
if (global.PlayerStop == 0) {	
	
if (mouse_x >= x) {
PlayerDir = 1;
} else {
	PlayerDir = -1; 
}

}

UpdatePos ();
	
var _raw_rad = point_direction(x, y, mouse_x, mouse_y);
var _base_angle = (PlayerDir == 1) ? 0 : 180;
var _target_rot = clamp(angle_difference(_raw_rad, _base_angle), -10, 10);

FinalyRot = lerp(FinalyRot, _target_rot, 0.05) + random_range(-0.1, 0.1) + (ArmRecoil / 3) * PlayerDir;
	
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

// Shoot
if (mouse_check_button_pressed(mb_left) && Reload <=0 && global.PlayerStop == 0) { 
part_type_direction(pt, _real_angle - 15, _real_angle + 15, 0, 0);
part_particles_create(ps, _muzzle_x, _muzzle_y, pt, 10); 
ArmRecoil = irandom_range(10, 15);
Reload = ReloadMax;
audio_play_sound(Shoot_SN,1,0,global.SoundVolume);
}


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

// Shootif (global.PlayerStop == 0) {
if (mouse_check_button_pressed(mb_left) && Reload <=0 && global.PlayerStop == 0) { 
part_type_direction(pt, _real_angle - 15, _real_angle + 15, 0, 0);
part_particles_create(ps, _muzzle_x, _muzzle_y, pt, 10);
ArmRecoil = irandom_range(10, 20);
Reload = ReloadMax;
audio_play_sound(Shoot_SN,1,0,global.SoundVolume);
var _dist = 1000; 
var _end_x = x + lengthdir_x(_dist, _real_angle);
var _end_y = y + lengthdir_y(_dist, _real_angle);

var _hit = collision_line(x, y, _end_x, _end_y, Dolboyob_O, false, true);

if (_hit != noone) {
    _hit.dead = 1;
}

}

break;

}

}






if (Reload > 0) { Reload -= _dt }

if (abs(knockback_spd) > 0.1) {
    if (!place_meeting(x + knockback_spd, y, AllWall_O)) {
        x += knockback_spd;
    }
    knockback_spd = lerp(knockback_spd, 0, 0.2);
} else {
    knockback_spd = 0;
}



if (keyboard_check_pressed(vk_f1)) { global.PlayerGun = 1 current_state =  States.PLAYER_SHOOT_IDLE }

if (global.PlayerStop == true) { ChangeToIdle (); }

if (global.ReserchMask == false){
MoveSpeed = 2
}else {
MoveSpeed = 3
}
