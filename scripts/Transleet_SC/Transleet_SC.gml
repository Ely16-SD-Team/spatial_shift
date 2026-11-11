function Transleet(mode, Speed) constructor {
    _Mode = mode; 
    _Speed = Speed;
    alpha = 0;
    static Trigger = function(new_mode) {
        if (new_mode == "fade_to_black") { _Mode = 1; alpha = 0; }
        if (new_mode == "fade_to_clear") { _Mode = 2; alpha = 1; }
    }
    
    static Draw = function() {

        switch(_Mode) {
            case 1: 
				global.Fade = true;
                alpha = lerp(alpha, 1.05, _Speed);
                if (alpha >= 1) {
                    alpha = 1;
                    _Mode = 0; 
					global.Fade = false;
                }
                break;
                
            case 2: 
				global.Fade = true;
                alpha = lerp(alpha, -0.05, _Speed); 
                if (alpha <= 0) {
                    alpha = 0;
                    _Mode = 0; 
					global.Fade = false;
                }
                break;
        }
        
        if (alpha > 0) {
            draw_set_alpha(alpha);
            draw_rectangle_colour(0, 0, display_get_gui_width(), display_get_gui_height(), c_black, c_black, c_black, c_black, false);
            draw_set_alpha(1);
        }
    }
}
