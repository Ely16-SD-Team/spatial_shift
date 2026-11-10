function GOTO (roomN,SpawnX,SpawnY) constructor {
    RoomN = roomN;
    X_pos = SpawnX;
    Y_pos = SpawnY;
	
    static Update = function() {
        var _sw = sprite_get_width(other.sprite_index);
        var _sh = sprite_get_height(other.sprite_index);
        
        var _x2 = other.x + (_sw * other.image_xscale);
        var _y2 = other.y + (_sh * other.image_yscale);

        var _player_touch = collision_rectangle(other.x, other.y, _x2, _y2, Player_O, false, true);

        if (_player_touch != noone) {

		    if (global.ScreenManager.alpha == 0) {
		        global.ScreenManager.Trigger("fade_to_black");
				global.PlayerStop = true;
		    }
    
		    if (global.ScreenManager.alpha >= 1) {
		        global.RoomSpawnPos = [X_pos, Y_pos];
		        global.RoomSkip = true;
		        room_goto(RoomN);
        
		        global.ScreenManager.Trigger("fade_to_clear");
				global.PlayerStop = false;
		    }
		}
    }
}