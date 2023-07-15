with (obj_player1)
{
    if (shotgunAnim == 1)
    {
        var spr = sprite_get_name(sprite_index)
        if (string_pos("gun", spr) != 0 || state == (5 << 0))
            other.visible = false
        else
            other.visible = true
    }
    else
        other.visible = false
    other.x = (x - (14 * xscale))
    other.y = (y + 9)
    other.image_xscale = xscale
    other.image_yscale = -1
    other.depth = (depth + 1)
}
if (room == rank_room)
    instance_destroy()
