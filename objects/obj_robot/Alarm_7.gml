alarm[7] = 10
if (state == (103 << 0) || state == (129 << 0) || state == (91 << 0) || state == (23 << 0))
{
    with (create_red_afterimage(x, y, sprite_index, (image_index - 1), image_xscale))
    {
        if (other.state != (129 << 0) && other.state != (23 << 0))
            playerid = other.id
    }
}
