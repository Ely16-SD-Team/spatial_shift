if keyboard_check_pressed(vk_right){
	if room_next(room) != -1{
	room_goto_next()
	}else room_goto(room_first)
}