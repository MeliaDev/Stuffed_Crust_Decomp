if (other.state != (42 << 0) && (!hasgrabbed))
{
    if (other.state != (47 << 0) && other.state != (49 << 0))
        scr_hurtplayer(other)
}
else if (!move)
    event_inherited()
