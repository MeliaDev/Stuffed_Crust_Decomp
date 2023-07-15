if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0 && is_bossroom()))
{
    spr_palette = spr_noisepalette
    shader_set(global.Pal_Shader)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
    pal_swap_set(1425, 5, 0)
    draw_self()
    pattern_reset()
    shader_reset()
}
else
{
    spr_palette = spr_noisepalette
    shader_set(global.Pal_Shader)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
    pal_swap_set(1425, 1, 0)
    draw_self()
    pattern_reset()
    shader_reset()
}
