function state_player_normal() //state_player_normal
{
    mach2 = 0
    move = (key_left + key_right)
    skateboarding = 0
    momemtum = 0
    homingattack = 0
    homingattackfall = 0
    jumpstop = 0
    dropdash = 0
    spindashcharge = 0
    chainsawrev = 0
    if isgustavo
        state = (191 << 0)
    if (dir != xscale)
    {
        dir = xscale
        if (hasjumped && sprite_index != spr_jump && sprite_index != spr_fall)
            movespeed = 3
        else
            movespeed = 2
        facehurt = 0
    }
    if key_taunt2
    {
        input_finisher_buffer = 60
        input_attack_buffer = 0
        input_up_buffer = 0
        input_down_buffer = 0
    }
    var idlespr = spr_idle
    var movespr = spr_move
    if (sprite_index != spr_dab)
    {
        if (gamepad_button_value(0, gp_shoulderlb) != 0 && move == 0)
        {
            idle = 0
            image_index = 0
            sprite_index = spr_dab
        }
    }
    else
    {
        image_speed = 0
        movespeed = 0
        move = 0
        vsp = 0
        hsp = 0
        image_index = (gamepad_button_value(0, gp_shoulderlb) * image_number)
        if (gamepad_button_value(0, gp_shoulderlb) == 0)
            sprite_index = idlespr
    }
    if (hasjumped == 1 && character == "P")
    {
        if ispeppino
        {
            movespr = spr_player_running
            if ((global.combo >= 25 && global.combo < 50) || instance_exists(obj_pizzafaceboss) || (global.noisejetpack && ispeppino) || global.panic)
                movespr = spr_player_charge
        }
        else
        {
            movespr = spr_noisepushrock
            if ((global.combo >= 25 && global.combo < 50) || instance_exists(obj_pizzafaceboss) || (global.noisejetpack && ispeppino) || global.panic)
                movespr = spr_playerN_charge
        }
    }
    else
        movespr = spr_move
    if (global.leveltosave == "freezer" && (!global.noisejetpack))
    {
        if (character == "P" && ispeppino)
            idlespr = spr_player_freezeridle
    }
    if global.pistol
    {
        idlespr = spr_player_pistolidle
        movespr = spr_player_pistolwalk
    }
    if (room == tower_soundtest && obj_soundtest.play)
    {
        if (character == "V")
        {
            idlespr = spr_playerV_panic
            movespr = spr_playerV_panic
        }
        else if (character == "P" && ispeppino)
        {
            idlespr = spr_pepdance
            movespr = spr_pepdance
        }
        else if ((character == "P" && (!ispeppino)) || character == "N")
        {
            idlespr = spr_playerN_panicidle
            movespr = spr_playerN_panicidle
        }
        idle = 0
    }
    var breakdance_max = 10
    if (key_taunt && (!shotgunAnim) && (!global.pistol))
        breakdance_pressed++
    else
        breakdance_pressed = 0
    if (sprite_index == spr_player_breakdance || sprite_index == spr_noise_vulnerable2)
    {
        if (breakdance_pressed >= breakdance_max && (!shotgunAnim))
            breakdance_speed = Approach(breakdance_speed, 0.6, 0.005)
        else
            breakdance_speed = 0.25
        if (breakdance_speed >= 0.5)
        {
            if (!instance_exists(obj_beatbox))
            {
                if (!instance_exists(obj_genericpoofeffect))
                    instance_create(x, y, obj_genericpoofeffect)
                with (instance_create(x, y, obj_beatbox))
                    vsp = -11
            }
            notecreate--
        }
    }
    if (notecreate <= 0 && (!shotgunAnim))
    {
        instance_create((x + random_range(-70, 70)), (y + random_range(-70, obj_afterimagecontroller)), obj_notes)
        notecreate = 10
    }
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
        railmomentum = 1
    }
    hsp = ((move * movespeed) + (railmovespeed * raildir))
    if (sprite_index != spr_dab)
    {
        if (move != 0)
        {
            xscale = move
            if (hasjumped && sprite_index != spr_jump && sprite_index != spr_fall)
            {
                if (movespeed < 9)
                    movespeed += 0.5
                else if (floor(movespeed) == 10)
                    movespeed = 7
            }
            else if (movespeed < 7)
                movespeed += 0.5
            else if (floor(movespeed) == 8)
                movespeed = 6
            if (movespeed < 3 && move != 0)
                image_speed = 0.35
            else if (movespeed > 3 && movespeed < 6)
                image_speed = 0.45
            else
                image_speed = 0.6
            if (groundpoundjumpanim > 0)
            {
                if ((character == "P" && (!ispeppino)) || character == "N")
                    groundpoundjumpanim -= 0.25
                else
                    groundpoundjumpanim -= 0.5
            }
            else
                groundpoundjumpanim = 0
            if ((!machslideAnim) && (!landAnim))
            {
                machslideAnim = 0
                idle = 0
                facehurt = 0
                if (!shotgunAnim)
                {
                    if shoot
                        sprite_index = spr_pistolwalk
                    else if mort
                        sprite_index = spr_player_mortwalk
                    else if (breakdance_pressed >= breakdance_max)
                    {
                        if (!scr_slope())
                            angle = 0
                        if ((character == "P" && ispeppino) || character == "N")
                            sprite_index = spr_player_breakdance
                        else if ((character == "P" && (!ispeppino)) || character == "N")
                            sprite_index = spr_noise_vulnerable2
                    }
                    else if (global.fill <= 0 && (!instance_exists(obj_ghostcollectibles)))
                        sprite_index = spr_hurtwalk
                    else if (global.stylethreshold == 3 || (global.combo >= 25 && global.combo < 50) || instance_exists(obj_pizzafaceboss) || (global.noisejetpack && ispeppino))
                    {
                        sprite_index = spr_3hpwalk
                        if (hasjumped == 1 && character == "P")
                        {
                            if ispeppino
                                sprite_index = spr_player_charge
                            else
                                sprite_index = spr_playerN_charge
                        }
                    }
                    else if (global.stylethreshold == 4 || global.combo >= 50 || instance_exists(obj_pizzaface_thunderdark) || (global.lap != 0 && global.fill > 0) || (global.noisejetpack && (!ispeppino)))
                        sprite_index = spr_ragemove
                    else
                        sprite_index = movespr
                }
            }
            if (scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))) && xscale == move && (!(place_meeting(x, (y + 1), obj_slope))))
                movespeed = 0
            if (move != 0 && grounded && vsp > 0)
            {
                if (steppybuffer > 0)
                {
                    if (movespeed < 3)
                        steppybuffer -= 0.5
                    else
                        steppybuffer--
                }
                else if (sprite_index != spr_player_breakdance && sprite_index != spr_noise_vulnerable2 && sprite_index != spr_pepdance)
                {
                    create_particle(x, (y + 43), (1 << 0), 0)
                    steppybuffer = 12
                    if place_meeting(x, y, obj_poodebris)
                        fmod_event_one_shot_3d("event:/sfx/pep/stepinshit", x, y)
                    else
                        fmod_event_one_shot_3d("event:/sfx/pep/step", x, y)
                }
            }
        }
        else
        {
            if (groundpoundjumpanim > 0)
            {
                if ((character == "P" && (!ispeppino)) || character == "N")
                    groundpoundjumpanim -= 0.5
                else
                    groundpoundjumpanim -= 0.75
            }
            else
                groundpoundjumpanim = 0
            steppybuffer = 12
            if (sprite_index == spr_player_breakdance || sprite_index == spr_noise_vulnerable2)
                image_speed = breakdance_speed
            else
                image_speed = 0.35
            movespeed = 0
            if ((!machslideAnim) && (!landAnim))
            {
                if (character == "P" && ispeppino)
                {
                    if key_up
                    {
                        idle = 0
                        idlespr = spr_player_Sjumpprep
                        if ((idlespr == spr_player_Sjumpprep || sprite_index == spr_player_Sjumpprep) && floor(image_index) == (image_number - 1))
                            image_index = (image_number - 2)
                    }
                }
                if (idle < 400 && breakdance_pressed < breakdance_max)
                    idle++
                if (idle > 40)
                    groundpoundjumpanim = 0
                if (idle > 10)
                    hasjumped = 0
                if (idle >= 150 && breakdance_pressed < breakdance_max && (!shotgunAnim))
                {
                    if (sprite_index != idlespr && floor(image_index) == (image_number - 1))
                    {
                        facehurt = 0
                        idle = 0
                    }
                    if ((!global.pistol) && (!shotgunAnim) && sprite_index != spr_idle1 && sprite_index != spr_idle2 && sprite_index != spr_idle3 && sprite_index != spr_idle4 && sprite_index != spr_idle5 && sprite_index != spr_idle6 && sprite_index != spr_player_idlevomit && sprite_index != spr_player_idlevomitblood)
                    {
                        idleanim = random_range(0, 100)
                        if (irandom(100) <= 25)
                        {
                            if (character == "V")
                                fmod_event_one_shot_3d("event:/sfx/voice/vigiangry", x, y)
                            else if (character == "P" && ispeppino)
                                fmod_event_one_shot_3d("event:/sfx/voice/myea", x, y)
                            else if ((character == "P" && (!ispeppino)) || character == "N")
                                fmod_event_one_shot_3d("event:/sfx/voice/noisepositive", x, y)
                        }
                        if (!scr_slope())
                            angle = 0
                        image_index = 0
                        if (idleanim <= 16)
                            sprite_index = spr_idle1
                        else if (idleanim > 16 && idleanim <= 32)
                            sprite_index = spr_idle2
                        else if (idleanim > 32 && idleanim <= 48)
                            sprite_index = spr_idle3
                        else if (idleanim > 48 && idleanim <= 64)
                            sprite_index = spr_idle4
                        else if (idleanim > 64 && idleanim <= 80)
                            sprite_index = spr_idle5
                        else
                            sprite_index = spr_idle6
                        if ispeppino
                        {
                            if (global.vomitamt > 10)
                            {
                                global.vomitamt = 0
                                sprite_index = choose(spr_player_idlevomit, spr_player_idlevomitblood)
                            }
                        }
                        groundpoundjumpanim = 0
                    }
                }
                else if (!facehurt)
                {
                    if (windingAnim < 1800 || angry || global.playerhealth == 1 || shoot)
                    {
                        start_running = 1
                        movespeed = 0
                        windingAnim = 0
                        if shoot
                            sprite_index = spr_player_pistolidle
                        else if mort
                            sprite_index = spr_player_mortidle
                        else if (breakdance_pressed >= breakdance_max)
                        {
                            if (character == "P" && ispeppino)
                                sprite_index = spr_player_breakdance
                            else if ((character == "P" && (!ispeppino)) || character == "N")
                                sprite_index = spr_noise_vulnerable2
                            if (!scr_slope())
                                angle = 0
                        }
                        else if (global.fill <= 0 && (!instance_exists(obj_ghostcollectibles)))
                            sprite_index = spr_hurtidle
                        else if (global.panic && (!instance_exists(obj_ghostcollectibles)))
                            sprite_index = spr_panic
                        else if (global.stylethreshold == 3 || (global.combo >= 25 && global.combo < 50) || instance_exists(obj_pizzafaceboss) || (global.noisejetpack && ispeppino))
                            sprite_index = spr_3hpidle
                        else if (global.stylethreshold == 4 || global.combo >= 50 || instance_exists(obj_pizzaface_thunderdark) || (global.lap != 0 && global.fill > 0) || (global.noisejetpack && (!ispeppino)))
                            sprite_index = spr_rageidle
                        else
                            sprite_index = idlespr
                    }
                    else
                    {
                        idle = 0
                        if (character != "S")
                        {
                            if (windingAnim >= 0)
                                windingAnim -= 2
                            else
                                windingAnim = 0
                            sprite_index = spr_winding
                        }
                        else
                        {
                            windingAnim = 0
                            sprite_index = idlespr
                        }
                        if (breakdance_pressed >= breakdance_max)
                        {
                            if (character == "P" && ispeppino)
                                sprite_index = spr_player_breakdance
                            else if ((character == "P" && (!ispeppino)) || character == "N")
                                sprite_index = spr_noise_vulnerable2
                        }
                    }
                }
                else
                {
                    sprite_index = spr_facehurt
                    if (breakdance_pressed >= breakdance_max)
                    {
                        if (character == "P" && ispeppino)
                            sprite_index = spr_player_breakdance
                        else if ((character == "P" && (!ispeppino)) || character == "N")
                            sprite_index = spr_noise_vulnerable2
                    }
                }
            }
        }
    }
    if (movespeed > 8)
        movespeed -= 0.1
    if landAnim
    {
        if (sprite_index == spr_playerN_spin)
        {
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = 0
                sprite_index = idlespr
                image_index = 0
            }
        }
        else if (sprite_index == spr_player_mortland)
        {
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = 0
                sprite_index = spr_player_mortidle
                image_index = 0
            }
        }
        else if (sprite_index == spr_player_pistolland)
        {
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = idlespr
                landAnim = 0
            }
        }
        else if (!shotgunAnim)
        {
            if (move == 0)
            {
                movespeed = 0
                sprite_index = spr_land
                if (floor(image_index) == (image_number - 1))
                    landAnim = 0
            }
            else
            {
                sprite_index = spr_land2
                if (floor(image_index) == (image_number - 1))
                {
                    landAnim = 0
                    sprite_index = movespr
                    image_index = 0
                }
            }
        }
        else
        {
            sprite_index = spr_shotgunland
            if (floor(image_index) == (image_number - 1))
            {
                landAnim = 0
                sprite_index = spr_shotgunidle
                if (move != 0)
                    sprite_index = spr_shotgunwalk
                image_index = 0
            }
        }
    }
    else if (shotgunAnim && sprite_index != spr_shotgunshoot && (!machslideAnim))
        sprite_index = (move == 0 ? spr_shotgunidle : spr_shotgunwalk)
    if machslideAnim
        sprite_index = spr_machslideend
    if (floor(image_index) == (image_number - 1))
    {
        switch sprite_index
        {
            case spr_machslideend:
                machslideAnim = 0
                sprite_index = idlespr
                if shotgunAnim
                    sprite_index = spr_shotgunidle
                break
            case 3123:
                sprite_index = idlespr
                break
            case spr_shotgunshoot:
                sprite_index = spr_shotgunidle
                break
            case spr_pistolshot:
                sprite_index = idlespr
                break
        }

    }
    if grounded
    {
        glidemode = 0
        if ((key_jump || (input_buffer_jump > 0 && (!key_attack) && vsp > 0)) && (!key_down))
        {
            input_buffer_jump = 0
            wallclingcooldown = 0
            if (sprite_index != spr_shotgunshoot)
            {
                sprite_index = spr_jump
                if shotgunAnim
                    sprite_index = spr_shotgunjump
                else if global.pistol
                    sprite_index = spr_player_pistoljump1
                if ispeppino
                {
                    if (global.panic || instance_exists(obj_pizzafaceboss) || instance_exists(obj_pizzaface_thunderdark))
                        sprite_index = spr_player_hurtjump
                }
                if hasjumped
                {
                    if (character == "N" || (character == "P" && (!ispeppino)))
                    {
                        if global.panic
                            sprite_index = spr_playerN_tackle
                        else
                            sprite_index = spr_playerN_backkick
                    }
                    else if (character == "P")
                    {
                        if global.panic
                            sprite_index = spr_player_airdash1
                        else
                            sprite_index = spr_player_jump2
                    }
                }
                if (groundpoundjumpanim > 0)
                {
                    if (character == "N" || (character == "P" && (!ispeppino)))
                    {
                        sprite_index = spr_playerN_pogobounce
                        fmod_event_one_shot_3d("event:/sfx/noise/pogo", x, y)
                    }
                    else
                    {
                        fmod_event_one_shot_3d("event:/sfx/pepperman/groundpoundjump", x, y)
                        if (character == "P" && ispeppino)
                            sprite_index = spr_player_groundpoundjump
                        else
                        {
                            if (character == "S")
                                sprite_index = spr_snick_dropdash
                            if (character == "V")
                                sprite_index = spr_playerV_superjump
                        }
                    }
                }
                else
                    scr_fmod_soundeffect(jumpsnd, x, y)
                if (key_up && character != "V")
                {
                    if (character == "S")
                        sprite_index = spr_snick_climbladder
                    else if ((!glidemode) && (character == "N" || (character == "P" && (!ispeppino))))
                    {
                        sprite_index = spr_playerN_glide
                        glidemode = 1
                        fmod_event_one_shot_3d("event:/sfx/pep/rampjump", x, y)
                    }
                    else if (character == "P" && ispeppino)
                        sprite_index = spr_player_Sjumpstart
                }
                image_index = 0
            }
            particle_set_scale((4 << 0), xscale, 1)
            create_particle(x, y, (4 << 0), 0)
            if ((character == "P" && (!ispeppino)) || character == "N")
            {
                if (groundpoundjumpanim > 0 || (key_up && (!glidemode)))
                {
                    vsp = -15
                    with (instance_create(x, (y - 5), obj_highjumpcloud2))
                    {
                        image_xscale = other.xscale
                        sprite_index = spr_groundpoundjump_effect
                    }
                    groundpoundjumpanim = 0
                }
                else if glidemode
                    vsp = -7
                else
                    vsp = -9.5
            }
            else if (groundpoundjumpanim > 0 || (key_up && (!glidemode)))
            {
                vsp = -14
                groundpoundjumpanim = 0
            }
            else
                vsp = -11
            state = (92 << 0)
            jumpAnim = 1
            jumpstop = 0
            if (character == "P" || character == "N")
                hasjumped = 1
            if place_meeting(x, (y + 1), obj_railparent)
                railmomentum = 1
            freefallstart = 0
        }
        if (key_down || (grounded && vsp > 0 && scr_solid(x, (y - 3)) && scr_solid(x, y)) || place_meeting(x, y, obj_solid))
        {
            state = (100 << 0)
            landAnim = 0
            crouchAnim = 1
            image_index = 0
            idle = 0
        }
    }
    else if (!key_jump)
    {
        if (sprite_index != spr_shotgunshoot)
        {
            if (!shotgunAnim)
                sprite_index = spr_fall
            else
                sprite_index = spr_shotgunfall
            if global.pistol
                sprite_index = spr_player_pistoljump2
            image_index = 0
            jumpAnim = 0
        }
        else
            jumpAnim = 1
        state = (92 << 0)
    }
    if (input_buffer_shoot > 0)
    {
        if shotgunAnim
            scr_shotgunshoot()
        else if global.pistol
            scr_pistolshoot((0 << 0))
    }
    if (input_buffer_slap > 0 && (!key_up) && cangrab)
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
        state = (42 << 0)
        movespeed = 8
        image_index = 0
    }
    else if ((key_slap || key_slap2) && key_up)
    {
        state = (80 << 0)
        input_buffer_slap = 0
        image_index = 0
        vsp = -15
        sprite_index = spr_uppercut
        fmod_event_instance_play(snd_uppercut)
        movespeed = hsp
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
    else
    {
        switch character
        {
            case "P":
                if (key_attack && state != (42 << 0) && (!(place_meeting((x + xscale), y, obj_solid))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) || (!(place_meeting((x + (xscale * 5)), y, obj_solid)))) && (!global.kungfu))
                {
                    sprite_index = spr_mach1
                    image_index = 0
                    state = (104 << 0)
                    if (hasjumped && sprite_index != spr_jump && sprite_index != spr_fall && sprite_index != spr_playerN_backkick && sprite_index != spr_playerN_tackle)
                    {
                        if (movespeed < 7)
                            movespeed = 7
                    }
                    else if (movespeed < 6)
                        movespeed = 6
                }
                if (global.kungfu && key_attack && state != (42 << 0))
                {
                    state = (206 << 0)
                    sprite_index = spr_player_airattack
                    hsp = 0
                    movespeed = 0
                }
                break
            case "N":
                if (!key_slap2)
                {
                    if ((pogochargeactive || pizzapepper > 0) && (key_attack2 || key_superjump2))
                    {
                        hsp = 0
                        vsp = 0
                        image_index = 0
                        state = (99 << 0)
                        sprite_index = ((!key_up) ? spr_superjumpcancelstart : spr_superjumpprep)
                    }
                    else if key_attack
                    {
                        sprite_index = spr_playerN_pogostart
                        image_index = 0
                        state = (58 << 0)
                        pogospeed = movespeed
                    }
                }
                break
            case "V":
                if (key_attack && state != (42 << 0) && (!(place_meeting((x + xscale), y, obj_solid))) && ((!(place_meeting(x, (y + 1), obj_iceblockslope))) || (!(place_meeting((x + (xscale * 5)), y, obj_solid)))))
                {
                    sprite_index = spr_mach1
                    image_index = 0
                    state = (104 << 0)
                    if (hasjumped && sprite_index != spr_jump && sprite_index != spr_fall && sprite_index != spr_playerN_backkick && sprite_index != spr_playerN_tackle)
                    {
                        if (movespeed < 7)
                            movespeed = 7
                    }
                    else if (movespeed < 6)
                        movespeed = 6
                }
                if key_slap2
                {
                    if (!grounded)
                        sprite_index = spr_playerV_airrevolverstart
                    else
                        sprite_index = spr_playerV_revolverstart
                    image_index = 0
                    if (!grounded)
                        vsp = -4
                    state = (1 << 0)
                }
                break
            case "S":
                if ((move != 0 || (key_attack && key_up)) && (!(place_meeting((x + xscale), y, obj_solid))) && sprite_index != spr_snick_dropdash)
                {
                    jumpAnim = 1
                    image_index = 0
                    state = (42 << 0)
                }
                break
        }

    }
    scr_dotaunt()
    if (sprite_index == spr_shotgunshoot)
    {
        landAnim = 0
        machslideAnim = 0
        image_speed = 0.45
    }
    if (!grounded)
    {
        if (sprite_index == spr_playerN_spin && image_index == 7)
            image_index = 2
    }
}

