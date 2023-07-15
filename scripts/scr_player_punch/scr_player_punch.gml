function scr_player_punch() //scr_player_punch
{
    var _breakdance = (sprite_index == spr_player_breakdancesuper || sprite_index == spr_player_breakdancesmash || sprite_index == spr_player_breakdance || sprite_index == spr_player_buttattackend || sprite_index == spr_player_buttattack || sprite_index == spr_player_buttattackstart)
    var _kungfuground = (sprite_index == spr_player_kungfuattackstance || sprite_index == spr_player_kungfu1 || sprite_index == spr_player_slaprun1 || sprite_index == spr_player_slaprun2 || sprite_index == spr_player_kungfu2 || sprite_index == spr_player_kungfu3 || sprite_index == spr_shotgunsuplexdash || sprite_index == spr_player_lungeattack || sprite_index == spr_player_lungehit || sprite_index == spr_player_lungestart)
    var _kungfuair = (sprite_index == spr_fall || sprite_index == spr_player_kungfuair1transition || sprite_index == spr_player_kungfuair2transition || sprite_index == spr_player_kungfuair3transition || sprite_index == spr_player_kungfuair1 || sprite_index == spr_player_kungfuair2 || sprite_index == spr_player_kungfuair3 || sprite_index == spr_player_diagonaldownthrow || sprite_index == spr_player_diagonalupthrow)
    var _Sjumpcancel = (sprite_index == spr_superjumpcancel || sprite_index == spr_player_Sjumpcancelland || sprite_index == spr_player_Sjumpcancelslide)
    var _uppercut = (sprite_index == spr_uppercut || sprite_index == spr_uppercutend)
    if _uppercut
    {
        uppercutbuffer = 1
        move = (key_left + key_right)
        landAnim = 1
        jumpstop = 0
        image_speed = 0.4
        hsp = movespeed
        if (move != 0)
        {
            dir = move
            movespeed = Approach(movespeed, (move * 4), 0.5)
        }
        else
            movespeed = Approach(movespeed, 0, 0.5)
        if (character == "N" || (character == "P" && (!ispeppino)))
        {
            if (key_jump && wallclingcooldown == 10)
            {
                if place_meeting((x + xscale), y, obj_solid)
                {
                    fmod_event_one_shot_3d("event:/sfx/pep/step", x, y)
                    sprite_index = spr_playerN_wallclingstart
                    image_index = 0
                    state = (109 << 0)
                    xscale *= -1
                    vsp = 0
                    doublejump = 0
                }
                else if ((!doublejump) && sprite_index != spr_freefall && sprite_index != spr_facestomp)
                {
                    image_index = 0
                    if (key_up && (!glidemode))
                    {
                        sprite_index = spr_playerN_glide
                        glidemode = 1
                        fmod_event_one_shot_3d("event:/sfx/pep/rampjump", x, y)
                    }
                    else
                    {
                        jumpstop = 0
                        sprite_index = spr_playerN_doublejump
                        doublejump = 1
                        scr_fmod_soundeffect(jumpsnd, x, y)
                        particle_set_scale((4 << 0), xscale, 1)
                        create_particle(x, y, (4 << 0), 0)
                    }
                    if glidemode
                        vsp = -10
                    else if (movespeed > 12)
                        vsp = (-movespeed)
                    else
                        vsp = -16
                    state = (92 << 0)
                    jumpAnim = 1
                    jumpstop = 0
                    if (character == "P")
                        hasjumped = 1
                    if place_meeting(x, (y + 1), obj_railparent)
                        railmomentum = 1
                    uppercutbuffer = 1
                    freefallstart = 0
                }
            }
            if (doublejump == 1)
            {
                if (sprite_index == spr_playerN_doublejump && floor(image_index) == (image_number - 1))
                    sprite_index = spr_playerN_doublejumpfall
                if (sprite_index == spr_playerN_doublejumpfall && floor(image_index) == (image_number - 1))
                    image_index = 0
            }
        }
        if (scr_check_groundpound() && (!grounded))
        {
            groundpoundjumpanim = 10
            state = (108 << 0)
            freefallsmash = 0
            vsp = 14
            sprite_index = spr_bodyslamstart
        }
        else if key_slap2
        {
            if (character == "V")
            {
                if grounded
                    vsp = -3
                else
                    vsp = -5
                if (move != 0)
                    xscale = move
                state = (1 << 0)
                image_index = 0
                sprite_index = spr_playerV_airrevolver
                image_index = 0
                with (instance_create((x + (xscale * 20)), (y + 20), obj_shotgunbullet))
                {
                    is_solid = 0
                    sprite_index = spr_cheesebullet
                    image_xscale = other.xscale
                }
                fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
            }
            else if cangrab
            {
                input_buffer_slap = 0
                if shotgunAnim
                    sprite_index = spr_shotgunsuplexdash
                else
                    sprite_index = spr_suplexdash
                angle = 0
                suplexmove = 1
                particle_set_scale((5 << 0), xscale, 1)
                create_particle(x, y, (5 << 0), 0)
                fmod_event_instance_play(suplexdashsnd)
                if (move != 0)
                    xscale = move
                movespeed = 8
                state = (42 << 0)
                image_index = 0
            }
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == spr_uppercut)
            sprite_index = spr_uppercutend
        if (grounded && vsp > 0 && (sprite_index == spr_uppercut || sprite_index == spr_uppercutend))
        {
            if (hsp != 0)
            {
                dir = sign(hsp)
                xscale = dir
            }
            movespeed = abs(movespeed)
            state = (0 << 0)
        }
    }
    else
    {
        switch character
        {
            case "P":
            case "N":
                move = (key_left + key_right)
                landAnim = 1
                jumpstop = 0
                image_speed = 0.4
                if (breakdance > 0)
                    breakdance--
                if (move != 0)
                {
                    if (move != xscale && movespeed > -6)
                    {
                        if (sprite_index != spr_player_kungfujump)
                            movespeed -= 1
                        else
                            movespeed -= 0.1
                    }
                    else if (move == xscale && movespeed < 6 && sprite_index == spr_player_kungfujump)
                        movespeed += 0.2
                }
                hsp = (xscale * movespeed)
                if (sprite_index == spr_playerN_spin)
                {
                    if (movespeed > 0)
                        movespeed -= 0.2
                    if (key_attack && floor(image_index) == (image_number - 1))
                    {
                        if (movespeed < 0)
                            movespeed = 0
                        if (move != 0)
                            xscale = move
                        if (character == "N")
                        {
                            sprite_index = spr_playerN_pogostart
                            image_index = 0
                            state = (58 << 0)
                            pogospeed = movespeed
                        }
                        else if (movespeed >= 12)
                        {
                            sprite_index = spr_mach4
                            state = (121 << 0)
                        }
                        else if (movespeed > 0)
                        {
                            sprite_index = spr_mach1
                            state = (104 << 0)
                        }
                        else
                            state = (0 << 0)
                    }
                }
                if (key_down && fightball == 0 && (!grounded) && sprite_index != spr_dashpadmach)
                {
                    particle_set_scale((5 << 0), xscale, 1)
                    create_particle(x, y, (5 << 0), 0)
                    flash = 0
                    state = (5 << 0)
                    image_index = 0
                    vsp = 10
                    fmod_event_one_shot_3d("event:/sfx/pep/dive", x, y)
                    sprite_index = spr_dive
                }
                if _breakdance
                {
                    if (!instance_exists(obj_beatbox))
                    {
                        if (!instance_exists(obj_genericpoofeffect))
                            instance_create(x, y, obj_genericpoofeffect)
                        with (instance_create(x, y, obj_beatbox))
                            vsp = -11
                    }
                    notecreate--
                    if (notecreate <= 0 && (!shotgunAnim))
                    {
                        instance_create((x + random_range(-70, 70)), (y + random_range(-70, obj_afterimagecontroller)), obj_notes)
                        notecreate = 20
                    }
                    if (sprite_index == spr_player_breakdancesuper)
                        image_speed = (movespeed / 26)
                    else if (sprite_index != spr_player_breakdancesmash)
                        image_speed = 0.3
                    if (sprite_index == spr_player_breakdance)
                    {
                        if key_down
                            sprite_index = spr_player_breakdancesuper
                        if key_shoot
                            movespeed = Approach(movespeed, ((move * 4) * xscale), 0.5)
                    }
                    if (key_shoot2 && sprite_index != spr_player_buttattack && sprite_index != spr_player_buttattackstart && sprite_index != spr_player_buttattackend)
                    {
                        fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
                        fmod_event_one_shot_3d("event:/sfx/misc/breakdance", x, y)
                        sprite_index = spr_player_buttattackstart
                        vsp = -6
                        movespeed = 16
                    }
                    if (key_down && input_buffer_slap > 0 && grounded && sprite_index != spr_player_breakdancesmash)
                    {
                        movespeed = 0
                        input_buffer_slap = 0
                        vsp = 0
                        hsp = 0
                        image_index = 0
                        sprite_index = spr_player_breakdancesmash
                        image_speed = 0.15
                    }
                    if (sprite_index == spr_player_breakdancesmash)
                    {
                        move = 0
                        if (floor(image_index) == (image_number - 3))
                        {
                            sprite_index = spr_idle
                            state = (0 << 0)
                            fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
                            with (instance_create(x, (y + 2), obj_explosioneffect))
                            {
                                sprite_index = spr_groundpoundeffect
                                image_speed = 0.4
                            }
                            with (obj_camera)
                            {
                                shake_mag = 10
                                shake_mag_acc = (30 / room_speed)
                            }
                            with (obj_baddie)
                            {
                                if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
                                {
                                    vsp = -7
                                    hsp = 0
                                }
                            }
                        }
                    }
                    if (sprite_index == spr_player_breakdancesuper)
                    {
                        if (key_jump && grounded)
                        {
                            vsp = -8
                            scr_fmod_soundeffect(jumpsnd, x, y)
                        }
                        if key_slap
                        {
                            image_speed = 0.35
                            state = (104 << 0)
                            grav = 0.5
                        }
                        image_speed = 0.25
                        if (movespeed > 15)
                            movespeed = Approach(movespeed, 14, 0.5)
                        else
                            movespeed = 15
                        if ((!key_shoot) && (!key_down))
                            sprite_index = spr_player_breakdance
                    }
                    if (sprite_index == spr_player_buttattackstart && floor(image_index) == (image_number - 1))
                        sprite_index = spr_player_buttattack
                    if (sprite_index == spr_player_buttattack)
                    {
                        if grounded
                            sprite_index = spr_player_buttattackend
                        else
                        {
                            sprite_index = spr_player_buttattack
                            image_index = 0
                        }
                    }
                    if (sprite_index == spr_player_buttattackend)
                    {
                        if (movespeed > 0)
                            movespeed -= 0.25
                        if key_attack
                        {
                            if (movespeed < 0)
                                movespeed = 0
                            if (move != 0)
                                xscale = move
                            if (character == "N")
                            {
                                sprite_index = spr_playerN_pogostart
                                image_index = 0
                                state = (58 << 0)
                                pogospeed = movespeed
                            }
                            else if (movespeed >= 12)
                            {
                                sprite_index = spr_mach4
                                state = (121 << 0)
                            }
                            else if (movespeed > 0)
                            {
                                sprite_index = spr_mach1
                                state = (104 << 0)
                            }
                            else
                                state = (0 << 0)
                        }
                        else if (key_shoot || key_down)
                            sprite_index = spr_player_breakdancesuper
                        else if (grounded && vsp == 0)
                            state = (0 << 0)
                    }
                    if (!key_shoot)
                    {
                        if (movespeed > 0)
                            movespeed -= 0.3
                        else
                            movespeed = 0
                    }
                    if (place_meeting((x + xscale), y, obj_solid) && mask_index == spr_crouchmask)
                        xscale *= -1
                    if ((movespeed == 0 || hsp == 0) && sprite_index != spr_player_breakdancesmash)
                        state = (0 << 0)
                    if (sprite_index == spr_player_breakdancesuper || sprite_index == spr_player_buttattack || sprite_index == spr_player_buttattackstart || sprite_index == spr_player_buttattackend)
                    {
                        if grounded
                        {
                            if (scr_solid((x + 1), y) && xscale == 1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
                            {
                                grav = 0.5
                                movespeed = 0
                                state = (106 << 0)
                                hsp = -2.5
                                vsp = -3
                                mach2 = 0
                                image_index = 0
                                machslideAnim = 1
                                machhitAnim = 0
                                instance_create((x + 10), (y + 10), obj_bumpeffect)
                            }
                            if (scr_solid((x - 1), y) && xscale == -1 && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && (!(place_meeting((x + xscale), y, obj_destructibles))))
                            {
                                grav = 0.5
                                movespeed = 0
                                state = (106 << 0)
                                hsp = 2.5
                                vsp = -3
                                mach2 = 0
                                image_index = 0
                                machslideAnim = 1
                                machhitAnim = 0
                                instance_create((x - 10), (y + 10), obj_bumpeffect)
                            }
                        }
                    }
                }
                if _kungfuground
                {
                    if (grounded && sprite_index != spr_player_kungfuattackstance && (sprite_index == spr_player_kungfuair1transition || sprite_index == spr_player_kungfuair2transition || sprite_index == spr_player_kungfuair3transition || sprite_index == spr_player_diagonaldownthrow || sprite_index == spr_player_diagonalupthrow))
                        randomize_animations([3584, 3242, 3835, 53, 520])
                    else if ((!grounded) && (sprite_index == spr_player_kungfu1 || sprite_index == spr_player_kungfu2 || sprite_index == spr_player_kungfu3 || sprite_index == spr_player_lungeattack || sprite_index == spr_player_lungestart))
                        randomize_animations([1831, 2319, 658, 1010, 1012])
                    if key_jump
                    {
                        if (movespeed < 12 && (state == (97 << 0) || state == (104 << 0) || state == (121 << 0)))
                            movespeed = 13
                        else if (movespeed < 10)
                            movespeed = 10
                        randomize_animations([1831, 2319, 658, 1010, 1012])
                        fmod_event_one_shot_3d("event:/sfx/mort/doublejump", x, y)
                        image_index = 0
                        vsp = -12
                        if (move != 0)
                            xscale = move
                        dir = xscale
                        state = (80 << 0)
                    }
                    if (sprite_index == spr_player_kungfuattackstance)
                    {
                        if (!key_shoot)
                        {
                            sprite_index = spr_idle
                            image_index = 0
                            state = (0 << 0)
                        }
                        else
                        {
                            if key_down
                            {
                                state = (5 << 0)
                                fmod_event_one_shot_3d("event:/sfx/vigilante/slide", x, y)
                                image_index = 0
                                sprite_index = spr_player_Sjumpcancelland
                                if (movespeed < 10)
                                    movespeed = 10
                            }
                            else if (move != 0)
                            {
                                flash = 1
                                if (movespeed < 12 && (state == (97 << 0) || state == (104 << 0) || state == (121 << 0)))
                                    movespeed = 13
                                else if (movespeed < 10)
                                    movespeed = 10
                                if grounded
                                {
                                    fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
                                    randomize_animations([3584, 3242, 3835, 53, 520])
                                }
                                else
                                {
                                    fmod_event_one_shot_3d("event:/sfx/mort/down", x, y)
                                    randomize_animations([1831, 2319, 658, 1010, 1012])
                                }
                                image_index = 0
                                xscale = move
                                dir = xscale
                                state = (80 << 0)
                            }
                            else
                            {
                                movespeed = Approach(movespeed, 0, 0.5)
                                scr_create_parryhitbox()
                            }
                            if (floor(image_index) == (image_number - 1))
                                image_index = (image_number - 1)
                        }
                    }
                    else
                    {
                        if (floor(image_index) == (image_number - 1) && (!key_attack) && movespeed > 0)
                            movespeed -= 0.6
                        if (key_down && grounded)
                        {
                            state = (5 << 0)
                            fmod_event_one_shot_3d("event:/sfx/vigilante/slide", x, y)
                            image_index = 0
                            sprite_index = spr_player_Sjumpcancelland
                            if (movespeed < 12)
                                movespeed = 12
                        }
                        if (floor(image_index) >= (image_number - (image_number / 4)))
                        {
                            if ((!(place_meeting((x + xscale), y, obj_solid))) || place_meeting((x + xscale), y, obj_destructibles))
                            {
                                if key_attack
                                {
                                    if (movespeed < 0)
                                        movespeed = 0
                                    if (move != 0)
                                        xscale = move
                                    if (character == "N")
                                    {
                                        sprite_index = spr_playerN_pogostart
                                        image_index = 0
                                        state = (58 << 0)
                                        pogospeed = movespeed
                                    }
                                    else if (movespeed >= 12)
                                    {
                                        sprite_index = spr_mach4
                                        state = (121 << 0)
                                    }
                                    else if (movespeed > 0)
                                    {
                                        sprite_index = spr_mach1
                                        state = (104 << 0)
                                    }
                                    else
                                        state = (0 << 0)
                                }
                                else if (key_shoot && move == 0)
                                {
                                    if (move != 0)
                                        xscale = move
                                    sprite_index = spr_player_kungfuattackstance
                                    state = (80 << 0)
                                    image_index = 0
                                }
                                else
                                {
                                    sprite_index = spr_idle
                                    image_index = 0
                                    state = (0 << 0)
                                }
                            }
                        }
                    }
                }
                if (floor(image_index) == (image_number - 1))
                {
                    switch sprite_index
                    {
                        case spr_player_kungfu1:
                        case 3242:
                        case 3835:
                        case 53:
                        case 520:
                        case 3714:
                        case 747:
                        case 748:
                        case spr_shotgunsuplexdash:
                            state = (0 << 0)
                            if (move != xscale && move != 0)
                                movespeed = 2
                            break
                        case 1831:
                            sprite_index = spr_player_kungfuair1
                            break
                        case 2319:
                            sprite_index = spr_player_kungfuair2
                            break
                        case 658:
                            sprite_index = spr_player_kungfuair3
                            break
                        case 1010:
                            image_index = (image_number - 1)
                            break
                        case 1012:
                            sprite_index = spr_fall
                            image_index = 0
                            break
                        case 1437:
                        case 209:
                            if ispeppino
                                sprite_index = spr_player_Sjumpcancelslide
                            else
                                sprite_index = spr_playerN_jetpackslide
                            break
                    }

                }
                if ((!_kungfuground) && (!_Sjumpcancel) && (!_breakdance))
                {
                    if (grounded && vsp >= 0)
                    {
                        if key_attack
                        {
                            if (movespeed < 0)
                                movespeed = 0
                            if (move != 0)
                                xscale = move
                            if (character == "N")
                            {
                                sprite_index = spr_playerN_pogostart
                                image_index = 0
                                state = (58 << 0)
                                pogospeed = movespeed
                            }
                            else if (movespeed >= 12)
                            {
                                sprite_index = spr_mach4
                                state = (121 << 0)
                            }
                            else if (movespeed > 0)
                            {
                                sprite_index = spr_mach1
                                state = (104 << 0)
                            }
                            else
                                state = (0 << 0)
                        }
                        else
                            state = (0 << 0)
                    }
                }
                if _Sjumpcancel
                {
                    if (grounded && vsp > 0)
                    {
                        if (sprite_index == spr_player_Sjumpcancel || sprite_index == spr_playerN_jetpackstart)
                        {
                            if ispeppino
                                sprite_index = spr_player_Sjumpcancelland
                            else
                                sprite_index = spr_playerN_jetpackslide
                            image_index = 0
                        }
                        if key_attack
                        {
                            if (movespeed < 0)
                                movespeed = 0
                            if (move != 0)
                                xscale = move
                            if (character == "N")
                            {
                                sprite_index = spr_playerN_pogostart
                                image_index = 0
                                state = (58 << 0)
                                pogospeed = movespeed
                            }
                            else if (movespeed >= 12)
                            {
                                sprite_index = spr_mach4
                                state = (121 << 0)
                            }
                            else if (movespeed > 0)
                            {
                                sprite_index = spr_mach1
                                state = (104 << 0)
                            }
                            else
                                state = (0 << 0)
                        }
                        else if (movespeed > 6)
                        {
                            state = (105 << 0)
                            sprite_index = spr_machslidestart
                            image_index = 0
                        }
                        else
                            state = (0 << 0)
                    }
                    if (sprite_index == spr_player_Sjumpcancelslide || sprite_index == spr_playerN_jetpackslide)
                        image_speed = (abs(movespeed) / 15)
                }
                if (sprite_index != spr_player_kungfujump && place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + xscale), y, obj_destructibles))) && (!(place_meeting((x + xscale), y, obj_slope))))
                {
                    vsp = -4
                    if ispeppino
                        sprite_index = spr_player_kungfujump
                    image_index = 0
                    state = (80 << 0)
                    movespeed = -6
                }
                if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
                {
                    with (instance_create(x, y, obj_dashcloud2))
                        image_xscale = other.xscale
                }
                break
        }

    }
    if (sprite_index == spr_playerN_spin || _Sjumpcancel || _breakdance || _uppercut || ((_kungfuair || _kungfuground) && sprite_index != spr_player_kungfuattackstance))
    {
        if (key_slap2 && key_up && uppercutbuffer == 0)
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
}

