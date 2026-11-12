cam_base_w = camera_get_view_width(view_camera);
cam_base_h = camera_get_view_height(view_camera);

zoom_level = 0.8;
target_zoom = 1;

var _start_w = cam_base_w * zoom_level;
var _start_h = cam_base_h * zoom_level;
camera_set_view_size(view_camera, _start_w, _start_h);
camera_set_view_pos(view_camera, (room_width - _start_w) / 2, (room_height - _start_h) / 2);

Anim = 1;

timer0 = 0
