function GOTO (roomN,SpawnX,SpawnY) constructor {
	room_goto(roomN);
	global.RoomSpawnPos = [SpawnX,SpawnY];
	global.RoomSkip = true;
	
	static Update() {
		var _player_touch = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, Player_O, false, true);
		if (_player_touch != noone) {
		
		}
	
	}
}