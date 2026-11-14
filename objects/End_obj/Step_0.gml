if (global.Off == 0){
	if !audio_is_playing(boom_SN){
		audio_play_sound(boom_SN,1,0,0.5,0,0.5)
	}
	if (irandom(500) == 500){
		light_obj.image_alpha = 0
	}else light_obj.image_alpha = 1
}
if (global.Off == 1){
	nex_obj.image_index = 1
	light_obj.image_alpha = 0
	audio_stop_sound(boom_SN)
	applhis += min(0.1, delta_time / 1000000)
}