function GOTO (roomN,SpawnX,SpawnY) constructor {
    RoomN = roomN;
    X_pos = SpawnX;
    Y_pos = SpawnY;
	
    static Update = function(_inst) {
         if (!instance_exists(_inst)) return;

        var _player_touch = collision_rectangle(_inst.bbox_left, _inst.bbox_top, _inst.bbox_right, _inst.bbox_bottom, Player_O, false, true);

        if (_player_touch != noone) {

		    if (global.ScreenManager.alpha == 0) {
		        global.ScreenManager.Trigger("fade_to_black");
				global.PlayerStop = true;
		    }
    
		    if (global.ScreenManager.alpha >= 1) {
		        if (Player_O.PlayerGetPos()[0] < X_pos) { global.RoomSpawnDir = -1; } else { global.RoomSpawnDir = 1; }
				
				global.RoomSpawnPos = [X_pos, Y_pos];
		        global.RoomSkip = true;
		        room_goto(RoomN);
        
		        global.ScreenManager.Trigger("fade_to_clear");
				global.PlayerStop = false;
		    }
		}
    }
}