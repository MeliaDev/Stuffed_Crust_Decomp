if start
{
    var bgx = bg_x
    var bgy = (bg_y - 200)
    draw_sprite_tiled(bg_space1, 0, bgx, bgy)
    shader_set(global.Pal_Shader)
    var cx = irandom_range((-shake_mag), shake_mag)
    var cy = irandom_range((-shake_mag), shake_mag)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, 1, 1, global.palettetexture)
    pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
    draw_sprite(sprite_index, image_index, cx, cy)
    pattern_reset()
    reset_shader_fix()
}
draw_set_alpha(fade)
draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_black, c_black, c_black, c_black, 0)
draw_set_alpha(1)
if instance_exists(obj_fadeout)
{
    draw_set_alpha(obj_fadeout.fadealpha)
    draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_black, c_black, c_black, c_black, 0)
    draw_set_alpha(1)
}
