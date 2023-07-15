var accel = 6
if (!finish)
{
    if start
    {
        y = Approach(y, 32, accel)
        with (obj_player)
        {
            if (place_meeting(x, y, obj_grannypizzasign) || place_meeting(x, y, obj_tutorialbook))
            {
                other.finish = 1
                with (obj_transfotip)
                {
                    alarm[1] = -1
                    event_perform(ev_alarm, 1)
                }
            }
        }
        if (!instance_exists(obj_transfotip))
            finish = 1
    }
}
else
{
    var ty = (-((sprite_height + 100)))
    y = Approach(y, ty, accel)
    if (y <= ty)
        instance_destroy()
}
