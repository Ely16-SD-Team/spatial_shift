tim ++;
var _dt = delta_time / 1000000;

if keyboard_check_pressed(vk_right) {
	if (room_next(room) != -1) { room_goto_next() } 
	else { room_goto(room_first) }
}

// Camera 
if (instance_exists(Player_O)) {

PrevCamX = camera_get_view_x(view_camera[0]);
	
var CamW = camera_get_view_width(view_camera[0])	
var finel = clamp(Player_O.x - CamW / 2,0,room_width - CamW)

camera_set_view_pos(view_camera[0], finel ,camera_get_view_y(view_camera[0]))

var CamX = camera_get_view_x(view_camera[0]);

var shake = dsin(tim * 1) * 0.5;

if (CamX != PrevCamX) {
    shake_intensity = lerp(shake_intensity, 1, 0.1);
} else {
    shake_intensity = lerp(shake_intensity, 0, 0.1);
}

var final_angle = shake * shake_intensity;

//camera_set_view_angle(view_camera[0], final_angle);

}

global.DescriptionText = "";
global.ActiveInteractID = noone; 

// goto
if (global.RoomSkip == true) {
	if instance_exists(Player_O) {
		var _x = global.RoomSpawnPos[0];
		var _y = global.RoomSpawnPos[1];
		var _dir = global.RoomSpawnDir;
		Player_O.PlayerSetPos(_x,_y,_dir);
		global.RoomSkip = false
	}
}

// Audion
audio_set_master_gain(0,global.SoundVolume);

if keyboard_check(vk_enter) { Camera_Shake(15); }

if (global.Catarsis == 1) {
noise_timer -= _dt;

if (noise_timer <= 0) {
    Noise_st();
    noise_timer = random_range(2, 5); 
}

}

Camera_Shake_Update();