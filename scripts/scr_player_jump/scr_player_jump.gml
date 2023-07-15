function state_player_jump() //state_player_jump
{
    landAnim = 1
    angle = 0
    chainsawrev = 0
    move = (key_left + key_right)
    if (!scr_slope())
        angle = 0
    if key_taunt2
    {
        input_finisher_buffer = 60
        input_attack_buffer = 0
        input_up_buffer = 0
        input_down_buffefr = 0
    }
    if (!homingattack)
    {
        if (!momemtum)
            hsp = (move * movespeed)
        else
            hsp = (xscale * movespeed)
        if (dir != xscale)
        {
            dir = xscale
            if (hasjumped && sprite_index != spr_jump && sprite_index != spr_fall)
                movespeed = 3
            else
                movespeed = 2
            facehurt = 0
        }
        if (move != xscale)
        {
            if (hasjumped && sprite_index != spr_jump && sprite_index != spr_fall)
                movespeed = 3
            else
                movespeed = 2
        }
        if (move != 0)
        {
            xscale = move
            if (hasjumped && sprite_index != spr_jump && sprite_index != spr_fall)
            {
                if (movespeed < 10)
                    movespeed += 1
                else if (floor(movespeed) == 10 && character != "S")
                    movespeed = 8
            }
            else if (movespeed < 8)
                movespeed += 0.5
            else if (floor(movespeed) == 8 && character != "S")
                movespeed = 6
            if (scr_solid((x + xscale), y) && move == xscale)
                movespeed = 0
        }
        else
            movespeed = 0
        if (hasjumped && sprite_index != spr_jump && sprite_index != spr_fall)
        {
            if (movespeed > 10)
                movespeed -= 0.1
        }
        else if (movespeed > 8)
            movespeed -= 0.1
        hsp += (railmovespeed * raildir)
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
    if (movespeed == 0)
        momemtum = 0
    if scr_solid((x + hsp), y)
    {
        movespeed = 0
        mach2 = 0
    }
    if (ladderbuffer > 0)
        ladderbuffer--
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
    if (sprite_index == spr_playerN_glide && floor(image_index) == (image_number - 1))
        image_index = 0
    if (character == "N" || (character == "P" && (!ispeppino)))
    {
        if (key_jump && wallclingcooldown == 10 && (!((sprite_index == spr_playerN_noisebombspinjump && pogosplode == 0))) && (!grounded))
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
    if (global.mort && (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart))
    {
        if (vsp > 6)
            vsp = 6
        if (!key_jump2)
        {
            grav = 0.5
            sprite_index = spr_fall
        }
    }
    if key_jump
    {
        if (global.mort && sprite_index != spr_mortdoublejump)
        {
            repeat (6)
                create_debris(x, y, 1541)
            sprite_index = spr_mortdoublejump
            image_index = 0
            jumpstop = 0
            grav = 0.25
            mort = 1
        }
    }
    if (can_jump && input_buffer_jump > 0 && (!key_down) && (!key_attack) && vsp > 0 && (!((sprite_index == spr_snick_dropdash || sprite_index == spr_facestomp || sprite_index == spr_freefall))))
    {
        input_buffer_jump = 0
        stompAnim = 0
        state = (92 << 0)
        jumpAnim = 1
        jumpstop = 0
        freefallstart = 0
        railmomentum = 0
        if place_meeting(x, (y + 1), obj_railparent)
            railmomentum = 1
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
                else if ispeppino
                    sprite_index = spr_player_Sjumpstart
            }
            image_index = 0
        }
        if (character == "S")
            vsp = -12
        else if ((character == "P" && (!ispeppino)) || character == "N")
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
                vsp = -10
            else
                vsp = -9.5
        }
        else if (groundpoundjumpanim > 0 || (key_up && (!glidemode)))
        {
            vsp = -14
            with (instance_create(x, (y - 5), obj_highjumpcloud2))
            {
                image_xscale = other.xscale
                sprite_index = spr_groundpoundjump_effect
            }
            groundpoundjumpanim = 0
        }
        else
            vsp = -11
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
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
                    homingattackfall = 1
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
                    if (dropdash == 0)
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
            if ((!key_jump) && sprite_index != spr_snick_climbladder && vsp > 0)
            {
                if (movespeed >= 12 || homingattackfall)
                    sprite_index = spr_fall2
                else
                    sprite_index = spr_fall
            }
        }
        else
            homingattack = 0
        if (dropdash == 1)
        {
            landAnim = 0
            sprite_index = spr_snick_dropdash
        }
    }
    if (grounded && vsp > 0)
    {
        homingattackfall = 0
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
        else if ((!key_attack) || sprite_index == spr_suplexbump || sprite_index == spr_playerN_noisebombspinjump)
        {
            dropdash = 0
            fmod_event_one_shot_3d("event:/sfx/pep/step", x, y)
            if (key_attack || sprite_index == spr_shotgunshoot)
                landAnim = 0
            if (sprite_index == spr_mortdoublejump || sprite_index == spr_mortdoublejumpstart)
                sprite_index = spr_player_mortland
            if (sprite_index != spr_shotgunshoot)
                image_index = 0
            if global.pistol
                sprite_index = spr_player_pistolland
            input_buffer_secondjump = 0
            state = (0 << 0)
            jumpAnim = 1
            jumpstop = 0
            freefallstart = 0
            create_particle(x, y, (12 << 0), 0)
        }
        else
        {
            dropdash = 0
            jumpstop = 0
        }
    }
    if (vsp > 5 && sprite_index != spr_mortdoublejump && sprite_index != spr_snick_dropdash)
        fallinganimation++
    if (fallinganimation >= 40 && fallinganimation < 80)
        sprite_index = spr_facestomp
    else if (fallinganimation >= 80)
        sprite_index = spr_freefall
    if (!stompAnim)
    {
        if (!jumpAnim)
        {
  switch (sprite_index)
			{
				case spr_mortdoublejumpstart:
					sprite_index = spr_mortdoublejump;
					break;
				case spr_playerN_doublejump:
					sprite_index = spr_playerN_doublejumpfall;
					break;
				case spr_airdash1:
					sprite_index = spr_airdash2;
					break;
				case spr_player_pistolshot:
					sprite_index = spr_player_pistoljump2;
					break;
				case spr_shotgunjump:
					sprite_index = spr_shotgunfall;
					break;
				case spr_playerV_superjump:
					sprite_index = spr_playerV_fall;
					break;
				case spr_jump:
					sprite_index = spr_fall;
					break;
				case spr_player_pistoljump1:
					sprite_index = spr_player_pistoljump2;
					break;
				case spr_suplexcancel:
					sprite_index = spr_fall;
					break;
				case spr_player_backflip:
					sprite_index = spr_fall;
					break;
				case spr_player_Sjumpstart:
					sprite_index = spr_player_Sjump;
					break;
				case spr_player_shotgunjump1:
					sprite_index = spr_player_shotgunjump2;
					break;
				case spr_shotgun_shootair:
					sprite_index = spr_shotgunfall;
					break;
				case spr_shotgunshoot:
					sprite_index = spr_shotgunfall;
					break;
				case spr_stompprep:
					sprite_index = spr_stomp;
					break;
				case spr_player_groundpoundjump:
					sprite_index = spr_fall;
					break;
			}

        }
    }
    else if (sprite_index == spr_stompprep && floor(image_index) == (image_number - 1))
        sprite_index = spr_stomp
    if (sprite_index == spr_player_jump2 && floor(image_index) == (image_number - 1))
        image_index = (image_number - 1)
    if (sprite_index == spr_playerN_backkick && floor(image_index) == (image_number - 1))
        image_index = 4
    if (sprite_index == spr_playerN_tackle && floor(image_index) == (image_number - 1))
        image_index = (image_number - 1)
    if (sprite_index == spr_player_airdash1 && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_airdash2
    if (sprite_index == spr_player_airdash2 && floor(image_index) == (image_number - 1))
        image_index = 0
    if (sprite_index == spr_snick_dropdash && floor(image_index) == (image_number - 1))
        image_index = 0
    if scr_check_groundpound()
    {
        input_buffer_slap = 0
        groundpoundjumpanim = 10
        if (!shotgunAnim)
        {
            sprite_index = spr_bodyslamstart
            image_index = 0
            state = (108 << 0)
            pistolanim = -4
            vsp = -6
        }
        else
        {
            fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y)
            sprite_index = spr_shotgunjump1
            image_index = 0
            state = (108 << 0)
            vsp = -11
            with (instance_create(x, y, obj_shotgunblast))
            {
                sprite_index = spr_shotgunblastdown
                with (bulletID)
                {
                    sprite_index = other.sprite_index
                    mask_index = other.mask_index
                }
            }
        }
    }
    if (sprite_index == spr_suplexcancel)
        image_speed = 0.4
    else
        image_speed = 0.35
    if (grounded && (sprite_index == spr_facestomp || sprite_index == spr_freefall))
    {
        fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
        image_index = 0
        sprite_index = spr_bodyslamland
        groundpoundjumpanim = 10
        state = (111 << 0)
        with (obj_baddie)
        {
            if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
            {
                vsp = -7
                hsp = 0
            }
        }
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = (30 / room_speed)
        }
    }
    if (input_buffer_shoot > 0)
    {
        if shotgunAnim
            scr_shotgunshoot()
        else if global.pistol
            scr_pistolshoot((92 << 0))
    }
    if (key_slap2 && shoot)
    {
        if (!shotgunAnim)
        {
            flash = 1
            if ((!instance_exists(parry_inst)) && flash == 1)
            {
                parry_inst = instance_create(x, y, obj_parryhitbox)
                var _playerid = 1
                if (object_index == obj_player2)
                    _playerid = 2
                with (parry_inst)
                {
                    player_id = _playerid
                    image_xscale = other.xscale
                }
            }
            if global.mort
            {
                with (instance_create((x + (xscale * 20)), y, obj_shotgunbullet))
                {
                    image_xscale = other.xscale
                    sprite_index = spr_mortprojectile
                }
                sprite_index = spr_mortthrow
                image_index = 0
                state = (72 << 0)
                mort = 1
                with (obj_camera)
                {
                    shake_mag = 3
                    shake_mag_acc = (3 / room_speed)
                }
            }
            else if (character != "V" && shoot)
            {
                sprite_index = spr_pistolshot
                image_index = 0
                movespeed = 5
                state = (42 << 0)
                shoot = 1
                with (obj_camera)
                {
                    shake_mag = 3
                    shake_mag = (3 / room_speed)
                }
                if ispeppino
                {
                    with (instance_create((x + (xscale * 20)), y, obj_shotgunbullet))
                    {
                        pistol = 1
                        sprite_index = spr_peppinobullet
                        image_xscale = other.xscale
                    }
                }
                else
                {
                    with (instance_create(x, y, obj_playerbomb))
                    {
                        kick = 1
                        movespeed = 15
                        image_xscale = other.xscale
                    }
                }
            }
            else if (character != "V")
            {
            }
        }
    }
    if (input_buffer_slap > 0 && (!key_up) && sprite_index != spr_suplexbump && cangrab)
    {
        input_buffer_slap = 0
        particle_set_scale((5 << 0), xscale, 1)
        create_particle(x, y, (5 << 0), 0)
        image_index = 0
        if shotgunAnim
            sprite_index = spr_shotgunsuplexdash
        else
            sprite_index = spr_suplexdashjumpstart
        angle = 0
        suplexmove = 1
        fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
        state = (42 << 0)
        if (hasjumped && sprite_index != spr_jump && sprite_index != spr_fall)
            movespeed = 6
        else
            movespeed = 5
    }
    else if ((key_slap || key_slap2) && key_up)
    {
        input_buffer_slap = 0
        state = (80 << 0)
        image_index = 0
        vsp = -11
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
            case "S":
            case "P":
                if (key_attack && grounded && fallinganimation < 40)
                {
                    sprite_index = spr_mach1
                    image_index = 0
                    state = (104 << 0)
                    if (movespeed < 6)
                        movespeed = 6
                }
                if ((key_superjump || (key_attack && key_up)) && pizzapepper > 0)
                {
                    sprite_index = ((!key_up) ? spr_superjumpcancelstart : spr_superjumpprep)
                    image_index = 0
                    hsp = 0
                    vsp = 0
                    state = (99 << 0)
                }
                break
            case "V":
                if (key_attack && grounded && fallinganimation < 40)
                {
                    sprite_index = spr_mach1
                    image_index = 0
                    state = (104 << 0)
                    if (movespeed < 6)
                        movespeed = 6
                }
                if ((key_superjump || (key_attack && key_up)) && pizzapepper > 0)
                {
                    sprite_index = ((!key_up) ? spr_superjumpcancelstart : spr_superjumpprep)
                    image_index = 0
                    hsp = 0
                    vsp = 0
                    state = (99 << 0)
                }
                if (sprite_index == spr_playerV_superjump && floor(image_index) == (image_number - 1))
                    create_particle(x, (y + 25), (7 << 0), 0)
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
        }

    }
    if ((!key_attack) || move != xscale)
        mach2 = 0
    if (floor(image_index) == (image_number - 1))
        jumpAnim = 0
    scr_dotaunt()
    if ((!grounded) && sprite_index == spr_playerN_spin && image_index >= 7)
        image_index = 2
    if (sprite_index == spr_shotgunshoot)
    {
        landAnim = 0
        machslideAnim = 0
        image_speed = 0.45
        if (image_index > (image_number - 1))
            sprite_index = spr_shotgunfall
    }
    if (place_meeting(x, y, obj_solid) && sprite_index != spr_snick_dropdash)
    {
        state = (100 << 0)
        landAnim = 0
        homingattack = 0
        crouchAnim = 1
        image_index = 0
        idle = 0
    }
}

