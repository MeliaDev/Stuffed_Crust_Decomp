shader_set(global.Pal_Shader)
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
var pal = obj_player1.paletteselect
pal_swap_set(707, pal, 0)
draw_self()
if (pal == 12 && clone)
{
    pal_swap_set(707, 13, 0)
    draw_self()
}
pattern_reset()
shader_reset()
