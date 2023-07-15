if usepalette
{
    shader_set(global.Pal_Shader)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
    pal_swap_set(spr_palette, paletteselect, 0)
    draw_self()
    pattern_reset()
    shader_reset()
}
else
    draw_self()
