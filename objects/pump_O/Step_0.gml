var _dt = min(0.1, delta_time / 1000000);
vsp += grav;

if (place_meeting(x + hsp, y, AllWall_O)) {
    while (!place_meeting(x + sign(hsp), y, AllWall_O)) {
        x += sign(hsp);
    }
    hsp = -hsp * bounce; 
    rot_spd = -rot_spd * 0.7;
}
x += hsp;

var _bottom_offset = bbox_bottom - y;

if (place_meeting(x, y + vsp, AllWall_O) || (bbox_bottom + vsp >= _floor_y && vsp > 0)) {
    
    if (place_meeting(x, y + vsp, AllWall_O)) {
        while (!place_meeting(x, y + sign(vsp), AllWall_O)) {
            y += sign(vsp);
        }
    } 
    else if (bbox_bottom + vsp >= _floor_y) {
        y = _floor_y - _bottom_offset;
    }
    
    if (abs(vsp) > 1.5) {
        vsp = -vsp * bounce;
        hsp *= friction_val; 
        rot_spd *= 0.7;
    } else {
        vsp = 0;
        hsp *= friction_val;
        rot_spd = 0;
        if (abs(hsp) < 0.1) hsp = 0;
    }
} else {
    y += vsp;
}

image_angle += rot_spd;


if (life_time > 0) {life_time -= _dt} else { instance_destroy() }