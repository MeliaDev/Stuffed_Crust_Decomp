if (other.tube_id == id)
{
}
if (other.state == (107 << 0))
{
}
if (other.state == (186 << 0))
    return;
var _offset_x = (32 * image_xscale)
var _offset_y = (14 * image_yscale)
with (other)
{
    if (other.stored_spd == 0)
    {
    }
    hsp = 0
    vsp = 0
    movespeed = 0
    tube_vsp = 0
    state = (150 << 0)
    x = Approach(x, (other.x + _offset_x), other.approach_spd)
    y = Approach(y, (other.y + _offset_y), other.approach_spd)
}
if (floor(other.x) == (x + _offset_x) && floor(other.y) == (y + _offset_y))
{
    GamepadSetVibration(0, 0.8, 0.65)
    other.state = (150 << 0)
    other.tube_id = id
    other.hsp = (hsp * movespeed)
    other.vsp = (vsp * movespeed)
    other.tube_vsp = (vsp * movespeed)
    stored_spd = 0
    fmod_event_one_shot_3d("event:/sfx/pipe/bump", x, y)
    trace("hsp: ", other.hsp, " vsp: ", other.vsp)
}
