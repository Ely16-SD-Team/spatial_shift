timer -= min(0.1, delta_time / 1000000)
if (timer <= 0){
	Noise_st();
	Menu_HUD_obj.image_index ++
	timer = irandom_range(4,9)
}