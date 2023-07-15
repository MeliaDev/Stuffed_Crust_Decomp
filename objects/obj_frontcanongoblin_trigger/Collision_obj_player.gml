var _found = 0
with (obj_frontcanongoblin)
{
    if (state != (89 << 0))
        _found = 1
}
if ((!active) && (!_found))
{
    active = 1
    start = 1
    if (!instance_exists(obj_frontcanongoblin))
        instance_create(x, y, obj_frontcanongoblin)
    else
    {
        with (obj_frontcanongoblin)
        {
            destroyed = 0
            captain_sprite = spr_captaingoblin
            state = (0 << 0)
        }
    }
    with (obj_frontcanongoblin_trigger)
        active = 1
}
else if (!start)
{
    with (obj_frontcanongoblin)
    {
        if (state != (89 << 0) && (!destroyed))
        {
            destroyed = 0
            destroybuffer = 50
            state = (89 << 0)
            captain_sprite = spr_captaingoblin_end
            canon_sprite = spr_captaingoblin_canon
            captain_index = 0
            alarm[0] = -1
        }
    }
}
