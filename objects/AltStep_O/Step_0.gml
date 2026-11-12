if (instance_exists(Player_O)) {
var _player_touch = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, Player_O, false, true);

if (_player_touch) { Player_O.PlayerSetSound(step_2_SN) } else { Player_O.PlayerSetSound(Step_SN) }
}