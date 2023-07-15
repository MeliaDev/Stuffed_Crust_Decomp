with (obj_pizzaball)
    other.primoburg = golfhit[0]
if instance_exists(obj_pizzaball)
    hit = global.golfhit
if (state == (0 << 0))
{
    y = Approach(y, obj_screensizer.actual_height, 5)
    if (!instance_exists(obj_pizzaball))
        state = (89 << 0)
}
else
{
    var ty = (obj_screensizer.actual_height + sprite_height)
    y = Approach(y, ty, 7)
    if instance_exists(obj_pizzaball)
        state = (0 << 0)
    else if (y >= ty)
        instance_destroy()
}
