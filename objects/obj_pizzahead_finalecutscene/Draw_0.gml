shader_set(global.Pal_Shader)
pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
pal_swap_set(707, obj_player1.paletteselect, 0)
draw_self()
pattern_reset()
shader_reset()