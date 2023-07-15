if ((!obj_drawcontroller.use_dark) && sprite_index != spr_deadjohnsmoke)
    draw_self()
else if obj_drawcontroller.use_dark
{
    if visible
    {
        var b = get_dark(image_blend, 1)
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, b, image_alpha)
    }
}
