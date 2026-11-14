timer += min(0.1, delta_time / 1000000)
if (timer >= 7){
	posy = 1
}

if (posy == 1){
	Cassir2_obj.y += 0.8
	Cassir2_1_obj.y += 0.8
}

if (timer > 8){
	instance_destroy(Cassir2_obj)
	instance_destroy(Cassir2_1_obj)
}
