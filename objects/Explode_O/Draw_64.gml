var _video_data = video_draw();
var _status = _video_data[0]; 

if (_status == 0) {
    var _surface = _video_data[1]; 
    
    if (surface_exists(_surface)) {
        var _gui_w = display_get_gui_width();
        var _gui_h = display_get_gui_height();
        
        draw_surface_stretched(_surface, 0, 0, _gui_w, _gui_h);
    }
}
