if (dynamitehold && dynamitereal)
{
    dynamiteindex += 0.35
    var tntsprite = spr_dynamite
    if (dynamiteholdtimer < 60)
        tntsprite = spr_dynamiteabouttoexplode
    draw_sprite_ext(tntsprite, dynamiteindex, (x + (38 * xscale)), (y - 2), (-xscale), 1, 0, c_white, image_alpha)
}
