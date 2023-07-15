if (state == (108 << 0) || (state == (104 << 0) && attackspeed >= 18) || state == (97 << 0) || (state == (74 << 0) && attackspeed > 0))
{
    if other.flash
        flash = 0
    scr_hurtplayer(other)
}
