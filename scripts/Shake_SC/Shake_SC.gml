function Camera_Shake(_strong) {
    static _state = { 
        power: 0, 
        fade: 0.5, 
        off_x: 0, 
        off_y: 0 
    };
    _state.power = max(_state.power, _strong);
    return _state;
}

function Camera_Shake_Update() {
    var _state = Camera_Shake(0);
    var _cam = view_camera[0];
    
    var _base_x = camera_get_view_x(_cam) - _state.off_x;
    var _base_y = camera_get_view_y(_cam) - _state.off_y;
    
    if (_state.power > 0) {
        _state.off_x = random_range(-_state.power, _state.power);
        _state.off_y = random_range(-_state.power, _state.power);
        
        var _cam_w = camera_get_view_width(_cam);
        var _cam_h = camera_get_view_height(_cam);
        
        var _final_x = clamp(_base_x + _state.off_x, -200, max(-200, room_width - _cam_w + 200));
        var _final_y = clamp(_base_y + _state.off_y, -200, max(-200, room_height - _cam_h + 200));
        

        _state.off_x = _final_x - _base_x;
        _state.off_y = _final_y - _base_y;
        
        camera_set_view_pos(_cam, _final_x, _final_y);
        
        _state.power = max(0, _state.power - _state.fade);
    } else if (_state.off_x != 0 || _state.off_y != 0) {
        _state.off_x = 0;
        _state.off_y = 0;
        camera_set_view_pos(_cam, _base_x, _base_y);
    }
}
