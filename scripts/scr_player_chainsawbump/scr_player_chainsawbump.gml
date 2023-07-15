function scr_player_chainsawbump() //scr_player_chainsawbump
{
    move = (key_left + key_right)
    if (hsp != 0 && movespeed < 8)
    {
        if ((floor(image_index) == 4 || floor(image_index) == 11) && steppy == 0 && character != "V")
        {
            instance_create(x, (y + 38), obj_cloudeffect)
            steppy = 1
        }
        if (floor(image_index) != 4 && floor(image_index) != 11)
            steppy = 0
    }
    if (grounded && vsp > 0 && movespeed != 0)
    {
        if (steppybuffer > 0)
        {
            if (movespeed < 3)
                steppybuffer -= 0.5
            else
                steppybuffer--
        }
        else
        {
            create_particle(x, (y + 43), (1 << 0), 0)
            steppybuffer = 12
            if place_meeting(x, y, obj_poodebris)
                fmod_event_one_shot_3d("event:/sfx/pep/stepinshit", x, y)
            else
                fmod_event_one_shot_3d("event:/sfx/pep/step", x, y)
        }
    }
    if (sprite_index == spr_player_chainsawidle || sprite_index == spr_player_chainsaw)
    {
        if (!key_shoot)
            chainsawrev = 0
        if (movespeed > 8)
            movespeed -= 0.15
        else
        {
            if (dir != xscale)
            {
                dir = xscale
                movespeed = 3
                facehurt = 0
            }
            hsp = (move * movespeed)
            if (movespeed < 7)
                movespeed += 0.5
            else if (floor(movespeed) == 8)
                movespeed = 6
            if (key_jump && grounded)
            {
                scr_fmod_soundeffect(jumpsnd, x, y)
                sprite_index = spr_player_chainsaw
                vsp = -9
                image_index = 0
            }
            if (move != 0)
            {
                sprite_index = spr_player_chainsaw
                xscale = move
            }
            else if grounded
            {
                if key_down
                    state = (0 << 0)
                sprite_index = spr_player_chainsawidle
            }
            else
                sprite_index = spr_player_chainsaw
            if (grounded && key_attack)
            {
                if (movespeed < 4)
                    movespeed = 4
                if key_down
                {
                    sprite_index = spr_rollmach
                    state = (5 << 0)
                }
                else if (movespeed >= 12)
                {
                    sprite_index = spr_mach4
                    state = (121 << 0)
                }
                else if (movespeed > 0)
                {
                    state = (104 << 0)
                    if (!grounded)
                        sprite_index = spr_mach2jump
                    else
                        sprite_index = spr_mach1
                }
                else
                    state = (0 << 0)
            }
            if (key_slap2 && sprite_index != spr_player_chainsawswing)
            {
                flash = 1
                if grounded
                {
                    vsp = -3
                    hsp = (8 * xscale)
                }
                else
                {
                    vsp = -5
                    hsp = (9 * xscale)
                }
                fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
                sprite_index = spr_player_chainsawswing
            }
            if (sprite_index == spr_player_chainsaw && (!grounded))
            {
                if key_down
                {
                    vsp = -4
                    sprite_index = spr_player_chainsawpogo1
                    image_index = 0
                    state = (56 << 0)
                }
            }
        }
    }
    else if (sprite_index != spr_player_chainsawend && sprite_index != spr_player_chainsawend2 && sprite_index != spr_player_chainsawrev)
        hsp = (xscale * movespeed)
    if (hsp != 0 && movespeed > 0 && (sprite_index == spr_player_chainsawrev || sprite_index == spr_player_chainsawidle) && grounded)
        movespeed--
    if (sprite_index == spr_player_chainsawidle && move != 0)
        xscale = move
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_chainsawstart)
        sprite_index = spr_player_chainsawrev
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_chainsawrev)
        sprite_index = spr_player_chainsawidle
    if (sprite_index == spr_player_chainsawswing)
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
        if (floor(image_index) == (image_number - 1))
        {
            chainsawrev = 0
            if (!grounded)
                sprite_index = spr_player_chainsawair
            else if (movespeed > 8)
            {
                if (movespeed > 9)
                    sprite_index = spr_player_chainsawdash
                else
                    sprite_index = spr_player_chainsaw
            }
            else if (!move)
                sprite_index = spr_player_chainsawrev
            else
                sprite_index = spr_player_chainsawidle
            image_index = 0
        }
    }
    if ((sprite_index == spr_player_chainsawidle || sprite_index == spr_player_chainsawend || sprite_index == spr_player_chainsawend2) && sprite_index != spr_player_chainsawhit)
    {
        if key_shoot
        {
            movespeed = 0
            chainsawrev += 1.5
            if (chainsawrev > 5)
            {
                if (chainsawrev >= 45)
                {
                    if (chainsawrev >= 85)
                    {
                        with (instance_create(x, y, obj_explosioneffect))
                        {
                            image_speed = 0.5
                            depth = (other.depth - 1)
                            sprite_index = spr_bombexplosion
                        }
                        scr_fmod_soundeffect(global.snd_explosion, x, y)
                        sprite_index = spr_bombpep_end
                        chainsawrev = 0
                        with (obj_camera)
                        {
                            shake_mag = 10
                            shake_mag_acc = (30 / room_speed)
                        }
                    }
                    else if (chainsawrev == 65 || chainsawrev == 80)
                        flash = 1
                    else if (sprite_index != spr_player_chainsawend2)
                    {
                        fmod_event_one_shot_3d("event:/sfx/pep/gotsupertaunt", x, y)
                        flash = 1
                        sprite_index = spr_player_chainsawend2
                    }
                }
                else if (sprite_index != spr_player_chainsawend)
                {
                    flash = 1
                    sprite_index = spr_player_chainsawend
                }
            }
        }
        else if (!key_shoot)
        {
            if (chainsawrev > 5)
            {
                scr_fmod_soundeffect(jumpsnd, x, y)
                if (chainsawrev >= 65)
                    vsp = -12
                else if (chainsawrev >= 45)
                    vsp = -10
                else if (chainsawrev >= 15)
                    vsp = -7
                else
                    vsp = -5
                sprite_index = spr_player_chainsawdashstart
            }
            else if (sprite_index == spr_player_chainsawend || sprite_index == spr_player_chainsawend2)
            {
                chainsawrev = 0
                sprite_index = spr_player_chainsawrev
            }
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_chainsawdashstart)
    {
        fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
        with (instance_create(x, (y + 2), obj_superdashcloud))
            image_xscale = other.xscale
        particle_set_scale((2 << 0), xscale, 1)
        create_particle(x, y, (2 << 0), 0)
        if (chainsawrev >= 15)
        {
            if (!grounded)
                sprite_index = spr_player_chainsawair
            else
            {
                sprite_index = spr_player_chainsawdash
                image_index = 7
            }
            movespeed = (10 + ceil((chainsawrev / 4)))
        }
        else if (movespeed < 12)
        {
            movespeed = 12
            sprite_index = spr_player_chainsawdash
            image_index = 7
        }
    }
    if (sprite_index == spr_player_chainsawdash || sprite_index == spr_player_chainsawair || sprite_index == spr_player_chainsawcrouch || sprite_index == spr_player_chainsawhit)
    {
        if grounded
        {
            if key_down
            {
                sprite_index = spr_player_chainsawcrouch
                movespeed -= 0.05
            }
            else
                sprite_index = spr_player_chainsawdash
            if (movespeed > 9)
            {
                if (!key_shoot)
                    movespeed -= 0.15
                else
                    movespeed -= 0.1
            }
            if (movespeed <= 9)
                sprite_index = spr_player_chainsaw
            if (scr_slope() && hsp != 0 && movespeed < 28 && (key_down || character == "S"))
                scr_player_addslopemomentum(0.25, 0.5)
        }
        if (sprite_index != spr_player_chainsawcrouch && key_slap2 && sprite_index != spr_player_chainsawswing)
        {
            flash = 1
            if grounded
            {
                vsp = -3
                hsp = (8 * xscale)
            }
            else
            {
                vsp = -5
                hsp = (9 * xscale)
            }
            fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
            sprite_index = spr_player_chainsawswing
        }
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
    if (place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + xscale), y, obj_destructibles))))
    {
        if (sprite_index != spr_player_chainsawhitwall && sprite_index != spr_player_chainsawbump && movespeed >= 8)
        {
            chainsawrev = 0
            with (obj_camera)
            {
                shake_mag = 10
                shake_mag_acc = (30 / room_speed)
            }
            if (movespeed >= 22)
            {
                with (instance_create(x, y, obj_explosioneffect))
                {
                    image_speed = 0.5
                    depth = (other.depth - 1)
                    sprite_index = spr_bombexplosion
                }
                scr_fmod_soundeffect(global.snd_explosion, x, y)
                sprite_index = spr_bombpep_end
            }
            else if (movespeed >= 10)
            {
                fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
                sprite_index = spr_player_chainsawhitwall
            }
            else
            {
                fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y)
                sprite_index = spr_player_chainsawbump
            }
            vsp = -6
            movespeed = -4
            image_index = 0
        }
    }
    if (key_jump && grounded)
    {
        if (sprite_index == spr_player_chainsawdash)
        {
            scr_fmod_soundeffect(jumpsnd, x, y)
            vsp = -12
            sprite_index = spr_player_chainsawair
        }
    }
    if (!instance_exists(obj_chainsawpuff))
    {
        if (sprite_index != spr_bombpep_end)
        {
            with (instance_create((x + (12 * xscale)), (y + 28), obj_chainsawpuff))
            {
                if (other.chainsawrev >= 15)
                    image_speed = 0.55
                if (other.chainsawrev >= 25)
                    image_speed = 0.6
                if (other.chainsawrev >= 55)
                    image_speed = 0.65
                if (other.chainsawrev >= 75)
                    image_speed = 0.7
            }
        }
    }
    if (!instance_exists(chainsaweffect))
    {
        with (instance_create((obj_player1.x + random_range(-20, 20)), (obj_player1.y + random_range(-30, obj_fakepeplimb)), obj_parryeffect))
        {
            sprite_index = spr_chainsaweffect
            follow = 1
        }
    }
    else
    {
        with (chainsaweffect)
            depth = (other.depth + 1)
    }
    if (sprite_index == spr_player_chainsawdash)
    {
        image_speed = (0.4 + (movespeed * 0.01))
        if (floor(image_index) == (image_number - 1))
            image_index = 7
    }
    else
        image_speed = 0.4
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_chainsawhit || sprite_index == spr_player_chainsawdash))
    {
        if grounded
            sprite_index = spr_player_chainsawidle
        else
            image_index = (image_number - 1)
    }
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_player_chainsawhitwall || sprite_index == spr_player_chainsawbump))
    {
        if key_attack
        {
            if (movespeed >= 12)
                state = (121 << 0)
            else
            {
                state = (104 << 0)
                sprite_index = spr_mach2jump
            }
        }
        else if (grounded || sprite_index == spr_player_chainsawhitwall)
            sprite_index = spr_player_chainsawidle
        else if (sprite_index == spr_player_chainsawbump)
            image_index = (image_number - 1)
    }
    if (sprite_index == spr_bombpep_end)
    {
        hsp = 0
        movespeed = 0
        if (floor(image_index) == (image_number - 1))
        {
            state = (0 << 0)
            if ((!is_bossroom()) && obj_tv.visible && room != tower_options && room != tower_noisemech && room != editor_room && room != Titlescreen && (!instance_exists(obj_tutorialbook)))
            {
                global.fuel -= 1
                if (global.fuel < 0)
                    global.fuel = 0
                else
                {
                    with (instance_create(x, y, obj_sausageman_dead))
                    {
                        fmod_event_one_shot_3d("event:/sfx/misc/detransfo", x, y)
                        sprite_index = spr_fuelHUD
                        image_xscale = choose(1, -1)
                        image_index = 0
                        image_alpha = 1
                        movespeed = irandom_range(-6, 6)
                    }
                }
            }
        }
    }
    if (sprite_index == spr_player_chainsawcrouch)
        mask_index = spr_crouchmask
    else
        mask_index = spr_player_mask
}

