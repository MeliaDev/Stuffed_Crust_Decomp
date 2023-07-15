if (state > 3)
{
    shader_set(global.Pal_Shader)
    pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
    draw_self()
    shader_reset()
    draw_sprite(spr_scooterrock, boulder_index, boulder_x, boulder_y)
}
if (state < 4)
{
    var cx = camera_get_view_x(view_camera[0])
    var cy = camera_get_view_y(view_camera[0])
    draw_set_alpha(whitefade)
    draw_rectangle_color(cx, cy, (cx + obj_screensizer.actual_width), (cy + obj_screensizer.actual_height), c_white, c_white, c_white, c_white, 0)
    draw_set_alpha(fade)
    draw_rectangle_color(cx, cy, (cx + obj_screensizer.actual_width), (cy + obj_screensizer.actual_height), c_black, c_black, c_black, c_black, 0)
    draw_set_alpha(1)
}
