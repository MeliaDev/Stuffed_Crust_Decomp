usepalette = 1
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    spr_palette = spr_noisepalette
    shader_set(global.Pal_Shader)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
    pal_swap_set(1425, 5, 0)
    if (stunned && sprite_index == spr_noise_stun)
        draw_sprite_ext(sprite_index, image_index, x, (y + 25), image_xscale, image_yscale, 0, c_white, 1)
    else
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
    if (stunned && sprite_index == spr_noise_stun)
        draw_sprite_ext(sprite_index, image_index, x, (y + 25), image_xscale, image_yscale, 0, c_white, 1)
    else
        draw_self()
    pattern_reset()
    shader_reset()
}
depth = 100
