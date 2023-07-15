with (other)
{
    var f = 10
    var _sound = 0
    if (state == (104 << 0) || state == (121 << 0) || state == (211 << 0) || state == (100 << 0) || state == (42 << 0) || state == (5 << 0))
        _sound = ground_boundtitrle_cardd
    if (hsp != 0 && grounded && vsp > 0)
    {
        if ((floor(image_index) % f) == 0)
            create_debris(x, (y + 43), 4075)
        if _sound
        {
            if (steppybuffer > 0)
                steppybuffer--
            else
            {
                if (state == (100 << 0))
                    steppybuffer = 16
                else
                    steppybuffer = 10
                fmod_event_one_shot_3d("event:/sfx/pep/stepinshit", x, y)
            }
        }
    }
}
