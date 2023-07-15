if fadein
{
    if (state == 0)
        fade = Approach(fade, 1, 0.2)
    else
        fade = Approach(fade, 1, 0.08)
}
else
    fade = Approach(fade, 0, 0.08)
if (state > 0 && state > 0 && state < 5)
{
    camera_set_view_size(view_camera[0], (obj_screensizer.actual_width * camzoom), (obj_screensizer.actual_height * camzoom))
    obj_screensizer.camzoom = camzoom
    var cx = camx
    var cy = obj_player1.y
    cx -= (camera_get_view_width(view_camera[0]) / 2)
    cy -= (camera_get_view_height(view_camera[0]) / 2)
    camx += camdir
    camera_set_view_pos(view_camera[0], cx, cy)
}
else
{
    camera_set_view_size(view_camera[0], obj_screensizer.actual_width, obj_screensizer.actual_height)
    obj_screensizer.camzoom = 1
}
