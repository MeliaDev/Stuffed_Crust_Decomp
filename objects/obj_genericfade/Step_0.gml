if fadein
{
    fade = Approach(fade, maxfade, accel)
    if (fade >= maxfade)
        fadein = 0
}
else
{
    fade = Approach(fade, 0, deccel)
    if (fade <= 0)
        instance_destroy()
}
