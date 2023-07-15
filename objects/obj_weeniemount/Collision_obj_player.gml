with (other)
{
    if (other.buffer <= 0 && state == (42 << 0))
    {
        fmod_event_one_shot_3d("event:/sfx/weenie/start", x, y)
        state = (31 << 0)
        movespeed = hsp
        sprite_index = spr_rideweenie
        xscale = other.image_xscale
        dir = xscale
        jumpstop = 1
        if (vsp < 0)
            vsp = 0
        instance_destroy(other)
        create_transformation_tip(lang_get_value("weenietip"), "weenie")
    }
}
