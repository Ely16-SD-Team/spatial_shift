tim ++;
var _dt = (delta_time / 1000000)

//if keyboard_check_pressed(vk_right) {
//	if (room_next(room) != -1) { room_goto_next() } 
//	else { room_goto(room_first) }
//}

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
audio_set_master_gain(0,global.SoundVolume)

// 8===D 8===D 8===D 8===D 8===D 8===D 8===D 8===D
var isc1 = RoomCatarsis_new_01_rm 
var isc2 = Bedsrum_new_03_rm
var isc3 = Bathroom_new_01_rm
var isc4 = VideoHouse_02_rm_1
var isc5 = VideoHouse_02_rm_2
var isc6 = VideoHouse_02_rm_3
var isc7 = VideoHouse_03_rm
var isc8 = VideoHouse_04_rm
var isc9 = Menu_rm
var isc10 = Cutscene_rm
var isc11 = Start_rm

if (global.Catarsis == 1) && (room != isc1 && room != isc2 && room != isc3 
&& room != isc4 && room != isc5 && room != isc6 && room != isc7 && room != isc8 && room != isc9 && room != isc10 && room != isc11) {
	noise_timer -= _dt;
	if (noise_timer <= 0) {
	    Noise_st();
	    noise_timer = random_range(5, 15);
		global.Pizdec ++;
	}

var _layers = ["BG", "BG0"];
    for (var l = 0; l < array_length(_layers); l++) {
        
        var _lay_id = layer_get_id(_layers[l]);
        
        if (layer_exists(_lay_id)) {
            
            var _elements = layer_get_all_elements(_lay_id);
            
            for (var i = 0; i < array_length(_elements); i++) {
                
                var _spr = _elements[i];

                if (layer_get_element_type(_spr) == layerelementtype_sprite) {
                    layer_sprite_speed(_spr, 0);
                    layer_sprite_index(_spr, global.Pizdec);
                }
            }
        }
    }



layer_sprite_index(my_asset_sprite, global.Pizdec);


} else { global.Pizdec = 0 }



if (global.Pizdec > 1) { global.Pizdec = 0 }


// 8==============================================D
if (global.PostAnim == 1) { instance_create_depth(0,0,0,PostCatarsis_O) global.PostAnim = 0 }

Camera_Shake_Update()

//if keyboard_check_pressed(ord("N")) { global.Catarsis = 1 }



    

  
// СЮДА
var my_objects = []

for (var i = 0; i < array_length(my_objects); i++) {
    var _obj = my_objects[i];
        
    if (instance_exists(_obj)) {
            
        with (_obj) {
            image_speed = 0;
            image_index = global.Pizdec;
        }
    }
}

// sound
if (room == Menu_rm || room == Bathroom_01_rm || room == VideoHouse_01_rm) {
	if (!audio_is_playing(rain_SN)) {
	audio_play_sound(rain_SN,1,1,global.SoundVolume);
	}
} 

// vave 

if (instance_number(Dolboyob_O) > 0) { wave = 1 }

if (wave == 1) {
if (instance_number(Dolboyob_O) <= 0) {
if (room == VideoHouse_02_rm && !array_contains(global.CleredSpecial,1)) { array_push(global.CleredSpecial,1) }
if (room == VideoHouse_02_rm_1) && !array_contains(global.CleredSpecial,2) { array_push(global.CleredSpecial,2) }
if (room == VideoHouse_02_rm_2) && !array_contains(global.CleredSpecial,3) { array_push(global.CleredSpecial,3) }
if (room == VideoHouse_02_rm_3) && !array_contains(global.CleredSpecial,4) { array_push(global.CleredSpecial,4) }
wave = 0; waveAnim = 5; instance_destroy(Vawe_O) array_push(CleredRoom,room) }
}

if (waveAnim > 0) { waveAnim -= _dt; }

// Spawn 
if (array_contains(CleredRoom, room)) {

    var _allobj = [Dolboyob_O, Dolboyob_O_1_8, Dolboyob_O_2_9]; 
    for (var j = 0; j < array_length(_allobj); j++) {
        var _enemy = _allobj[j];  
        if (instance_exists(_enemy)) {
            instance_destroy(_enemy, false);
        }
    }
}



















