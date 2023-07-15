function scr_player_mach2() //scr_player_mach2
{
    if (windingAnim < 2000)
        windingAnim++
    if place_meeting(x, (y + 1), obj_railparent)
    {
        var _railinst = instance_place(x, (y + 1), obj_railparent)
        railmovespeed = _railinst.movespeed
        raildir = _railinst.dir
    }
    move2 = (key_right2 + key_left2)
    move = (key_right + key_left)
    if (!homingattack)
        hsp = ((xscale * movespeed) + (railmovespeed * raildir))
    crouchslideAnim = 1
    if (!jumpstop)
    {
        if ((!key_jump2) && vsp < 0.5 && (!stompAnim))
        {
            vsp /= 20
            jumpstop = 1
        }
        else if (scr_solid(x, (y - 1)) && (!jumpAnim))
        {
            vsp = grav
            jumpstop = 1
        }
    }
    if (character == "S")
    {
        if (!grounded)
        {
            if (homingattack == 0)
            {
                if key_slap2
                {
                    homingattack = 1
                    sprite_index = spr_snick_jump
                    if (move != 0)
                    {
                        xscale = move
                        movespeed += 8
                    }
                    else
                        movespeed += 10
                    if (movespeed > 20)
                        movespeed = 20
                    fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
                    with (instance_create((x - (8 * xscale)), (y + 6), obj_crazyrunothereffect))
                        playerid = other.object_index
                }
                else if key_jump
                {
                    if (dropdash == 0 && walljumpbuffer <= 0)
                    {
                        fmod_event_one_shot("event:/sfx/pep/gotsupertaunt")
                        dropdash = 1
                        flash = 1
                    }
                    else
                    {
                        flash = 0
                        dropdash = 0
                    }
                }
            }
            else if homingattack
            {
                hsp = (xscale * movespeed)
                if ((move != 0 || key_attack) && (!grounded) && (place_meeting((x + hsp), y, obj_solid) || (grounded && place_meeting((x + sign(hsp)), (y - 16), obj_solid))))
                {
                    wallspeed = movespeed
                    grabclimbbuffer = 0
                    if (movespeed < 1)
                        wallspeed = 1
                    else
                        movespeed = wallspeed
                    state = (37 << 0)
                }
            }
            if ((!key_jump) && sprite_index != spr_snick_climbladder && vsp > 0)
            {
                if (movespeed >= 12)
                    sprite_index = spr_fall2
                else
                    sprite_index = spr_fall
            }
        }
        else
        {
            homingattack = 0
            hsp = (xscale * movespeed)
        }
        if (dropdash == 1)
        {
            landAnim = 0
            sprite_index = spr_snick_dropdash
        }
        if (grounded && vsp > 0)
        {
            if (sprite_index == spr_snick_dropdash)
            {
                vsp = 0
                input_buffer_jump = 0
                if (key_attack || key_attack2)
                {
                    dropdash = 0
                    spindashcharge = 0
                    if (movespeed < 16)
                        movespeed = 16
                    hsp = (xscale * movespeed)
                    machhitAnim = 0
                    state = (121 << 0)
                    flash = 1
                    if (sprite_index != spr_rollgetup)
                        sprite_index = spr_mach4
                    particle_set_scale((5 << 0), xscale, 1)
                    create_particle(x, y, (5 << 0), 0)
                }
                else
                {
                    if (movespeed < 22)
                        movespeed = 22
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
                    flash = 1
                    state = (5 << 0)
                    image_index = 0
                }
            }
            else
            {
                dropdash = 0
                jumpstop = 0
            }
        }
    }
    if (!scr_slope())
        angle = 0
    if (character == "N" || (character == "P" && (!ispeppino)))
    {
        if (key_jump && (!skateboarding))
        {
            if ((!doublejump) && sprite_index != spr_freefall && sprite_index != spr_facestomp)
            {
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
                image_index = 0
                if glidemode
                    vsp = -7
                else if (movespeed > 11)
                    vsp = (-movespeed)
                else
                    vsp = -11
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
    if (input_buffer_jump > 0 && can_jump && sprite_index != spr_snick_dropdash && sprite_index != spr_secondjump1 && sprite_index != spr_player_Sjumpstart && sprite_index != spr_playerN_glide && sprite_index != spr_player_airattackstart && sprite_index != spr_clownjump && (!((move == 1 && xscale == -1))) && (!((move == -1 && xscale == 1))))
    {
        input_buffer_jump = 0
        image_index = 0
        jumpstop = 0
        sprite_index = spr_secondjump1
        if (character == "P")
        {
            if (ispeppino && hasjumped)
                sprite_index = spr_player_airattackstart
        }
        scr_fmod_soundeffect(jumpsnd, x, y)
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        if skateboarding
            sprite_index = spr_clownjump
        if key_up
        {
            if (character == "P" && ispeppino)
                sprite_index = spr_player_Sjumpstart
            else if ((!glidemode) && (character == "N" || (character == "P" && (!ispeppino))))
            {
                sprite_index = spr_playerN_glide
                glidemode = 1
                fmod_event_one_shot_3d("event:/sfx/pep/rampjump", x, y)
            }
        }
        if (key_up && (!glidemode))
            vsp = -13
        else if glidemode
        {
            if (movespeed < -9)
                vsp = movespeed
            else if (movespeed > 9)
                vsp = (-movespeed)
            else
                vsp = -9
        }
        else
            vsp = -11
    }
    var mortjump = 0
    if (key_jump && global.mort == 1 && sprite_index != spr_mortdoublejump && (!grounded) && (!skateboarding))
    {
        state = (92 << 0)
        repeat (6)
            create_debris(x, y, 1541)
        sprite_index = spr_mortdoublejump
        image_index = 0
        grav = 0.25
        with (instance_create(x, y, obj_highjumpcloud2))
            image_xscale = other.xscale
        mort = 1
        mortjump = 1
    }
    if (grounded && vsp > 0)
    {
        if (machpunchAnim == 0 && sprite_index != spr_mach && sprite_index != spr_mach1 && sprite_index != spr_mach4 && sprite_index != spr_player_machhit)
        {
            if (sprite_index != spr_player_machhit && sprite_index != spr_rollgetup && sprite_index != spr_suplexdash && sprite_index != spr_taunt && sprite_index != spr_superjumpcancelstart)
                sprite_index = spr_mach
        }
        if (machpunchAnim == 1)
        {
            if (global.combo >= 25 || global.panic)
            {
                if ispeppino
                    sprite_index = spr_player_attackdash
                else
                    sprite_index = spr_playerN_dashpad
                if ((sprite_index == spr_player_attackdash || sprite_index == spr_playerN_dashpad) && floor(image_index) == (image_number - 1))
                {
                    sprite_index = spr_mach
                    image_index = 0
                    machpunchAnim = 0
                }
            }
            else
            {
                if (punch == 0)
                    sprite_index = spr_machpunch1
                if (punch == 1)
                    sprite_index = spr_machpunch2
                if (floor(image_index) == 4 && sprite_index == spr_machpunch1)
                {
                    punch = 1
                    machpunchAnim = 0
                }
                if (floor(image_index) == 4 && sprite_index == spr_machpunch2)
                {
                    punch = 0
                    machpunchAnim = 0
                }
            }
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_mach1)
        sprite_index = spr_mach
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_longjump)
        sprite_index = spr_longjumpend
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjumpstart)
        sprite_index = spr_player_Sjump
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_Sjump)
        image_index = 0
    if (!grounded)
        machpunchAnim = 0
    if grounded
    {
        if (scr_slope() && hsp != 0 && (!key_attack) && movespeed > 7 && character == "S")
            scr_player_addslopemomentum(0.1, 0.2)
        if (movespeed < 12)
        {
            if skateboarding
                movespeed += 0.05
            else if (mach4mode == 0 && character != "S")
            {
                if (character == "N" || (!ispeppino))
                    movespeed += 0.15
                else
                    movespeed += 0.1
            }
            else
                movespeed += 0.15
        }
        if (abs(hsp) >= 12 && (!skateboarding) && sprite_index != spr_suplexdash)
        {
            machhitAnim = 0
            state = (121 << 0)
            flash = 1
            if (sprite_index != spr_rollgetup)
                sprite_index = spr_mach4
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
        }
    }
    if (((!grounded) && (place_meeting((x + hsp), y, obj_solid) || scr_solid_slope((x + hsp), y)) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || (grounded && (place_meeting((x + sign(hsp)), (y - 16), obj_solid) || scr_solid_slope((x + sign(hsp)), (y - 16))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_metalblock))) && place_meeting(x, (y + 1), obj_slope)))
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
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            other.dashcloudid = id
        }
    }
    if (grounded && floor(image_index) == (image_number - 1) && (sprite_index == spr_rollgetup || sprite_index == spr_player_rampjump))
        sprite_index = spr_mach
    if (floor(image_index) == (image_number - 1) && (sprite_index == spr_suplexdash || sprite_index == spr_shotgunsuplexdash))
        sprite_index = spr_mach
    if ((!grounded) && sprite_index != spr_secondjump2 && sprite_index != spr_snick_dropdash && sprite_index != spr_clownjump && sprite_index != spr_clownfall && sprite_index != spr_mach2jump && sprite_index != spr_walljumpstart && sprite_index != spr_taunt && sprite_index != spr_superjumpcancelstart && sprite_index != spr_walljumpend && sprite_index != spr_longjump && sprite_index != spr_longjumpend && sprite_index != spr_playerN_secondjump1 && sprite_index != spr_playerN_airdash1 && sprite_index != spr_player_airattackstart && sprite_index != spr_player_airattack && sprite_index != spr_playerN_glide && sprite_index != spr_player_Sjumpstart && sprite_index != spr_player_Sjump)
    {
        sprite_index = spr_secondjump1
        if (character == "P")
        {
            if (ispeppino && hasjumped)
                sprite_index = spr_player_airattackstart
        }
        if skateboarding
            sprite_index = spr_clownfall
        if key_up
        {
            if (character == "P" && ispeppino)
                sprite_index = spr_player_Sjump
            else if ((!glidemode) && (character == "N" || (character == "P" && (!ispeppino))))
            {
                sprite_index = spr_playerN_glide
                glidemode = 1
                fmod_event_one_shot_3d("event:/sfx/pep/rampjump", x, y)
            }
        }
    }
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_secondjump1)
        sprite_index = spr_secondjump2
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_airattackstart)
        sprite_index = spr_player_airattack
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_airattack)
        image_index = 0
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_walljumpstart)
        sprite_index = spr_walljumpend
    if ((!grounded) && sprite_index != spr_clownfall && sprite_index == spr_clownjump && floor(image_index) == (image_number - 1))
        sprite_index = spr_clownfall
    if (vsp > 0 || key_down2)
        dynamitesjump = 0
    if (key_down && (!skateboarding) && (!(place_meeting(x, y, obj_dashpad))) && dynamitesjump == 0)
    {
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        flash = 0
        state = (5 << 0)
        vsp = 10
        image_index = 0
        if (!grounded)
            sprite_index = spr_dive
        else
        {
            sprite_index = spr_rollmach
            if (character == "V")
                sprite_index = spr_playerV_divekickstart
        }
    }
    if (character == "S" && sprite_index != spr_snick_dropdash)
    {
        if ((!key_attack) && move == 0 && grounded)
        {
            image_index = 0
            state = (105 << 0)
            fmod_event_one_shot_3d("event:/sfx/pep/break", x, y)
            sprite_index = spr_machslidestart
        }
    }
    else if ((!key_attack) && movespeed >= 8 && grounded && vsp > 0 && (!skateboarding))
    {
        image_index = 0
        state = (105 << 0)
        fmod_event_one_shot_3d("event:/sfx/pep/break", x, y)
        sprite_index = spr_machslidestart
    }
    else if ((!key_attack) && movespeed < 8 && grounded && vsp > 0 && (!skateboarding))
        state = (0 << 0)
    if (move == (-xscale) && movespeed >= 8 && grounded && vsp > 0 && (!skateboarding))
    {
        if ispeppino
            fmod_event_one_shot_3d("event:/sfx/pep/machslideboost", x, y)
        else
            fmod_event_one_shot_3d("event:/sfx/noise/skateturn", x, y)
        image_index = 0
        state = (105 << 0)
        sprite_index = spr_machslideboost
    }
    else if (move == (-xscale) && movespeed < 8 && grounded && vsp > 0 && (!skateboarding))
    {
        xscale *= -1
        movespeed = 6
    }
    if (clowntimer > 0 && skateboarding == 1)
        clowntimer--
    if (clowntimer <= 0 && skateboarding == 1)
    {
        state = (0 << 0)
        instance_create(x, y, obj_genericpoofeffect)
    }
    if skateboarding
        image_speed = 0.35
    else if (sprite_index == spr_rollgetup || sprite_index == spr_longjump || sprite_index == spr_longjumpend || sprite_index == spr_player_airattackstart || sprite_index == spr_player_airattack || sprite_index == spr_playerN_secondjump1 || sprite_index == spr_suplexdash || sprite_index == spr_shotgunsuplexdash)
        image_speed = 0.4
    else
        image_speed = (abs(movespeed) / 15)
    scr_dotaunt()
    if (skateboarding && sprite_index != spr_clownjump && grounded)
    {
        if (!key_down)
        {
            if (!(scr_solid(x, (y - 16))))
                sprite_index = spr_clown
            else
                sprite_index = spr_clowncrouch
        }
        else if (sprite_index != spr_clowncrouch)
            sprite_index = spr_clowncrouch
    }
    if mortjump
        sprite_index = spr_player_mortjumpstart
    if (state != (105 << 0) && scr_solid((x + xscale), y) && (!scr_slope()) && (scr_solid_slope((x + sign(hsp)), y) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(place_meeting((x + sign(hsp)), y, obj_climbablewall))) && grounded)
    {
        if skateboarding
            xscale *= -1
        else
        {
            var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
            if _bump
            {
                fmod_event_one_shot_3d("event:/sfx/pep/splat", x, y)
                state = (106 << 0)
                image_index = 0
                sprite_index = spr_wallsplat
            }
        }
    }
    if (!skateboarding)
    {
        if (key_slap2 && key_up)
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
        else if (input_buffer_slap > 0)
        {
            if (character == "V")
            {
                if grounded
                    vsp = -3
                else
                    vsp = -5
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
                suplexmove = 1
                fmod_event_instance_play(suplexdashsnd)
                particle_set_scale((5 << 0), xscale, 1)
                create_particle(x, y, (5 << 0), 0)
                state = (42 << 0)
                if (movespeed < 5)
                    movespeed = 5
                image_index = 0
            }
        }
        if (input_buffer_shoot > 0)
        {
            if shotgunAnim
                scr_shotgunshoot()
            else if global.pistol
                scr_pistolshoot((104 << 0))
        }
    }
    if (global.attackstyle == 2 && key_slap2)
    {
        randomize_animations([spr_suplexmash1, spr_suplexmash2, spr_suplexmash3, spr_suplexmash4, spr_suplexmash5, spr_suplexmash6, spr_suplexmash7, spr_punch])
        image_index = 0
        state = (43 << 0)
    }
    if (state != (104 << 0) && fmod_event_instance_is_playing(rollgetupsnd))
        fmod_event_instance_stop(rollgetupsnd, 1)
    if (!grounded)
    {
        if (sprite_index == spr_playerN_spin && image_index == 7)
            image_index = 2
    }
}

