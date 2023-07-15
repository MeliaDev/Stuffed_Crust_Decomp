if (state != (291 << 0) && other.state != (112 << 0) && other.state != (146 << 0) && other.state != (95 << 0))
{
    notification_push((40 << 0), [room])
    with (other)
    {
        hitX = x
        hitY = y
        state = (291 << 0)
        sprite_index = spr_hurt
        image_speed = 0.35
    }
    fmod_event_one_shot("event:/sfx/pep/johnghost")
    fadein = 0
    state = (291 << 0)
    playerid = other.id
}
