for (var yy = 0; yy < abs(image_yscale); yy++)
{
    for (var xx = 0; xx < abs(image_xscale); xx++)
    {
        shader_set(global.Pal_Shader)
        pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
        pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
        draw_sprite_ext(sprite_index, image_index, (xstart + (xx * 32)), (ystart + (yy * 32)), 1, 1, 0, c_white, image_alpha)
        pattern_reset()
        shader_reset()
    }
}
if noisemode
{
    image_index = 1
    if (image_index == 1 && (!obj_player1.ispeppino))
        image_alpha = 0.5
}
else if (!noisemode)
{
    if (image_index == 0 && obj_player1.ispeppino)
        image_alpha = 0.5
}
if (image_alpha == 0.5)
{
    if instance_exists(solidwall)
        instance_destroy(solidwall)
}
