if (state == (230 << 0) && substate == (230 << 0))
{
    if other.flash
        other.flash = 0
    scr_hurtplayer(other)
}
else if ((other.instakillmove || other.state == (42 << 0)) && state == (138 << 0) && savedthrown == thrown && (!savedthrown) && elitehit == 1)
    scr_boss_do_hurt_phase2(other.id)
