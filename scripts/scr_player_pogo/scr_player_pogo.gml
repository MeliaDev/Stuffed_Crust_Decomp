function scr_player_pogo() //scr_player_pogo
{
    move = (key_left + key_right)
    if (move == 0 && hsp != 0)
        hsp = (xscale * movespeed)
    else
        hsp = (move * movespeed)
    if (move != 0 && (!(scr_solid(x, (y + 1)))))
    {
        if (movespeed < 6)
            movespeed += 0.5
    }
    if (move != xscale || move == 0 || place_meeting((x + xscale), y, obj_solid))
    {
        movespeed = 0
        pogospeed = 6
    }
    if (sign(hsp) != 0)
        xscale = sign(hsp)
    else if (move != 0)
        xscale = move
    if (move != xscale)
        pogospeed = 6
    if (grounded && (!key_slap2) && sprite_index != spr_playerN_pogobounce && sprite_index != spr_playerN_pogobouncemach)
    {
        pogospeedprev = 0
        image_index = 0
        movespeed = 0
        vsp = 0
        if (pogochargeactive == 1)
            sprite_index = spr_playerN_pogobouncemach
        else
            sprite_index = spr_playerN_pogobounce
        with (instance_create(x, (y + 6), obj_explosioneffect))
            sprite_index = spr_pogoeffect
    }
    if (floor(image_index) == 3 && pogospeedprev == 0 && (sprite_index == spr_playerN_pogobounce || sprite_index == spr_playerN_pogobouncemach))
    {
        if key_jump2
            vsp = -12
        else if key_down
            vsp = -3
        else
            vsp = -5
        if key_up
            vsp -= 2
        fmod_event_one_shot_3d("event:/sfx/noise/pogo", x, y)
        if (move == xscale)
        {
            if (movespeed < 12)
                pogospeed += 4
            else
                pogospeed += 2
        }
        if (move == (-xscale) && movespeed > 0)
            pogospeed = 6
        movespeed = pogospeed
        pogospeedprev = 1
    }
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_playerN_pogobounce || sprite_index == spr_playerN_pogofallmach || sprite_index == spr_playerN_pogobouncemach || sprite_index == spr_playerN_pogostart))
    {
        if (pogochargeactive == 1)
            sprite_index = spr_playerN_pogofallmach
        else
            sprite_index = spr_playerN_pogofall
    }
    if (((!grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock)))) || (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope)))
    {
        wallspeed = pogospeed
        grabclimbbuffer = 0
        if (movespeed < 1)
            wallspeed = 1
        else
            pogospeed = wallspeed
        state = (37 << 0)
    }
    if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_climbablewall) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))))
    {
        wallspeed = pogospeed
        grabclimbbuffer = 0
        state = (37 << 0)
    }
    if (pogospeed > 12)
    {
        if (pogochargeactive == 0)
        {
            with (instance_create(x, y, obj_tauntafterimage))
                vspeed = 20
            with (instance_create(x, y, obj_tauntafterimage))
                vspeed = -20
            flash = 1
        }
        pogochargeactive = 1
        pogocharge = 100
    }
    if (input_buffer_slap > 0 && (!key_up) && sprite_index != spr_dashpadmach && cangrab)
    {
        input_buffer_slap = 0
        if shotgunAnim
            sprite_index = spr_shotgunsuplexdash
        else
            sprite_index = spr_suplexdash
        suplexmove = 1
        fmod_event_instance_play(suplexdashsnd)
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        state = (42 << 0)
        if (movespeed < 5)
            movespeed = 5
        image_index = 0
    }
    else if ((key_slap || key_slap2) && key_up && sprite_index != spr_dashpadmach)
    {
        input_buffer_slap = 0
        state = (80 << 0)
        image_index = 0
        if grounded
            vsp = -16
        else
            vsp = -12
        sprite_index = spr_uppercut
        fmod_event_instance_play(snd_uppercut)
        movespeed = hsp
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
    else if ((pogochargeactive || pizzapepper > 0) && (key_attack2 || key_superjump2))
    {
        hsp = 0
        vsp = 0
        image_index = 0
        state = (99 << 0)
        sprite_index = ((!key_up) ? spr_superjumpcancelstart : spr_superjumpprep)
    }
    if (!key_attack)
    {
        if (!grounded)
        {
            if (pogospeed > 12)
            {
                if (key_down || key_down2)
                {
                    vsp = 10
                    state = (5 << 0)
                    fmod_event_one_shot_3d("event:/sfx/pep/dive", x, y)
                    sprite_index = spr_dive
                }
            }
            else if scr_check_groundpound()
            {
                groundpoundjumpanim = 10
                state = (108 << 0)
                freefallsmash = 12
                vsp = 14
                sprite_index = spr_bodyslamfall
            }
        }
        else
            state = (0 << 0)
    }
    image_speed = 0.35
    scr_dotaunt()
}

