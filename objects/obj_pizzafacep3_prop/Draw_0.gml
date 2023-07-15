if (!usepalette)
{
    if (sprite_index == spr_playerN_panicidle || sprite_index == spr_playerN_hurt)
    {
        shader_set(global.Pal_Shader)
        pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
        if obj_player.ispeppino
            pal_swap_set(1425, 1, 0)
        else
            pal_swap_set(1425, 5, 0)
        draw_self()
        pattern_reset()
        shader_reset()
    }
    else
        draw_self()
}
else
{
    shader_set(global.Pal_Shader)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
    pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
    draw_self()
    pattern_reset()
    shader_reset()
}
