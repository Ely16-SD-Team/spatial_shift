var _dt = min(0.1, delta_time / 1000000);

if (interacted == 1) {
	timer = 1;
	var _layers = ["BG", "BG0"];
    for (var l = 0; l < array_length(_layers); l++) {
        
        var _lay_id = layer_get_id(_layers[l]);
        
        if (layer_exists(_lay_id)) {
            
            var _elements = layer_get_all_elements(_lay_id);
            
            for (var i = 0; i < array_length(_elements); i++) {
                
                var _spr = _elements[i];

                if (layer_get_element_type(_spr) == layerelementtype_sprite) {
                    layer_sprite_speed(_spr, 0);
                    layer_sprite_index(_spr, 1);
                }
            }
        }
    }
	Player_O.y = -400;
	global.PlayerGun = 1;
    global.PlayerStop = true;
	interacted = -1
}

if (interacted == -1) { timer += _dt }


if (timer >= 3 && !fade_started) {
    fade_started = true;
    global.ScreenManager.Trigger("fade_to_black");
}

if (timer >= 6) {
    room_goto(VideoHouse_01_rm);
	global.ScreenManager.Trigger("fade_to_clear");
	global.PlayerStop = false;
	global.ScreenManager = new Transleet(0, 0.07); 
}


