if (dead == 0) {
tim ++

x += spd * PlayerDir;

var _F = spd * 2;

if (place_meeting(x + PlayerDir, y, NPCTRIGER_O)) {
    PlayerDir = -PlayerDir;
}

var _move = dsin(tim * rnd) * _F; 
var _move1 = dsin(tim * rnd) * 1;
var _arm = 90 * PlayerDir + (dsin(tim * rnd0) * 30 * PlayerDir);

BaseLeg1Rotate = _move;
BaseLeg2Rotate = -_move;
BaseArmRotate  = _arm;
BaseArm1Rotate  = _arm;

UpdatePos ();
} else { 
var _player_x = Player_O.PlayerGetPos()[0];
var _player_y = Player_O.PlayerGetPos()[1];


    var _base_dir = point_direction(_player_x, _player_y, x, y);
    
    var _count = irandom_range(10, 20);
    
    for (var i = 0; i < _count; i++) {
        var _P = instance_create_depth(x, y, 0, pump_O);
        
        var _scale = (i == 0) ? 1 : 0.3;
        _P.image_xscale = _scale;
        _P.image_yscale = _scale;
        
       
        var _dir = _base_dir + random_range(-25, 25); 
        var _spd = random_range(6, 14);
        
        _P.hsp = lengthdir_x(_spd, _dir);
        _P.vsp = lengthdir_y(_spd, _dir) - random_range(2, 5); 
        _P.rot_spd = random_range(-12, 12);
    }




	
	
instance_destroy() }

if x < 0 { instance_destroy() }
if x > room_width { instance_destroy() }

if y < 0 { instance_destroy() }
if y > room_height { instance_destroy() }