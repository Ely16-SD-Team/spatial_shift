var _dt = min(0.1, delta_time / 1000000);

if (Anim == 1) {
    Player_O.y = -400;
    global.PlayerStop = true;

    // 1. Плавно увеличиваем zoom_level с 0.8 до 1.0 (область обзора растет -> камера ОТДАЛЯЕТСЯ)
    if (zoom_level < target_zoom) {
        zoom_level = lerp(zoom_level, target_zoom, 0.04);
        
        if (abs(target_zoom - zoom_level) < 0.001) {
            zoom_level = target_zoom;
        }
    }

    // 2. Когда камера отдалилась до 1.0, запускаем таймер
    if (zoom_level >= target_zoom) {
        timer0 += _dt;
        if (timer0 > 5) {
            Anim = 0;
        }
    }

    // 3. Применяем размер и центрируем камеру
    var _new_w = cam_base_w * zoom_level;
    var _new_h = cam_base_h * zoom_level;

    camera_set_view_size(view_camera, _new_w, _new_h);

    var _cam_x = clamp((room_width / 2) - (_new_w / 2), 0, max(0, room_width - _new_w));
    var _cam_y = clamp((room_height / 2) - (_new_h / 2), 0, max(0, room_height - _new_h));

    camera_set_view_pos(view_camera, _cam_x, _cam_y);
}

// 4. Завершение кат-сцены и возврат игрока
if (Anim == 0) {
    // Возвращаем камере точный исходный размер 100%
    camera_set_view_size(view_camera, cam_base_w, cam_base_h);
    
    global.PlayerStop = false;
    Player_O.PlayerSetPos(320, 256, -1);
    instance_destroy();
}
