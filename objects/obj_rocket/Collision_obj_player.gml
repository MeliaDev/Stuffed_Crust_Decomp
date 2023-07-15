with (other)
{
    if (other.playerid == -4 && state != (184 << 0) && state != (146 << 0) && state != (185 << 0) && state != (186 << 0))
    {
        xscale = other.image_xscale
        state = (184 << 0)
        other.playerid = id
        create_transformation_tip(lang_get_value("rockettip"), "rocket")
        sprite_index = spr_rocketstart
        image_index = 0
        if (movespeed < 8)
            movespeed = 8
        x = other.x
        y = (other.y + 4)
    }
}
