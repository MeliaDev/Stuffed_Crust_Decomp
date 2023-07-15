if (state == (8 << 0))
{
    var ty = (obj_screensizer.actual_height / 2)
    y -= movespeed
    if (abs((y - ty)) < 200)
        movespeed = Approach(movespeed, 1, 0.05)
    if (abs((y - ty)) < 16)
    {
        y = ty
        state = (0 << 0)
    }
}
else if (state == (135 << 0))
{
    y += movespeed
    movespeed = Approach(movespeed, 8, 2)
    if (y > (obj_screensizer.actual_height + sprite_height))
        instance_destroy()
}
else if (collect > 0)
{
    if (alarm[0] == -1)
        alarm[0] = 5
}
else
{
    state = (135 << 0)
    movespeed = -2
}
