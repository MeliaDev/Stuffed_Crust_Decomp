with (obj_player)
{
    if (character != "V")
    {
        if ((state == (38 << 0) || state == (184 << 0)) && (place_meeting((x + hsp), y, other) || place_meeting((x + xscale), y, other)))
            instance_destroy(other)
        with (other)
        {
            if (place_meeting(x, (y + 1), other) || place_meeting(x, (y - 1), other) || place_meeting((x - 1), y, other) || place_meeting((x + 1), y, other))
            {
                if (place_meeting(x, (y - 1), other) && (other.state == (47 << 0) || other.state == (19 << 0)))
                {
                    instance_destroy()
                    tile_layer_delete_at(1, x, y)
                }
            }
        }
    }
}
