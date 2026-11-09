function Interectedobj (_x,_y,ids,dis) constructor {
	ids_List = [];
	x_List = [];
	y_List = [];
	X = _x;
	Y = _y;
	Ids = ids;
	frame = 0;
	Dis = dis;
	
	static Draw = function() {
		var _plpos = Player_O.PlayerGetPos();
		if (point_distance(_plpos[0],_plpos[1],X,Y) < Dis) {
			self.frame += 0.1;
			draw_sprite_ext(Button_use_sp,frame,_plpos[0],_plpos[1] - 120,1,1,0,c_white,1)
			if (keyboard_check_pressed(ord("E"))) {
		            
					if (instance_exists(self.Ids)) {
		                self.Ids.interacted = true;
		            }
					
		    }
		} else {
			self.frame = 0;
		}
		
	}
}
