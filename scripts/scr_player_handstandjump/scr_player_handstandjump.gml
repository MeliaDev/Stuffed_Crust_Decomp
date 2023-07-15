function scr_player_handstandjump() //scr_player_handstandjump
{
    if (character != "S")
    {
        hsp = (xscale * movespeed)
        move = (key_left + key_right)
        momemtum = 1
        dir = xscale
        if (global.attackstyle != 3)
        {
            if (movespeed < 10)
            {
                if ((sprite_index == spr_player_pistolshot || sprite_index == spr_shotgun_shot) && movespeed < 8)
                    movespeed += 0.25
                else if (sprite_index == spr_player_lunge && movespeed < 12)
                    movespeed += 0.8
                else if (movespeed < 10)
                    movespeed += 0.5
            }
        }
        else
        {
            if (movespeed < 10)
            {
                if ((sprite_index == spr_player_pistolshot || sprite_index == spr_shotgun_shot) && movespeed < 8)
                    movespeed += 0.25
                else if (movespeed < 10)
                    movespeed += 0.5
            }
            if (global.pummeltest && (!instance_exists(lungeattackID)))
            {
                with (instance_create(x, y, obj_lungehitbox))
                {
                    playerid = other.id
                    other.lungeattackID = id
                }
            }
        }
        var attackdash = spr_suplexdash
        var airattackdash = spr_suplexdashjump
        var airattackdashstart = spr_suplexdashjumpstart
        if shotgunAnim
        {
            attackdash = spr_shotgunsuplexdash
            airattackdash = spr_shotgunsuplexdashjump
            airattackdashstart = spr_shotgunsuplexdashjumpstart
        }
        else if (shoot == 1)
            attackdash = spr_player_pistolshot
        else
            attackdash = spr_suplexdash
        if (sprite_index == spr_player_lungestart && floor(image_index) == (image_number - 1))
            sprite_index = spr_player_lunge
        if (global.attackstyle == 2)
            vsp = 0
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
        if (character == "N" || (character == "P" && (!ispeppino)))
        {
            if (key_jump && wallclingcooldown == 10 && (!grounded))
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
                        vsp = -13
                    state = (92 << 0)
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
        if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
        {
            vsp /= 20
            jumpstop = 1
        }
        if (input_buffer_jump > 0 && can_jump && (!key_down) && global.attackstyle != 2)
        {
            fmod_event_instance_play(rollgetupsnd)
            input_buffer_jump = 0
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
            jumpstop = 0
            vsp = -11
            image_index = 0
            if (character == "N")
            {
                sprite_index = spr_playerN_noisebombspinjump
                state = (92 << 0)
            }
            else
            {
                sprite_index = spr_longjump
                state = (104 << 0)
            }
        }
        if (sprite_index == attackdash && (!grounded))
        {
            image_index = 0
            sprite_index = airattackdashstart
        }
        if (sprite_index == attackdash || sprite_index == airattackdash)
        {
            if (input_buffer_slap > 0 && golfdashbuffer == 0)
            {
                image_index = 0
                if ispeppino
                    sprite_index = spr_player_faceplant
                else
                {
                    golfdashbuffer = 1
                    sprite_index = spr_playerN_suplexdash_GOLF
                }
                movespeed += 2
                if (movespeed > 20)
                    movespeed = 20
                if (move != 0)
                    xscale = move
                state = (124 << 0)
                fmod_event_instance_play(snd_crouchslide)
            }
            if (key_down && (!((key_slap || key_slap2))))
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
        }
        if (grounded && sprite_index == airattackdash && ((!key_attack) || character == "N") && global.attackstyle != 2)
        {
            if (global.attackstyle != 3)
            {
                state = (0 << 0)
                if (move != xscale)
                    movespeed = 2
            }
            else
            {
                sprite_index = attackdash
                image_index = (image_number - 6)
            }
        }
        if (grounded && sprite_index == airattackdash && key_attack && character != "N" && global.attackstyle != 2)
        {
            if (character == "N")
            {
                sprite_index = spr_playerN_pogostart
                image_index = 0
                state = (58 << 0)
                pogospeed = movespeed
            }
            else
                state = (104 << 0)
        }
        if ((pogochargeactive || pizzapepper > 0) && character == "N" && (key_attack || key_superjump))
        {
            hsp = 0
            vsp = 0
            image_index = 0
            state = (99 << 0)
            sprite_index = ((!key_up) ? spr_superjumpcancelstart : spr_superjumpprep)
        }
        if (floor(image_index) == (image_number - 1) && sprite_index == attackdash)
            state = (0 << 0)
        if (floor(image_index) == (image_number - 1) && sprite_index == airattackdashstart)
            sprite_index = airattackdash
        if (floor(image_index) == (image_number - 1) && key_attack && sprite_index == attackdash)
        {
            image_speed = 0.35
            grav = 0.5
            if (character == "N")
            {
                sprite_index = spr_playerN_pogostart
                image_index = 0
                state = (58 << 0)
                pogospeed = movespeed
            }
            else
                state = (104 << 0)
        }
        if (key_down && grounded && global.attackstyle != 2)
        {
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
            movespeed = 12
            crouchslipbuffer = 25
            grav = 0.5
            sprite_index = spr_crouchslip
            image_index = 0
            machhitAnim = 0
            state = (5 << 0)
            fmod_event_instance_play(snd_crouchslide)
        }
        mask_index = spr_player_mask
        if (((!grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && scr_slope()))
        {
            if (movespeed > 18)
                wallspeed = (movespeed / 3)
            else
                wallspeed = 6
            grabclimbbuffer = 10
            state = (37 << 0)
        }
        if ((!scr_slope()) && grounded && scr_solid((x + xscale), y) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
        {
            var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
            if _bump
            {
                fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y)
                jumpstop = 1
                state = (92 << 0)
                vsp = -4
                sprite_index = spr_suplexbump
                instance_create((x + (xscale * 10)), (y + 10), obj_bumpeffect)
            }
        }
        if ((!instance_exists(obj_slidecloud)) && grounded && movespeed > 5)
        {
            with (instance_create(x, y, obj_slidecloud))
                image_xscale = other.xscale
        }
        if (state != (106 << 0) && move != xscale && move != 0)
        {
            image_index = 0
            if (!grounded)
            {
                if (move != 0)
                    xscale = move
                momemtum = 0
                fmod_event_one_shot_3d("event:/sfx/pep/grabcancel", x, y)
                sprite_index = spr_suplexcancel
                jumpAnim = 1
                grav = 0.5
                state = (92 << 0)
            }
            else
            {
                state = (0 << 0)
                movespeed = 2
                grav = 0.5
            }
        }
        image_speed = 0.35
    }
    else if (character == "S")
    {
        homingattackfall = 0
        landAnim = 0
        crouchAnim = 1
        move = (key_left + key_right)
        if (movespeed < 1 && move != 0)
            movespeed = 1
        if (dir != xscale)
        {
            dir = xscale
            if key_attack
                movespeed = 3
            else
                movespeed = 2
            facehurt = 0
        }
        if (move != 0 && (!((key_attack && key_up))))
            xscale = move
        if (key_attack && key_up)
            hsp = 0
        else
            hsp = (move * movespeed)
        if grounded
        {
            homingattack = 0
            if (movespeed >= 20)
            {
                if (sprite_index != spr_snick_crazyrun)
                    flash = 1
                sprite_index = spr_snick_crazyrun
            }
            else if (movespeed < 20 && movespeed > 12)
                sprite_index = spr_snick_mach3
            else if (movespeed < 12 && movespeed > 8)
                sprite_index = spr_snick_mach2
            else if (move != 0 || (key_attack && key_up))
                sprite_index = spr_snick_walk
            else
                sprite_index = spr_snick_idle
            glidemode = 0
            if ((key_jump || (input_buffer_jump > 0 && (!key_attack) && vsp > 0)) && (!key_down))
            {
                input_buffer_jump = 0
                sprite_index = spr_jump
                if (groundpoundjumpanim > 0)
                {
                    sprite_index = spr_snick_altjump
                    fmod_event_one_shot_3d("event:/sfx/pepperman/groundpoundjump", x, y)
                }
                else
                    scr_fmod_soundeffect(jumpsnd, x, y)
                sprite_index = spr_jump
                if key_up
                    sprite_index = spr_snick_climbladder
                image_index = 0
                particle_set_scale((4 << 0), xscale, 1)
                create_particle(x, y, (4 << 0), 0)
                if (groundpoundjumpanim > 0 || key_up)
                {
                    vsp = -14
                    groundpoundjumpanim = 0
                }
                else
                    vsp = -11
                state = (92 << 0)
                jumpAnim = 1
                jumpstop = 0
                if place_meeting(x, (y + 1), obj_railparent)
                    railmomentum = 1
                freefallstart = 0
            }
            if ((key_down && movespeed > 3) || (grounded && vsp > 0 && scr_solid(x, (y - 3)) && scr_solid(x, y)) || place_meeting(x, y, obj_solid))
            {
                state = (100 << 0)
                landAnim = 0
                crouchAnim = 1
                image_index = 0
                idle = 0
            }
        }
        else if ((!key_jump) && vsp > 0)
        {
            sprite_index = spr_fall
            image_index = 0
            jumpAnim = 0
            state = (92 << 0)
        }
        scr_dotaunt()
        if (move != 0 || (key_attack && key_up))
        {
            if (move != 0 && movespeed < 12)
            {
                if (sprite_index == spr_snick_walk && sprite_index == spr_snick_mach2)
                {
                    if ((floor(image_index) == 4 || floor(image_index) == 11) && steppy == 0)
                    {
                        instance_create(x, (y + 38), obj_cloudeffect)
                        steppy = 1
                    }
                    if (floor(image_index) != 4 && floor(image_index) != 11)
                        steppy = 0
                }
                if (grounded && vsp > 0)
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
            }
            if (key_down && sprite_index != spr_dashpadmach && movespeed > 6)
            {
                particle_set_scale((5 << 0), xscale, 1)
                create_particle(x, y, (5 << 0), 0)
                flash = 0
                state = (5 << 0)
                image_index = 0
                vsp = 10
                if (!grounded)
                    sprite_index = spr_snick_dive
                else
                    sprite_index = spr_snick_altjump
            }
            if ((movespeed >= 14 && ((!((key_attack && key_up))) || key_slap)) || (key_attack && sprite_index == spr_snick_dropdash))
            {
                sprite_index = spr_snick_mach3
                state = (121 << 0)
            }
            if (!(place_meeting((x + xscale), y, obj_solid)))
            {
                if (movespeed < 22)
                {
                    if key_attack
                    {
                        if key_up
                            movespeed += 0.35
                        else
                            movespeed += 0.25
                    }
                    else
                        movespeed += 0.2
                }
            }
            else
                movespeed = 1
            image_speed = (abs(movespeed) / 27)
        }
        else
        {
            image_speed = 0.35
            if (movespeed <= 0)
            {
                movespeed = 0
                state = (0 << 0)
            }
            else if (movespeed > 0)
                movespeed -= 0.6
        }
        if ((!instance_exists(obj_dashcloud2)) && grounded && movespeed > 5)
        {
            with (instance_create(x, y, obj_dashcloud2))
                image_xscale = other.xscale
        }
        if ((!scr_slope()) && state != (105 << 0) && scr_solid((x + xscale), y) && (scr_solid_slope((x + sign(hsp)), y) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_climbablewall))) && grounded && movespeed > 12 && movespeed < 20 && move != 0 && (!((key_up && key_attack))))
        {
            if skateboarding
                xscale *= -1
            else
            {
                _bump = ledge_bump((vsp >= 0 ? 32 : 22))
                if _bump
                {
                    fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y)
                    state = (106 << 0)
                    image_index = 0
                    sprite_index = spr_snick_wallsplat
                }
            }
        }
        if ((move == (-xscale) || ((!key_attack) && move == 0)) && grounded && (!launched) && fightball == 0 && movespeed >= 4 && hsp != 0)
        {
            image_index = 0
            state = (105 << 0)
            fmod_event_one_shot_3d("event:/sfx/pep/break", x, y)
            sprite_index = spr_machslidestart
        }
        if (((!grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock)))) || (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_mach3solid))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope)))
        {
            wallspeed = movespeed
            grabclimbbuffer = 0
            if (movespeed < 1)
                wallspeed = 1
            else
                movespeed = wallspeed
            state = (37 << 0)
        }
        if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_climbablewall) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))))
        {
            wallspeed = movespeed
            grabclimbbuffer = 0
            state = (37 << 0)
        }
    }
}

