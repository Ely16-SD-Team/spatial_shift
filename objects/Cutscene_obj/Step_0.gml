if (dirblack == 0){
	applhis -= min(0.1, delta_time / 1000000)
	applhis = max(applhis, 0)
}else if (dirblack == 1){ applhis += min(0.1, delta_time / 1000000)}
if applhis >= 1{
	room_goto(Menu_rm)
}

timer += min(0.1, delta_time / 1000000)

if 	timer >= 6{
	dirblack = 1
}else if timer >= 3.8
{
	gdsfdg = 1

}
else if timer >= 3.7
{
	gdsfdg = 0}
else if timer >= 3.5
{
	gdsfdg = 1}

	
if (gdsfdg == 0){image_index = 1}
else if (gdsfdg == 1){image_index = 0}





