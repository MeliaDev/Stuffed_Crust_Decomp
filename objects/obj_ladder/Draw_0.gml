if visible
{
    draw_sprite(spr_ladder_top, image_index, x, y)
    draw_sprite(spr_ladder_bottom, image_index, x, (y + ((image_yscale - 1) * 32)))
}
sprite_index = spr
