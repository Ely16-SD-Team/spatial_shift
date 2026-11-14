// Input
var _key_right = keyboard_check(ord("D"));
var _key_left  = keyboard_check(ord("A"));

var _move_dir = _key_right - _key_left;

// Направление персонажа
if (global.PlayerStop == 0 && _move_dir != 0) {
    PlayerDir = _move_dir;
}

if (PlayerDir == -1){
	Shadow_obj.image_xscale = -1
}else if (PlayerDir == 1){
	Shadow_obj.image_xscale = 1
}

// Состояния и движение
switch(current_state) {

    case States.PLAYER_IDLE:
        if (_move_dir != 0) { 
            current_state = States.PLAYER_WALK; 
        }
        break;

    case States.PLAYER_WALK:
        var _vx = _move_dir * MoveSpeed;
        
        // Проверка коллизии со стенами
        if (place_meeting(x + _vx, y, AllWall_O)) {
            while (!place_meeting(x + sign(_vx), y, AllWall_O)) {
                x += sign(_vx); 
            }  
            ChangeToIdle();
        } else {
            x += _vx; 
        } 

        if (_move_dir == 0) { 
            ChangeToIdle(); 
        }
        break;
}

// Остановка игрока
if (global.PlayerStop == true) { 
    ChangeToIdle(); 
}

// Скорость передвижения
if (global.ReserchMask == false) {
    MoveSpeed = 2;
} else {
    MoveSpeed = 3;
}
