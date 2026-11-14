if (room != Menu_rm && room != EndRoom_rm){
if (global.ost1 == 1){
	if !audio_is_playing(ost1_ost){
		audio_play_sound(ost1_ost, 1, 0)
	}
	if valume <= 0.8{
		valume += 0.02
	}
	audio_sound_gain(ost1_ost,valume,0)
}}