function state_pepperman_jump() //state_pepperman_jump
{
    pepperman_grab_reset()
    move = (key_left + key_right)
    if (move != 0 && move == sign(xscale) && movespeed < pepperman_maxhsp_normal)
        movespeed += pepperman_accel_air
    else if (move != 0 && move != sign(xscale) && movespeed > 0)
        movespeed -= pepperman_deccel_air
    else if (move == 0)
        movespeed -= pepperman_deccel_air
    if (floor(movespeed) == pepperman_maxhsp_normal)
        movespeed = pepperman_maxhsp_normal
    if (movespeed > pepperman_maxhsp_normal)
        movespeed -= 0.3
    else if (movespeed < 0)
        movespeed = 0
    if (move != 0 && movespeed == 0)
        xscale = move
    hsp = (xscale * movespeed)
    if (sprite_index == spr_jump && floor(image_index) == (image_number - 1))
        sprite_index = spr_fall
    if (sprite_index == spr_playerN_tumblestart && image_index >= 9)
        image_index = 0
    if (sprite_index == spr_player_airattack && image_index >= 9)
        image_index = 0
    if (sprite_index == spr_player_jump2 && floor(image_index) == (image_number - 1))
        image_index = (image_number - 1)
    if (sprite_index == spr_player_hurtjump && floor(image_index) == (image_number - 1))
        image_index = (image_number - 1)
    if (sprite_index == spr_player_pistoljump1 && floor(image_index) == (image_number - 1))
        sprite_index = spr_player_pistoljump2
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5)
    {
        vsp /= 20
        jumpstop = 1
    }
    if (grounded && vsp > 0)
    {
        state = (0 << 0)
        instance_create(x, (y - 5), obj_landcloud)
    }
    if (scr_check_groundpound() && (!grounded))
    {
        groundpoundjumpanim = 10
        state = (108 << 0)
        freefallsmash = 12
        vsp = 14
        sprite_index = spr_bodyslamfall
    }
    if (key_attack && ((!(place_meeting((x + xscale), y, obj_solid))) || place_meeting((x + xscale), y, obj_destructibles)) && pepperman_grabID == -4 && sprite_index != spr_pepperman_throw)
    {
        if (move != 0)
            xscale = move
        state = (153 << 0)
        sprite_index = spr_pepperman_shoulderstart
        image_index = 0
    }
    if (sprite_index == spr_pepperman_throw && floor(image_index) == (image_number - 1))
        sprite_index = spr_pepperman_fall
    if (ladderbuffer > 0)
        ladderbuffer--
    if key_taunt2
    {
        fmod_event_one_shot_3d("event:/sfx/pep/taunt", x, y)
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredvsp = vsp
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        state = (84 << 0)
        if (supercharged == 1)
        {
            image_index = 0
            sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4, spr_supertaunt5)
        }
        else
        {
            taunttimer = 20
            image_index = random_range(0, 11)
            sprite_index = spr_taunt
        }
        with (instance_create(x, y, obj_taunteffect))
            player = other.id
    }
}

function scr_player_jump() //scr_player_jump
{
    if (character != "M")
        state_player_jump()
    else
        state_pepperman_jump()
}

