timer += min(0.1, delta_time / 1000000)
if (timer >= 2){
	posy = 1
}

if (posy == 1){
	Cassir1_obj.y += 0.8
	Cassir1_1_obj.y += 0.8
}

if (timer > 3){
	instance_destroy(Cassir1_obj)
	instance_destroy(Cassir1_1_obj)
}
