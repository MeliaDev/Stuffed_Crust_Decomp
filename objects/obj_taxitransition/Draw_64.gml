if start
{
    draw_sprite(bgsprite, bgindex, 0, 0)
    shader_set(global.Pal_Shader)
    var cy = irandom_range((-shake_mag), shake_mag)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, 1, 1, global.palettetexture)
    if (sprite_index != spr_taxitransition_gus)
        pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
    else
        pal_swap_set(3121, obj_player1.paletteselect, 0)
    draw_sprite(sprite_index, image_index, 0, cy)
    pattern_reset()
    reset_shader_fix()
}
draw_set_alpha(fade)
draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_black, c_black, c_black, c_black, 0)
draw_set_alpha(1)
