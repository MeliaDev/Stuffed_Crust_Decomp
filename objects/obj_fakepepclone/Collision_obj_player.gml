if ((state == (108 << 0) && sprite_index != spr_fakepeppino_bodyslamland) || (state == (104 << 0) && attackspeed >= 50) || state == (97 << 0) || (state == (74 << 0) && sprite_index == spr_fakepeppino_flailing))
{
    if other.flash
        flash = 0
    scr_hurtplayer(other)
}
