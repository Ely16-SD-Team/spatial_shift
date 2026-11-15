if (dirblack == 0){
	applhis -= min(0.1, delta_time / 1000000)
	applhis = max(applhis, 0)
}else if (dirblack == 1){ applhis += min(0.1, delta_time / 1000000)}
if applhis >= 1{
	room_goto(Menu_rm)
}
timer += min(0.1, delta_time / 1000000)
if timer >= 2{
dirblack  = 1
}