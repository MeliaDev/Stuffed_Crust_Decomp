if (staggerbuffer <= 0 && flickertime <= 0 && (other.state == (42 << 0) || other.instakillmove) && visible && (state == (134 << 0) || (state == (92 << 0) && sprite_index == spr_fakepeppino_bodyslamstart) || (state == (108 << 0) && sprite_index == spr_fakepeppino_bodyslamland) || (state == (104 << 0) && attackspeed < 18) || state == (99 << 0) || (state == (74 << 0) && sprite_index != spr_fakepeppino_flailing)))
{
    if (subhp > 0)
    {
        if (state == (134 << 0))
        {
            state = (155 << 0)
            image_xscale = (-other.xscale)
            hsp = ((-image_xscale) * 20)
            vsp = 0
            sprite_index = spr_fakepeppino_stagger
            image_index = 0
        }
        else
            flashbuffer = 9
        staggerbuffer = 100
        flash = 1
        subhp--
        repeat (4)
            create_debris(x, y, 1531)
    }
    else
    {
        with (obj_fakepephead)
        {
            create_particle(x, y, (9 << 0))
            instance_destroy(id, false)
        }
        state = (138 << 0)
        image_xscale = (-other.xscale)
        hsp = ((-image_xscale) * 8)
        vsp = -6
        thrown = 0
        linethrown = 0
        sprite_index = spr_fakepeppino_vulnerable
        stunned = 200
        flash = 1
        repeat (4)
            create_debris(x, y, 1531)
    }
    with (other)
    {
        fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y)
        state = (91 << 0)
        movespeed = 4
        sprite_index = choose(spr_player_lungehit, spr_player_kungfu1, spr_player_kungfu2, spr_player_kungfu3)
        image_index = 0
    }
}
else if (state == (108 << 0) || (state == (104 << 0) && attackspeed >= 18) || state == (97 << 0) || (state == (74 << 0) && attackspeed > 4))
{
    if other.flash
        flash = 0
    scr_hurtplayer(other)
}
