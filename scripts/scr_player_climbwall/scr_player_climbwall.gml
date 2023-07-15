function scr_player_climbwall() //scr_player_climbwall
{
    switch character
    {
        case "V":
        case "P":
            if (windingAnim < 2000)
                windingAnim += 2
            move = (key_left + key_right)
            suplexmove = 0
            doublejump = 0
            wallclingcooldown = 0
            vsp = (-wallspeed)
            if (wallspeed < 20)
            {
                if (sprite_index == spr_player_clingwall2 || (!key_attack))
                    wallspeed += 0.1
                else
                    wallspeed += 0.15
            }
            if (wallspeed < 0)
            {
                if (mach4mode == 0)
                {
                    if (sprite_index == spr_player_clingwall2 || (!key_attack))
                        movespeed += 0.1
                    else
                        movespeed += 0.2
                }
                else if mach4mode
                {
                    if key_attack
                        movespeed += 0.4
                    else
                        movespeed += 0.3
                }
            }
            if (wallspeed < 0)
            {
                if (!(scr_solid((x + xscale), (y + 50))))
                    vsp = 0
            }
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if (wallspeed < 10 && ispeppino)
            {
                if ((wallspeed < 8 && key_attack) || (wallspeed < 10 && (!key_attack)))
                    sprite_index = spr_player_clingwall2
                else
                    sprite_index = spr_player_clingwall
            }
            if skateboarding
            {
                if (wallspeed < 0)
                    wallspeed = 6
                sprite_index = spr_clownwallclimb
            }
            if (grabclimbbuffer > 0)
                grabclimbbuffer--
            if ((!skateboarding) && grabclimbbuffer == 0)
            {
                if (!key_attack)
                {
                    if (move == (-xscale) || move == 0)
                    {
                        state = (0 << 0)
                        movespeed = 0
                        railmovespeed = 6
                        raildir = (-xscale)
                    }
                }
            }
            if (verticalbuffer <= 0 && wallspeed > 0 && (!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
            {
                trace("climbwall out")
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                ledge_bump(32)
                if (wallspeed < 6)
                    wallspeed = 6
                if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
                {
                    if key_attack
                        state = (104 << 0)
                    else
                        state = (0 << 0)
                    movespeed = wallspeed
                }
                else if (wallspeed >= 12)
                {
                    state = (121 << 0)
                    sprite_index = spr_mach4
                    movespeed = wallspeed
                }
            }
            if (wallspeed < 0 && place_meeting(x, (y + 12), obj_solid))
                wallspeed = 0
            if (input_buffer_jump > 8)
            {
                fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y)
                input_buffer_jump = 0
                key_jump = 0
                golfdashbuffer = 0
                movespeed = 10
                railmovespeed = 0
                state = (104 << 0)
                image_index = 0
                sprite_index = spr_walljumpstart
                if skateboarding
                    sprite_index = spr_clownjump
                vsp = -11
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            if (state != (104 << 0) && verticalbuffer <= 0 && place_meeting(x, (y - 1), obj_solid) && scr_solid((x + xscale), y) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                trace("climbwall hit head")
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
                    image_index = 0
                    state = (123 << 0)
                    machhitAnim = 0
                }
                else if (!key_jump)
                {
                    state = (106 << 0)
                    hsp = (-2.5 * xscale)
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                }
            }
            image_speed = 0.6
            if (steppybuffer > 0)
                steppybuffer--
            else
            {
                create_particle((x + (xscale * 10)), (y + 43), (1 << 0), 0)
                steppybuffer = 10
            }
            break
        case "B":
            if (windingAnim < 2000)
                windingAnim += 2
            move = (key_left + key_right)
            suplexmove = 0
            vsp = (-wallspeed)
            if (wallspeed < 24 && move == xscale)
            {
                if key_attack
                    wallspeed += 0.15
                else
                    wallspeed += 0.1
            }
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if (grabclimbbuffer > 0)
                grabclimbbuffer--
            if ((!skateboarding) && grabclimbbuffer == 0)
            {
                if (!key_attack)
                {
                    if (move == (-xscale) || move == 0)
                    {
                        state = (0 << 0)
                        movespeed = 0
                        railmovespeed = 6
                        raildir = (-xscale)
                    }
                }
            }
            if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                sprite_index = spr_superjumpland
                fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
                image_index = 0
                state = (123 << 0)
                machhitAnim = 0
            }
            if ((!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))))
            {
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                if (movespeed >= 6)
                {
                    if key_attack
                        state = (104 << 0)
                    else
                        state = (0 << 0)
                }
                if (movespeed >= 12)
                {
                    state = (121 << 0)
                    sprite_index = spr_mach4
                }
            }
            if (input_buffer_jump > 8)
            {
                input_buffer_jump = 0
                movespeed = 8
                golfdashbuffer = 0
                state = (104 << 0)
                image_index = 0
                sprite_index = spr_walljumpstart
                vsp = -11
                xscale *= -1
                jumpstop = 0
            }
            if ((grounded && wallspeed <= 0) || wallspeed <= 0)
            {
                state = (92 << 0)
                sprite_index = spr_fall
            }
            image_speed = 0.6
            if (!instance_exists(obj_cloudeffect))
                instance_create(x, (y + 43), obj_cloudeffect)
            break
        case "N":
            if (windingAnim < 2000)
                windingAnim += 2
            move = (key_left + key_right)
            suplexmove = 0
            doublejump = 0
            wallclingcooldown = 0
            vsp = (-wallspeed)
            if (wallspeed < 20)
            {
                if (sprite_index == spr_player_clingwall2 || (!key_attack))
                    wallspeed += 0.1
                else
                    wallspeed += 0.15
            }
            if (wallspeed < 0)
            {
                if (mach4mode == 0)
                {
                    if (sprite_index == spr_player_clingwall2 || (!key_attack))
                        movespeed += 0.1
                    else
                        movespeed += 0.2
                }
                else if mach4mode
                {
                    if key_attack
                        movespeed += 0.4
                    else
                        movespeed += 0.3
                }
            }
            if (wallspeed < 0)
            {
                if (!(scr_solid((x + xscale), (y + 50))))
                    vsp = 0
            }
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if (wallspeed < 10 && ispeppino)
            {
                if ((wallspeed < 8 && key_attack) || (wallspeed < 10 && (!key_attack)))
                    sprite_index = spr_player_clingwall2
                else
                    sprite_index = spr_player_clingwall
            }
            if skateboarding
            {
                if (wallspeed < 0)
                    wallspeed = 6
                sprite_index = spr_clownwallclimb
            }
            if (grabclimbbuffer > 0)
                grabclimbbuffer--
            if ((!skateboarding) && grabclimbbuffer == 0)
            {
                if (!key_attack)
                {
                    if (move == (-xscale) || move == 0)
                    {
                        state = (0 << 0)
                        movespeed = 0
                        railmovespeed = 6
                        raildir = (-xscale)
                    }
                }
            }
            if (verticalbuffer <= 0 && wallspeed > 0 && (!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
            {
                trace("climbwall out")
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                ledge_bump(32)
                if (wallspeed < 6)
                    wallspeed = 6
                if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
                {
                    if key_attack
                    {
                        sprite_index = spr_playerN_pogostart
                        image_index = 0
                        state = (58 << 0)
                        pogospeed = movespeed
                    }
                    else
                        state = (0 << 0)
                    movespeed = wallspeed
                }
                else if (wallspeed >= 12)
                {
                    state = (121 << 0)
                    sprite_index = spr_mach4
                    movespeed = wallspeed
                }
            }
            if (wallspeed < 0 && place_meeting(x, (y + 12), obj_solid))
                wallspeed = 0
            if (input_buffer_jump > 8)
            {
                fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y)
                input_buffer_jump = 0
                key_jump = 0
                golfdashbuffer = 0
                movespeed = 10
                railmovespeed = 0
                state = (92 << 0)
                image_index = 0
                sprite_index = spr_walljumpstart
                if skateboarding
                    sprite_index = spr_clownjump
                vsp = -11
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            if (state != (92 << 0) && verticalbuffer <= 0 && place_meeting(x, (y - 1), obj_solid) && scr_solid((x + xscale), y) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                trace("climbwall hit head")
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
                    image_index = 0
                    state = (123 << 0)
                    machhitAnim = 0
                }
                else if (!key_jump)
                {
                    state = (106 << 0)
                    hsp = (-2.5 * xscale)
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                }
            }
            image_speed = 0.6
            if (steppybuffer > 0)
                steppybuffer--
            else
            {
                create_particle((x + (xscale * 10)), (y + 43), (1 << 0), 0)
                steppybuffer = 10
            }
            break
        case "S":
            if (windingAnim < 2000)
                windingAnim += 2
            move = (key_left + key_right)
            suplexmove = 0
            doublejump = 0
            dropdash = 0
            homingattack = 0
            landAnim = 0
            spindashcharge = 0
            wallclingcooldown = 0
            vsp = (-wallspeed)
            if (wallspeed < 20)
            {
                if key_attack
                    wallspeed += 0.15
                else
                    wallspeed += 0.1
            }
            if (wallspeed < 0)
            {
                if (mach4mode == 0)
                {
                    if key_attack
                        movespeed += 0.2
                    else
                        movespeed += 0.1
                }
                else if mach4mode
                {
                    if key_attack
                        movespeed += 0.4
                    else
                        movespeed += 0.25
                }
            }
            if (wallspeed < 0)
            {
                if (!(scr_solid((x + xscale), (y + 50))))
                    vsp = 0
            }
            crouchslideAnim = 1
            sprite_index = spr_machclimbwall
            if skateboarding
            {
                if (wallspeed < 0)
                    wallspeed = 6
                sprite_index = spr_clownwallclimb
            }
            if (grabclimbbuffer > 0)
                grabclimbbuffer--
            if ((!skateboarding) && grabclimbbuffer == 0)
            {
                if (!key_attack)
                {
                    if (move == (-xscale) || move == 0)
                    {
                        state = (0 << 0)
                        movespeed = 0
                        railmovespeed = 6
                        raildir = (-xscale)
                    }
                }
            }
            if (verticalbuffer <= 0 && wallspeed > 0 && (!(scr_solid((x + xscale), y))) && (!(place_meeting(x, y, obj_verticalhallway))) && (!(place_meeting(x, (y - 12), obj_verticalhallway))))
            {
                trace("climbwall out")
                instance_create(x, y, obj_jumpdust)
                vsp = 0
                ledge_bump(32)
                if (wallspeed < 6)
                    wallspeed = 6
                if ((wallspeed >= 6 && wallspeed < 12) || skateboarding)
                {
                    if key_attack
                        state = (104 << 0)
                    else
                        state = (0 << 0)
                    movespeed = wallspeed
                }
                else if (wallspeed >= 12)
                {
                    state = (121 << 0)
                    sprite_index = spr_mach4
                    movespeed = wallspeed
                }
            }
            if (wallspeed < 0 && place_meeting(x, (y + 12), obj_solid))
                wallspeed = 0
            if (input_buffer_jump > 8)
            {
                fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y)
                input_buffer_jump = 0
                key_jump = 0
                movespeed = 10
                railmovespeed = 0
                dropdash = 0
                golfdashbuffer = 0
                state = (104 << 0)
                image_index = 0
                sprite_index = spr_walljumpstart
                if skateboarding
                    sprite_index = spr_clownjump
                vsp = -11
                xscale *= -1
                jumpstop = 0
                walljumpbuffer = 4
            }
            if (state != (104 << 0) && verticalbuffer <= 0 && place_meeting(x, (y - 1), obj_solid) && scr_solid((x + xscale), y) && (!(place_meeting(x, (y - 1), obj_verticalhallway))) && (!(place_meeting(x, (y - 1), obj_destructibles))) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x - sign(hsp)), y, obj_slope))))
            {
                dropdash = 0
                spindashcharge = 0
                trace("climbwall hit head")
                if (!skateboarding)
                {
                    sprite_index = spr_superjumpland
                    fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
                    image_index = 0
                    state = (123 << 0)
                    machhitAnim = 0
                }
                else if (!key_jump)
                {
                    state = (106 << 0)
                    hsp = (-2.5 * xscale)
                    vsp = -3
                    mach2 = 0
                    image_index = 0
                }
            }
            image_speed = 0.6
            if (steppybuffer > 0)
                steppybuffer--
            else
            {
                create_particle((x + (xscale * 10)), (y + 43), (1 << 0), 0)
                steppybuffer = 10
            }
            break
    }

}

