if active
{
    with (other)
    {
        if (isgustavo && brick)
        {
            fmod_event_one_shot_3d("event:/sfx/rat/grabeat", x, y)
            state = (200 << 0)
        }
        else
        {
            fmod_event_one_shot_3d("event:/sfx/rat/grab", x, y)
            state = (207 << 0)
            if isgustavo
                vsp = -7
        }
        movespeed = hsp
        balloonbuffer = 250
    }
    active = 0
    cooldown = 100
    create_transformation_tip(lang_get_value("balloontip"), "balloon")
}
