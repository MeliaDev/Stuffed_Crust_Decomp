with (other)
{
    if (vsp > -5)
        vsp = Approach(vsp, -5, 5)
    if (state == (92 << 0))
        sprite_index = spr_machfreefall
    jumpstop = 1
    if (state == (105 << 0) || state == (80 << 0) || state == (61 << 0) || state == (56 << 0) || state == (41 << 0) || state == (23 << 0) || state == (108 << 0) || (state == (5 << 0) && sprite_index != spr_dive))
    {
        state = (92 << 0)
        movespeed = 0
        vsp = -5
        grounded = 0
        if (sprite_index == spr_mach3boost || sprite_index == spr_machslideboost)
            xscale *= -1
        sprite_index = spr_machfreefall
    }
    if (!fmod_event_instance_is_playing(global.snd_ventilator))
        scr_fmod_soundeffect(global.snd_ventilator, x, y)
    else
        fmod_event_instance_set_3d_attributes(global.snd_ventilator, x, y)
}