function state_pepperman_normal() //state_pepperman_normal
{
    pepperman_grab_reset()
    move = (key_left + key_right)
    if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
        movespeed += pepperman_accel
    else if (move != 0 && move != sign(xscale) && movespeed > 0)
        movespeed -= pepperman_deccel
    else if (move == 0)
        movespeed -= pepperman_deccel
    if (floor(movespeed) == pepperman_maxhsp_normal)
        movespeed = pepperman_maxhsp_normal
    if (movespeed > pepperman_maxhsp_normal)
        movespeed -= 0.3
    else if (movespeed < 0)
        movespeed = 0
    if (move != 0 && movespeed == 0)
        xscale = move
    hsp = (xscale * movespeed)
    if (sprite_index != spr_pepperman_throw)
    {
        if (hsp != 0)
            sprite_index = spr_move
        else
            sprite_index = spr_idle
    }
    if ((input_buffer_jump > 0 || key_jump) && can_jump)
    {
        input_buffer_jump = 0
        scr_fmod_soundeffect(jumpsnd, x, y)
        sprite_index = spr_jump
        image_index = 0
        vsp = (-pepperman_jumpspeed)
        state = (92 << 0)
        with (instance_create(x, (y - 5), obj_highjumpcloud2))
            image_xscale = other.xscale
    }
    if ((!grounded) && (!key_jump))
    {
        state = (92 << 0)
        sprite_index = spr_fall
    }
    if (key_attack && ((!(place_meeting((x + xscale), y, obj_solid))) || place_meeting((x + xscale), y, obj_destructibles)) && pepperman_grabID == noone && sprite_index != spr_pepperman_throw)
    {
        if (move != 0)
            xscale = move
        state = (153 << 0)
        sprite_index = spr_pepperman_shoulderstart
        image_index = 0
    }
    if (sprite_index == spr_pepperman_throw && floor(image_index) == (image_number - 1))
        sprite_index = spr_pepperman_idle
    if (move != 0 && (floor(image_index) == 4 || floor(image_index) == 11) && steppy == 0 && character != "V")
    {
        instance_create(x, (y + 38), obj_cloudeffect)
        steppy = 1
    }
    if (move != 0 && floor(image_index) != 4 && floor(image_index) != 11)
        steppy = 0
}

function pepperman_grab_reset() //pepperman_grab_reset
{
    if (pepperman_grabID != noone)
    {
        if (!instance_exists(pepperman_grabID))
            pepperman_grabID = -4
    }
}

function scr_player_normal() //scr_player_normal
{
    if (character != "M")
        state_player_normal()
    else
        state_pepperman_normal()
}

