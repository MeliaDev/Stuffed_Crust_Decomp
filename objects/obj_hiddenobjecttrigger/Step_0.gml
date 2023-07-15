if (place_meeting(x, y, obj_player) && active == 0)
{
    with (obj_hiddenobject)
    {
        if ((!activated) && trigger == other.trigger)
            event_user(0)
    }
    active = 1
    fmod_event_one_shot("event:/sfx/misc/collectgiantpizza")
}
