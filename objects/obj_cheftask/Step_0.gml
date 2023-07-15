if (!finish)
{
    if (!instance_exists(previousID))
    {
        var ty = (obj_screensizer.actual_height - 140)
        y = Approach(y, ty, movespeed)
        if (abs((ty - y)) <= 100)
            movespeed = Approach(movespeed, 1, 0.1)
        if (abs((ty - y)) <= 16)
        {
            if (alarm[0] == -1)
                alarm[0] = 100
        }
    }
}
else
{
    ty = (obj_screensizer.actual_height + 200)
    y = Approach(y, ty, movespeed)
    movespeed = Approach(movespeed, 8, 0.2)
    if (y == ty)
        instance_destroy()
}
