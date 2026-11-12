var _dt = min(0.1, delta_time / 1000000);

if (Anim == 1) {
    Player_O.y = -400;
    global.PlayerStop = true;
        timer0 += _dt;
        shake = lerp(shake,0,0.01)
		if (timer0 > 8) {
            Anim = 0;
        }
}

if keyboard_check_pressed(vk_enter) { Camera_Shake(19); }

if (Anim == 0) {
    global.PlayerStop = false;
	global.ScreenManager = new Transleet(0, 0.07); 
    Player_O.PlayerSetPos(320, 256, -1);
    instance_destroy();
}
