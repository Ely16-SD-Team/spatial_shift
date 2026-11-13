var _dt = min(0.1, delta_time / 1000000);
vsp += grav;

if (place_meeting(x + hsp, y, obj_wall)) {
    while (!place_meeting(x + sign(hsp), y, obj_wall)) {
        x += sign(hsp);
    }
    hsp = -hsp * bounce; 
    rot_spd = -rot_spd * 0.7;
}
x += hsp;

var _floor_y = 250;

if (place_meeting(x, y + vsp, obj_wall) || (y + vsp >= _floor_y && vsp > 0)) {
    
    if (place_meeting(x, y + vsp, obj_wall)) {
        while (!place_meeting(x, y + sign(vsp), obj_wall)) {
            y += sign(vsp);
        }
    } 
    else if (y + vsp >= _floor_y) {
        y = _floor_y;
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

if (life_time > 0) {life_time -= _dt} else { instance_destroy() }