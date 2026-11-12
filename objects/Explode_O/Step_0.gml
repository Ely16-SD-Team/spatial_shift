var _dt = min(0.1, delta_time / 1000000);
var _pos = video_get_position();
var _dur = video_get_duration();
var _status = video_get_status();

if ((_dur > 0 && _pos >= _dur - 0.05) || _status == video_status_closed) {
    video_close(); 
    room_goto(RoomCatarsis_04_rm);
	global.RoomSkip = 1;
	global.RoomSpawnPos = [320,256]
	global.PlayerStop = false;
	global.RoomSpawnDir = -1;
	global.Catarsis = 1;
}

if (timer < 1) {
    timer += _dt;
    
    if (timer >= 1) {
        audio_play_sound(boom_SN, 0, false);
    }
}
