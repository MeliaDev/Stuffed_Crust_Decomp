if (!sprite_exists(sprite_index))
    return;
if (sprite_index != spr_towerending_gustavo && sprite_index != spr_intro_gustavomap && sprite_index != spr_towerending_peppino && sprite_index != spr_towerending_bosses)
    draw_self()
else
{
    shader_set(global.Pal_Shader)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
    if (sprite_index == spr_towerending_gustavo || sprite_index == spr_intro_gustavomap)
        pal_swap_set(3121, obj_player1.paletteselect, 0)
    else
        pal_swap_set(707, obj_player1.paletteselect, 0)
    draw_self()
    pattern_reset()
    shader_reset()
}
