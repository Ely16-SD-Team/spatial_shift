draw_text(10,10,$"SD-Team 2026 for Restless Jam 2")

var _cam_height = camera_get_view_height(view_camera[0]);
var _cam_width = camera_get_view_width(view_camera[0]);

var _bord = 60;
var _bord0 = 15;

draw_text_colour((_cam_width/2) - string_width(global.DescriptionText) / 2,_cam_height - _bord - _bord0,global.DescriptionText,c_yellow,c_yellow,c_yellow,c_yellow,1)
//draw_text_colour((_cam_width/2) - string_width(Text[0]) / 2,_cam_height - _bord,Text[0],c_yellow,c_yellow,c_yellow,c_yellow,1)

if (waveAnim >0) {
var _sn = dsin(tim * 6) * 30; 
draw_sprite_ext(Sprite52,image_index / 10,530 + _sn,(camera_get_view_height(view_camera[0]) / 2) - 150,1,1,0,c_white,1)
}

// Translete
global.ScreenManager.Draw();

