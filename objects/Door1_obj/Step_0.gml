if (interacted == 1) {
	if !audio_is_playing(door_SN){
		audio_play_sound(door_SN,1,false)
	}
	interacted = 0
}