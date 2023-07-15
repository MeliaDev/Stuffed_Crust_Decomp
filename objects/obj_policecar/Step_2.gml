if (gotcha == 1)
{
    fmod_event_one_shot("event:/sfx/misc/taximove")
    fmod_event_one_shot("event:/sfx/misc/policesiren")
    gotcha = 2
}
if (state != (152 << 0))
{
    if (distance_to_object(obj_player1) < 150)
    {
        movespeed = Approach(movespeed, 5, 0.25)
        AMT = Approach(AMT, 55, 0.25)
    }
    else if (distance_to_object(obj_player1) > 500)
    {
        movespeed = Approach(movespeed, 9, 0.25)
        AMT = Approach(AMT, 25, 0.25)
    }
    else
    {
        movespeed = Approach(movespeed, 7, 0.25)
        AMT = Approach(AMT, 45, 0.25)
    }
    LAG_STEPS = Approach(LAG_STEPS, AMT, 5)
    scr_collide()
}
