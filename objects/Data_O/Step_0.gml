
if keyboard_check_pressed(vk_right) {
	if (room_next(room) != -1) { room_goto_next() } 
	else { room_goto(room_first) }
}

// Camera 
if (instance_exists(Player_O)) {
var CamW = camera_get_view_width(view_camera[0])	
var finel = clamp(Player_O.x - CamW / 2,0,room_width - CamW)	

camera_set_view_pos(view_camera[0], finel ,y)
}

