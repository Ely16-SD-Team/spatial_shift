if (global.BlockMarker == 0){
	if (interacted == 1){
		Player_O.y = -400;
	    global.PlayerStop = true;
		anim += 0.05
		timer += min(0.1, delta_time / 1000000);
		if !audio_is_playing(marker_SN){
			audio_play_sound(marker_SN,5,0)
		}
		if (timer >= 3){
			timer = 0
			interacted = 0
		    global.PlayerStop = false;
			Player_O.y = 280
			Player_O.x = 362
			global.ReserchMask = true
			global.BlockMarker = 1
		}
	}
}