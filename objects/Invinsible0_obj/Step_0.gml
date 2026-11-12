_dt = min(0.1, delta_time / 1000000);

// Катсцена не трогать нахуй
if (interacted == 1) {
    Player_O.y = -400;
    global.PlayerStop = true;
	timer0 += _dt;
	if (timer0 >= 5) { room_goto(Explosion_rm); }
    zoom_level = lerp(zoom_level, target_zoom, 0.04);
}

var _new_w = cam_base_w * zoom_level;
var _new_h = cam_base_h * zoom_level;

camera_set_view_size(view_camera, _new_w, _new_h);

var _cam_x = (room_width / 2) - (_new_w / 2);
var _cam_y = (room_height / 2) - (_new_h / 2);

_cam_x = clamp(_cam_x, 0, max(0, room_width - _new_w));
_cam_y = clamp(_cam_y, 0, max(0, room_height - _new_h));

camera_set_view_pos(view_camera, _cam_x, _cam_y);