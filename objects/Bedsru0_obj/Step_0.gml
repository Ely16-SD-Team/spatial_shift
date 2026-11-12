if (interacted == 1){
	Player_O.y = -400;
    global.PlayerStop = true;
	anim += 0.05
	timer += min(0.1, delta_time / 1000000);
	if timer >= 3{
		timer = 0
		interacted = 0
	    global.PlayerStop = false;
		Player_O.y = Bedsru0_obj.y + 50
		Player_O.y = Bedsru0_obj.x
		global.ReserchMask = true
	}
}