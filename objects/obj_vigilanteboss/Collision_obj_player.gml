if (state == (102 << 0))
{
    if other.flash
        other.flash = 0
    scr_hurtplayer(other)
}
else if ((state == (269 << 0) || (state == (138 << 0) && savedthrown == thrown && (!savedthrown))) && wastedhits == 4 && phase == 1 && (other.instakillmove || other.state == (42 << 0)))
    scr_vigilante_do_hurt_phase2(other)
