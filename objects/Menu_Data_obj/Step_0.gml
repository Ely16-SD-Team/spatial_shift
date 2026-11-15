
//Старт
if mouse_check_button_pressed(mb_left){
	if (point_in_rectangle(mouse_x, mouse_y, 10, 240, 10 + string_width("Start Game"), 240 + 30)) {
		room_goto(Bathroom_01_rm)
	}
}

if (point_in_rectangle(mouse_x, mouse_y, 10, 240, 10 + string_width("Start Game"), 240 + 30)) {
	col = 1
}else col=0

//Выход
if mouse_check_button_pressed(mb_left){
	if (point_in_rectangle(mouse_x, mouse_y, 10, 280, 10 + string_width("Exit"), 280 + 30)) {
		game_end()
	}
}

if (point_in_rectangle(mouse_x, mouse_y, 10, 280, 10 + string_width("Exit"), 280 + 30)) {
	col1 = 1
}else col1=0