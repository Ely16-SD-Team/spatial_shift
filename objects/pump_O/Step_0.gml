vsp += grav;

if (place_meeting(x + hsp, y, obj_wall)) {
    while (!place_meeting(x + sign(hsp), y, obj_wall)) {
        x += sign(hsp);
    }
    hsp = -hsp * bounce; 
    rot_spd = -rot_spd * 0.7;
}
x += hsp;

if (place_meeting(x, y + vsp, obj_wall)) {
    while (!place_meeting(x, y + sign(vsp), obj_wall)) {
        y += sign(vsp);
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
}
y += vsp;

