if place_meeting(x, (y - 1), obj_player)
{
    with (obj_player)
    {
        if (state == (47 << 0))
            state = (38 << 0)
        else if (state != (38 << 0))
            state = (94 << 0)
        if (movespeed < 12)
            movespeed = 12
        sprite_index = spr_slipnslide
        image_speed = 0.35
    }
}
