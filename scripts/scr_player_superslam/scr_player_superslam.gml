function scr_player_superslam() //scr_player_superslam
{
    if (vsp > 0)
        freefallsmash++
    if (freefallsmash >= 10 && (!instance_exists(superslameffectid)))
    {
        with (instance_create(x, y, obj_superslameffect))
        {
            playerid = other.object_index
            other.superslameffectid = id
        }
    }
    if (sprite_index == spr_piledriver)
    {
        move = (key_left + key_right)
        hsp = (move * movespeed)
        if (move != dir && move != 0)
        {
            dir = move
            movespeed = 0
        }
    }
    else
    {
        move = 0
        hsp = 0
    }
    if (vsp > 0)
    {
        if (punch_afterimage > 0)
            punch_afterimage--
        else
        {
            punch_afterimage = 5
            if (global.blueeffects > 0 && global.blueeffects < 4)
            {
                if (global.blueeffects == 1)
                {
                    with (create_firemouth_afterimage(x, y, sprite_index, image_index, 1))
                    {
                        image_xscale = other.xscale
                        playerid = other.id
                    }
                }
                if (global.blueeffects == 2)
                {
                    with (create_blue_afterimage(x, y, sprite_index, image_index, 1))
                    {
                        image_xscale = other.xscale
                        playerid = other.id
                    }
                }
                if (global.blueeffects == 3)
                {
                    with (create_red_afterimage(x, y, sprite_index, image_index, 1))
                    {
                        image_xscale = other.xscale
                        playerid = other.id
                    }
                }
            }
            else
            {
                with (create_mach3effect(x, y, sprite_index, image_index, 1))
                {
                    image_xscale = other.xscale
                    playerid = other.id
                }
            }
        }
    }
    if (sprite_index == spr_piledriver && vsp >= 0)
    {
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            create_particle((x + irandom_range(-25, 25)), (y + irandom_range(-10, 35)), (1 << 0), 0)
            steppybuffer = 8
        }
        if (vsp > 17)
        {
            if (piledrivereffect > 0)
                piledrivereffect--
            else
            {
                with (instance_create(x, y, obj_parryeffect))
                    sprite_index = spr_piledrivereffect
                piledrivereffect = 15
            }
        }
        vsp += 0.5
    }
    if (grounded && (freefallsmash < 10 || (!(place_meeting(x, (y + vsp), obj_metalblock)))) && (!(place_meeting(x, (y + 1), obj_destructibles))) && sprite_index == spr_piledriver && vsp > 0)
    {
        fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
        fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
        create_particle(x, (y + 3), (14 << 0), 0)
        sprite_index = spr_piledriverland
        jumpAnim = 1
        groundpoundjumpanim = 10
        image_index = 0
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = (40 / room_speed)
        }
        hsp = 0
        bounce = 0
        with (instance_create(x, (y + 35), obj_bangeffect))
            xscale = obj_player.xscale
        create_particle(x, y, (12 << 0), 0)
        freefallstart = 0
        if (freefallsmash >= 10)
        {
            with (obj_baddie)
            {
                if (shakestun && grounded && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0 && (!invincible) && groundpound && state != (4 << 0))
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
    }
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    machslideAnim = 1
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 1
    if (sprite_index == spr_piledriverland)
    {
        if (character == "S" && (key_attack || key_slap))
        {
            if (movespeed < 14)
                movespeed = 14
            vsp = 0
            input_buffer_jump = 0
            if key_attack
            {
                dropdash = 0
                spindashcharge = 0
                if (movespeed >= 10)
                {
                    fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
                    sprite_index = spr_snick_mach3
                    state = (121 << 0)
                }
                else
                {
                    crouchAnim = 1
                    state = (0 << 0)
                    movespeed = 0
                }
            }
            else
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
        }
        else if (floor(image_index) == (image_number - 1))
        {
            vsp = -6
            state = (92 << 0)
        }
    }
    if (move != 0)
    {
        if (movespeed < 6)
            movespeed += 0.5
        else if (floor(movespeed) == 6)
            movespeed = 6
    }
    else
        movespeed = 0
    if (movespeed > 6)
        movespeed -= 0.1
    if (character == "N" && move != 0)
        xscale = move
    if (vsp < 0)
        image_speed = 0.35
    else
        image_speed = 0.5
}

