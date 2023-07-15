var state = other.state
var attackspeed = other.attackspeed
if (state == (108 << 0) || (state == (104 << 0) && attackspeed >= 18) || state == (97 << 0) || (state == (74 << 0) && attackspeed > 4))
{
    if (!collisioned)
        event_user(0)
}
