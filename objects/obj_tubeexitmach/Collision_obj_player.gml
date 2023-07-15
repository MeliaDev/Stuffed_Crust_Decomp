if (playerid > -1)
{
}
if (state != (0 << 0))
{
}
if (other.state == (107 << 0))
{
}
if (other.state == (186 << 0))
{
}
if (other.state == (214 << 0))
{
}
if (other.state == (213 << 0))
{
}
if (other.state == (212 << 0))
{
}
if (object_index != obj_tubeenter && other.state != (150 << 0))
    return;
var _offset_x = (32 * image_xscale)
var _offset_y = (14 * image_yscale)
with (other)
{
    if (other.object_index == obj_tubeenter)
    {
        shot = 0
        if (state != (150 << 0))
        {
            repeat (6)
                create_debris(x, y, 1597, 0)
        }
    }
    state = (150 << 0)
    hsp = 0
    movespeed = 0
    vsp = 0
    tube_vsp = 0
    x = Approach(x, (other.xstart + _offset_x), other.approach_spd)
    y = Approach(y, (other.ystart + _offset_y), other.approach_spd)
    if (y > (other.y + _offset_y))
        tube_vsp = (-other.approach_spd)
}
if (floor(other.x) == (xstart + _offset_x) && floor(other.y) == (ystart + _offset_y))
{
    GamepadSetVibration(0, 0.8, 0.65)
    other.x = (xstart + _offset_x)
    other.y = (ystart + _offset_y)
    image_index = 0
    playerid = other.id
    if (object_index == obj_tubeenter)
        fmod_event_one_shot_3d("event:/sfx/pipe/start", x, y)
    else
        fmod_event_one_shot_3d("event:/sfx/pipe/end", x, y)
    image_speed = 0.5
    other.state = (150 << 0)
    other.tube_vsp = 0
    state = (150 << 0)
}
