with (obj_player1)
{
    if (state == (146 << 0) || (state == (262 << 0) && supergrabstate != (6 << 0)))
        other.fade = Approach(other.fade, 0.6, 0.1)
    else
        other.fade = Approach(other.fade, 0, 0.05)
}
