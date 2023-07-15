if (spr_intro == spr_noisebomb_intro)
{
    shader_set(global.Pal_Shader)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
    pal_swap_set(1425, obj_player1.paletteselect, 0)
    draw_self()
    pattern_reset()
    shader_reset()
}
else
    draw_self()
if (showtext > 0)
    draw_sprite(spr_pizzasona_thankyou, image_index, x, (y - 15))
