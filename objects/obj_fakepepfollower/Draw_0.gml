shader_set(global.Pal_Shader)
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
    pal_swap_set(707, 1, 0)
else
    pal_swap_set(707, obj_player1.paletteselect, 0)
draw_self()
pattern_reset()
shader_reset()
