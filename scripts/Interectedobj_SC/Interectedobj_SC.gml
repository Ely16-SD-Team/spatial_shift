function Interectedobj (_x,_y,ids,dis,descriotion,isDesc) constructor {
	ids_List = [];
	x_List = [];
	y_List = [];
	X = _x;
	Y = _y;
	Ids = ids;
	frame = 0;
	Dis = dis;
	Desc = descriotion;
	Isdesc = isDesc;
	
	static Draw = function() {
		var _plpos = Player_O.PlayerGetPos();
		var _dist = point_distance(_plpos[0],_plpos[1],X,Y);
		
		if (_dist < Dis && self.Ids.interacted != -1) {
			
			if (global.ActiveInteractID == noone || _dist < point_distance(_plpos[0], _plpos[1], global.ActiveInteractID.x, global.ActiveInteractID.y)) {
				
				global.ActiveInteractID = self.Ids; 
				global.DescriptionText = Desc;
			}
				
			if (global.ActiveInteractID == self.Ids && Isdesc == false) {
				self.frame += 0.05;
				draw_sprite_ext(Button_use_sp, frame, _plpos[0], _plpos[1] - 120, 1, 1, 0, c_white, 1);
				
				if (keyboard_check_pressed(ord("E"))) {
					if (instance_exists(self.Ids)) {
						self.Ids.interacted = 1;
					}
				}
			} else {
				self.frame = 0;
			}
			
		} else {
			self.frame = 0;
		}
	}
}
