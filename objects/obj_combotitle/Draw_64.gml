if ((!global.option_hud) || (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud)))
    return;
draw_sprite(spr_comboend, 0, x, (y - 36))
for (var i = 0; i < array_length(afterimages); i++)
{
    var b = afterimages[i]
    draw_sprite_ext(b[2], b[3], b[0], b[1], image_xscale, image_yscale, image_angle, image_blend, b[4])
    afterimages[i][4] -= 0.15
}
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1)
if very
    draw_sprite(spr_combovery, 0, (x - 65), (y - 6))
if (very == 2)
    draw_sprite(spr_combovery, 0, (x - 60), (y - 34))
