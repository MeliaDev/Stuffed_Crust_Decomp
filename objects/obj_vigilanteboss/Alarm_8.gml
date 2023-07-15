alarm[8] = (targetguy_max + irandom(200))
if ((!pizzahead) && state != (274 << 0) && state != (273 << 0) && state != (137 << 0) && (!thrown) && state != (144 << 0) && state != (146 << 0))
{
    with (instance_create(irandom_range(120, (room_width - 120)), -77, obj_targetguy))
        image_xscale = (x > (room_width / 2) ? -1 : 1)
}
