function scr_player_freefall() //scr_player_freefall
{
    landAnim = 1
    if (vsp >= 2)
    {
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            create_particle((x + irandom_range(-25, 25)), (y + irandom_range(-10, 35)), (1 << 0), 0)
            steppybuffer = 8
        }
        if (vsp > 12)
        {
            if (punch_afterimage > 0)
                punch_afterimage--
            else
            {
                punch_afterimage = 5
                with (create_mach3effect(x, y, sprite_index, image_index, 1))
                {
                    image_xscale = other.xscale
                    playerid = other.id
                    maxmovespeed = 6
                    vertical = 1
                    fadeoutstate = (108 << 0)
                }
            }
            if (piledrivereffect > 0)
                piledrivereffect--
            else
            {
                with (instance_create(x, y, obj_parryeffect))
                    sprite_index = spr_piledrivereffect
                piledrivereffect = 15
            }
        }
        if (sprite_index == spr_mach2jump)
            vsp += 1.75
        else
            vsp += 0.5
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_bodyslamstart)
        sprite_index = spr_bodyslamfall
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_shotgunjump1)
        sprite_index = spr_shotgunjump3
    move = (key_left + key_right)
    if (!grounded)
    {
        if (sprite_index != spr_rockethitwall && sprite_index != spr_player_ratmountwalljump && sprite_index != spr_lonegustavo_groundpound)
            hsp = (move * movespeed)
        else
            hsp = 0
        if (sprite_index == spr_mach2jump)
        {
            if (move != 0 && movespeed < 11)
                movespeed += 0.5
            if (movespeed > 11)
                movespeed -= 0.025
        }
        else
        {
            if (move != 0 && movespeed < 7)
                movespeed += 0.25
            if (movespeed > 7)
                movespeed -= 0.05
        }
        if (move != xscale && momemtum == 1 && movespeed != 0)
            movespeed -= 0.05
        if (movespeed == 0)
            momemtum = 0
        if (move != dir && move != 0)
        {
            dir = move
            movespeed = 0
        }
        if ((move == 0 && momemtum == 0) || scr_solid((x + hsp), y))
        {
            movespeed = 0
            mach2 = 0
        }
        if ((scr_solid((x + 1), y) && move == 1) || (scr_solid((x - 1), y) && move == -1))
            movespeed = 0
        if (move != 0 && sprite_index != spr_poundcancel1)
            xscale = move
    }
    if (vsp > 0)
    {
        freefallsmash++
        if (sprite_index == spr_mach2jump)
            freefallsmash++
    }
    else if (vsp < 0 && sprite_index != spr_rockethitwall)
        freefallsmash = -14
    if (freefallsmash >= 10 && (!instance_exists(superslameffectid)))
    {
        with (instance_create(x, y, obj_superslameffect))
        {
            playerid = other.object_index
            other.superslameffectid = id
        }
    }
    if (grounded && vsp > 0 && (freefallsmash < 10 || (!(place_meeting(x, (y + vsp), obj_metalblock)))) && (!(place_meeting(x, (y + vsp), obj_destructibles))) && (!(place_meeting(x, ((y + vsp) + 6), obj_destructibles))))
    {
        if (scr_slope() && (!isgustavo))
        {
            with (instance_place(x, (y + 1), obj_slope))
            {
                with (other)
                {
                    xscale = (-sign(other.image_xscale))
                    state = (5 << 0)
                    sprite_index = spr_crouchslip
                    if (freefallsmash > 24)
                        movespeed = floor((freefallsmash / 2))
                    else if (freefallsmash > 12)
                        movespeed = 12
                    else
                        movespeed = 8
                    if (movespeed > 24)
                        movespeed = 24
                    with (instance_create(x, y, obj_jumpdust))
                        image_xscale = (-sign(other.image_xscale))
                }
            }
        }
        else
        {
            if (character == "S" && (key_attack || key_slap))
            {
                if (movespeed < 16)
                    movespeed = 16
                vsp = 0
                input_buffer_jump = 0
                if (key_down && (!key_attack))
                {
                    if (!instance_exists(dashcloudid))
                    {
                        with (instance_create((x - (66 * xscale)), y, obj_superdashcloud))
                        {
                            image_xscale = other.xscale
                            other.dashcloudid = id
                        }
                    }
                    particle_set_scale((5 << 0), xscale, 1)
                    create_particle(x, y, (5 << 0), 0)
                    fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
                    sprite_index = spr_snick_dropdash
                    flash = 1
                    state = (5 << 0)
                    image_index = 0
                }
                else
                {
                    dropdash = 0
                    spindashcharge = 0
                    if (movespeed >= 10)
                    {
                        sprite_index = spr_snick_mach3
                        state = (121 << 0)
                    }
                    else
                    {
                        crouchAnim = 1
                        state = (5 << 0)
                    }
                    fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
                }
            }
            else
            {
                if (sprite_index == spr_poundcancel1)
                    sprite_index = spr_poundcancel2
                else if (shotgunAnim == 0)
                    sprite_index = spr_bodyslamland
                else
                    sprite_index = spr_shotgunjump2
                image_index = 0
                state = (111 << 0)
                jumpAnim = 1
                jumpstop = 0
            }
            fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
            freefallstart = 0
            with (obj_camera)
            {
                shake_mag = 5
                shake_mag_acc = (15 / room_speed)
            }
            if (freefallsmash >= 10)
            {
                with (obj_baddie)
                {
                    if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && (!invincible) && groundpound)
                    {
                        state = (138 << 0)
                        if (stunned < 60)
                            stunned = 60
                        vsp = -11
                        image_xscale *= -1
                        hsp = 0
                        momentum = 0
                    }
                }
                with (obj_camera)
                {
                    shake_mag = 10
                    shake_mag_acc = (30 / room_speed)
                }
                combo = 0
                bounce = 0
            }
            create_particle(x, (y + 3), (14 << 0), 0)
        }
    }
    image_speed = 0.35
    if (sprite_index == spr_bodyslamstart || sprite_index == spr_shotgunjump2 || sprite_index == spr_poundcancel1 || sprite_index == spr_poundcancel2)
    {
        if (key_slap || key_slap2)
        {
            vsp = 0
            sprite_index = spr_mach2jump
        }
        image_speed = 0.4
    }
    if (character == "M")
    {
        if (!key_down)
        {
            state = (92 << 0)
            sprite_index = spr_fall
            image_index = 0
        }
    }
}

