with (other)
{
    if (state != (211 << 0) && state != (210 << 0) && state != (21 << 0))
    {
        fmod_event_one_shot_3d("event:/sfx/pep/slip", x, y)
        sprite_index = spr_slipbanan1
        other.drop = 1
        vsp = -11
        movespeed += 2
        if (movespeed > 14)
            movespeed = 14
        hsp = (movespeed * xscale)
        image_index = 0
        state = (165 << 0)
    }
    instance_destroy(other)
}
