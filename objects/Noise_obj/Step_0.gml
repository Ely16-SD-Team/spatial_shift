timer -= min(0.1, delta_time / 1000000)

if timer <= 0{
	instance_destroy()
}