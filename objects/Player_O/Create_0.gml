enum States {
	PLAYER_IDLE,
	PLAYER_WALK,
	PLAYER_RUN,
	PLAYER_SHOOT_IDLE,
	PLAYER_SHOOT_WALK,
	PLAYER_SHOOT
}
if (global.PlayerGun == 0) {
current_state = States.PLAYER_IDLE;
} else { current_state = States.PLAYER_SHOOT_IDLE; }

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

KnokBack = 0;
knockback_spd = 0;

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

FinalyRot = 0;

// Bullet

ps = part_system_create();
pt = part_type_create();
part_system_depth(ps, -100);
// setup a default particle
part_type_blend(pt, 1);
part_type_shape(pt, pt_shape_pixel);
part_type_size(pt, 3, 2, 0, 0);
part_type_scale(pt, 1, 1);
part_type_color3(pt, -16726785, -16742657, -16766465);
part_type_alpha3(pt, 1, 1, 1);
part_type_life(pt, 35, 91);
part_type_orientation(pt, 1, 8, 0, 0, false);
part_type_speed(pt, 10.32, 18.34, 0.51, 0);
part_type_direction(pt, 10, 33.67, 0, 0);
part_type_gravity(pt, 0, 0);

ArmRecoil = 0;
Reload = 0;
ReloadMax = 1.88;

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

function UpdatePos () {
    var _recoil_offset = ArmRecoil * PlayerDir;
    
    BaseArmPos  = [x - (25 * PlayerDir) - _recoil_offset, y - 28];
    BaseArm1Pos = [x - (25 * PlayerDir) - _recoil_offset, y - 28];
    BaseBodyPos = [x - _recoil_offset / 4, y - _recoil_offset / 4];
    BaseHeadPos = [x, y + BaseHeadBord];
    BaseLeg1Pos = [x, y];
    BaseLeg2Pos = [x, y];
}

function Shoot(_angle, _muzzle_x, _muzzle_y) {
    part_type_direction(pt, _angle - 15, _angle + 15, 0, 0);
    part_particles_create(ps, _muzzle_x, _muzzle_y, pt, 10);
    
    ArmRecoil = irandom_range(10, 20);
    Reload = ReloadMax;
    audio_play_sound(Shoot_SN, 1, 0, global.SoundVolume);
    

var _dist = 1000;
var _start_x = x;
var _start_y = y - 32;

var _end_x = _start_x + lengthdir_x(_dist, _angle);
var _end_y = _start_y + lengthdir_y(_dist, _angle);

var _hit_list = ds_list_create();
var _count = collision_line_list(_start_x, _start_y, _end_x, _end_y, Dolboyob_O, false, true, _hit_list, true);

var _target = noone;

for (var i = 0; i < _count; i++) {
    var _candidate = _hit_list[| i];
    
    if (_candidate.dead == 0) {
        _target = _candidate;
        break;
    }
}
ds_list_destroy(_hit_list);

if (_target == noone) {
    for (var d = 0; d <= _dist; d += 16) {
        var _px = _start_x + lengthdir_x(d, _angle);
        var _py = _start_y + lengthdir_y(d, _angle);
        
        var _near = instance_nearest(_px, _py, Dolboyob_O);
        if (_near != noone && _near.dead == 0) {
            if (point_distance(_px, _py, _near.x, _near.y - 32) < 28) {
                _target = _near;
                break;
            }
        }
    }
}

if (_target != noone) {
    _target.dead = 1;
} else {
}

}
