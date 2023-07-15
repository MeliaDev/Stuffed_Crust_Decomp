if grounded
    doublejump = 0
if (pogochargeactive == 1)
{
    if (flashflicker == 0)
    {
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogofall)
            sprite_index = spr_playerN_pogofallmach
        if (pogochargeactive == 1 && sprite_index == spr_playerN_pogobounce)
            sprite_index = spr_playerN_pogobouncemach
    }
    flashflicker = 1
    if ((!((key_attack || key_superjump))) && (!((state == (97 << 0) || state == (99 << 0)))))
        pogocharge--
    if (pogo_afterimage > 0)
        pogo_afterimage--
    else
    {
        pogo_afterimage = 5
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
else
    flashflicker = 0
if (state != (74 << 0))
    kickbomb = 0
if (pogocharge == 0)
{
    pogo_afterimage = 0
    pogochargeactive = 0
    pogocharge = 100
}
if (flashflicker == 1)
{
    flashflickertime++
    if (flashflickertime == 60)
    {
        flash = 1
        flashflickertime = 0
    }
}
if (scr_is_p_rank() && (!((is_bossroom() || room == tower_options || room == tower_noisemech || room == editor_room || room == Titlescreen || instance_exists(obj_tutorialbook)))))
{
    if (purpleguy == 1)
    {
        if (purpleshine >= 0)
            purpleshine--
        else
        {
            with (instance_create((obj_player1.x + random_range(-32, 32)), (obj_player1.y + random_range(-32, obj_farmerbaddie2)), obj_parryeffect))
            {
                image_speed = 0.2
                sprite_index = choose(spr_prankparticles_low1, spr_prankparticles_mid1, spr_prankparticles_high1, spr_prankparticles_low2, spr_prankparticles_mid2, spr_prankparticles_high2)
                depth = (other.depth - 1)
            }
            purpleshine = irandom_range(5, 20)
        }
        global.mach_color1 = make_colour_rgb(168, 80, 248)
        global.mach_color2 = make_colour_rgb(88, 80, 184)
        global.mach_color3 = make_colour_rgb(216, 184, 248)
        global.mach_color4 = make_colour_rgb(168, 80, 248)
        global.mach_color5 = make_colour_rgb(88, 80, 184)
        global.mach_color6 = make_colour_rgb(216, 184, 248)
    }
    if (purpleguy == 0)
    {
        purpleguy = 1
        purpleshine = irandom_range(5, 20)
    }
}
else
{
    machreset = 1
    purpleguy = 0
    purpleshine = 0
    if global.custom_mach_colors
    {
        global.mach_color1 = global.custom_mach_color1
        global.mach_color2 = global.custom_mach_color2
        global.mach_color3 = global.custom_mach_color3
        global.mach_color4 = global.custom_mach_color4
        global.mach_color5 = global.custom_mach_color5
        global.mach_color6 = global.custom_mach_color6
        global.mach_outlinecolor = global.custom_mach_outline
    }
    else
    {
        if (global.blueeffects == 4)
        {
            global.mach_color1 = make_colour_rgb(48, 168, 248)
            global.mach_color2 = make_colour_rgb(232, 80, 152)
            global.mach_color3 = make_colour_rgb(248, 248, 0)
        }
        else if (!isgustavo)
        {
            if (character == "S")
            {
                global.mach_color1 = make_colour_rgb(88, 0, 184)
                global.mach_color2 = make_colour_rgb(152, 80, 248)
                global.mach_color3 = make_colour_rgb(224, 48, 0)
                spr_palette = spr_snickpalette
                fontpalettespr = spr_font_palette
            }
            else if (character == "V")
            {
                global.mach_color1 = make_colour_rgb(255, 255, 0)
                global.mach_color2 = make_colour_rgb(255, 104, 0)
                global.mach_color3 = make_colour_rgb(176, 48, 0)
                spr_palette = spr_vigipalette
                fontpalettespr = spr_font_palette
            }
            else if (character == "N" || (character == "P" && ispeppino == 0))
            {
                global.mach_color1 = make_colour_rgb(98, 0, 255)
                global.mach_color2 = make_colour_rgb(255, 104, 0)
                global.mach_color3 = make_colour_rgb(255, 204, 0)
                spr_palette = spr_noisepalette
                fontpalettespr = spr_palette_font_noise
            }
            else
            {
                global.mach_color1 = make_colour_rgb(255, 0, 0)
                global.mach_color2 = make_colour_rgb(36, 228, 102)
                global.mach_color3 = make_colour_rgb(178, 26, 231)
                spr_palette = spr_peppalette
                fontpalettespr = spr_font_palette
            }
        }
        else
        {
            global.mach_color1 = make_colour_rgb(255, 255, 0)
            global.mach_color2 = make_colour_rgb(10, 111, 161)
            global.mach_color3 = make_colour_rgb(232, 80, 152)
        }
        global.mach_color4 = global.mach_color1
        global.mach_color5 = global.mach_color2
        global.mach_color6 = global.mach_color3
    }
}
if (!isgustavo)
{
    if (character == "S")
    {
        cangrab = 0
        shirtspr = spr_palettedresserdebris_snick
        spr_palette = spr_snickpalette
        fontpalettespr = spr_font_palette
    }
    else if (character == "V")
    {
        cangrab = 0
        shirtspr = spr_palettedresserdebris_vigi
        spr_palette = spr_vigipalette
        fontpalettespr = spr_font_palette
    }
    else if (character == "N" || (character == "P" && ispeppino == 0))
    {
        cangrab = 1
        shirtspr = spr_palettedresserdebris_noise
        spr_palette = spr_noisepalette
        fontpalettespr = spr_palette_font_noise
    }
    else
    {
        cangrab = 1
        shirtspr = spr_palettedresserdebris_pep
        spr_palette = spr_peppalette
        fontpalettespr = spr_font_palette
    }
}
else
{
    cangrab = 0
    spr_palette = spr_ratmountpalette
    fontpalettespr = spr_font_palette
}
if (visible && cutscene == 0)
{
    if grounded
    {
        uppercutbuffer = 0
        if dynamitesjump
            dynamitesjump = 0
        if dynamitebuffer
            dynamitebuffer = 0
    }
    if isgustavo
    {
        if (ratmissilecool <= 1 && ratmissilenotif == 0)
        {
            flash = 1
            fmod_event_one_shot("event:/sfx/pep/revolvercharge")
            ratmissilenotif = 1
        }
        if (ratshootbuffer <= 1 && ratdashnotif == 0)
        {
            flash = 1
            fmod_event_one_shot("event:/sfx/pep/gotsupertaunt")
            ratdashnotif = 1
        }
        if (key_shoot && grounded && (!brick))
        {
            if instance_exists(obj_brickcomeback)
            {
                with (obj_brickcomeback)
                {
                    if (comeback == 0)
                        comeback = 1
                    wait = 0
                }
            }
        }
    }
    else
    {
        if (character == "N" || (character == "P" && (!ispeppino)))
        {
            if (state == (58 << 0) || state == (109 << 0) || state == (42 << 0) || state == (105 << 0) || state == (124 << 0) || state == (93 << 0) || (state == (80 << 0) && sprite_index == spr_uppercut) || state == (97 << 0) || state == (37 << 0) || state == (0 << 0) || state == (92 << 0) || state == (100 << 0) || state == (101 << 0) || state == (102 << 0) || state == (104 << 0) || state == (121 << 0) || (state == (5 << 0) && sprite_index != spr_tumble && sprite_index != spr_tumbleend && sprite_index != spr_tumblestart) || state == (65 << 0))
            {
                if ((!global.pistol) && (!shotgunAnim))
                {
                    if (key_shoot2 && sprite_index != spr_playerN_spin)
                    {
                        fmod_event_one_shot_3d("event:/sfx/noise/spin", x, y)
                        sprite_index = spr_playerN_spin
                        image_index = 0
                        if (movespeed < 14)
                            movespeed = 14
                        if grounded
                            vsp = -4
                        else
                            vsp = -6
                        if (move != 0)
                            xscale = move
                        dir = xscale
                        state = (80 << 0)
                    }
                }
            }
            if (sprite_index == spr_playerN_spin)
            {
                if (!grounded)
                {
                    if (image_index >= 7)
                        image_index = 2
                }
                if grounded
                {
                    if (image_index < 5)
                        image_index = 5
                }
            }
            if (sprite_index != spr_playerN_noisebombspinjump)
                pogosplode = 0
        }
        if (character == "V")
        {
            if (dynamitebuff > 0)
                dynamitebuff--
            if (global.playerhealth_threshold >= 200)
            {
                global.playerhealth += 1
                if (global.playerhealth > 6)
                    global.playerhealth = 6
                global.playerhealth_threshold = 0
            }
            if (global.playerhealth > 8)
                global.playerhealth = 8
            if ((!global.pistol) && (!shotgunAnim))
            {
                if (state == (97 << 0))
                {
                    if ((key_superjump || key_shoot2) && dynamitesjump == 0 && dynamitebuffer == 0)
                    {
                        dynamitesjump = 1
                        dynamitereal = 0
                        sprite_index = spr_superjump
                        state = (97 << 0)
                        vsp = -44
                        image_index = 0
                        fmod_event_one_shot_3d("event:/sfx/vigilante/throw", x, y)
                        instance_create(x, y, obj_dynamiteexplosion)
                        instance_create(x, y, obj_explosioneffect)
                    }
                }
                else if (state != (97 << 0))
                {
                    if ((state == (42 << 0) || state == (105 << 0) || state == (124 << 0) || state == (93 << 0) || (state == (80 << 0) && sprite_index == spr_uppercut) || state == (92 << 0) || state == (37 << 0) || state == (0 << 0) || state == (92 << 0) || state == (100 << 0) || state == (101 << 0) || state == (102 << 0) || state == (104 << 0) || state == (121 << 0) || (state == (5 << 0) && sprite_index != spr_tumble && sprite_index != spr_tumbleend && sprite_index != spr_tumblestart) || state == (65 << 0)) && (!instance_exists(dynamite_inst)))
                    {
                        if (dynamitehold == 1)
                        {
                            if (!key_shoot)
                            {
                                if (dynamitehold == 1 && dynamiteholdtimer > 0)
                                {
                                    if (state != (2 << 0))
                                    {
                                        if (state == (104 << 0) || state == (121 << 0) || state == (65 << 0) || (grounded && movespeed >= 10 && state != (0 << 0)))
                                            vsp = -5
                                        if (move == 0)
                                            movespeed = 0
                                        fmod_event_one_shot_3d("event:/sfx/vigilante/throw", x, y)
                                        sprite_index = spr_playerV_dynamitethrow
                                        image_index = 0
                                        with (instance_create((x + (movespeed * xscale)), y, obj_dynamite))
                                        {
                                            image_xscale = other.xscale
                                            with (other)
                                            {
                                                if (state != (100 << 0))
                                                {
                                                    if (movespeed <= 8)
                                                        other.movespeed = 8
                                                    else
                                                        other.movespeed = (movespeed + 4)
                                                }
                                                else
                                                    other.movespeed = 0
                                            }
                                            vsp = -7
                                            other.dynamite_inst = id
                                            playerid = other.id
                                        }
                                        dynamitebuff = 10
                                        if (move != 0)
                                            xscale = move
                                        dir = xscale
                                        state = (2 << 0)
                                    }
                                }
                                dynamitereal = 0
                                dynamitehold = 0
                                dynamiteholdtimer = 0
                            }
                            else
                            {
                                dynamitehold = 1
                                if (dynamitereal == 0)
                                {
                                    flash = 1
                                    fmod_event_one_shot_3d("event:/sfx/pep/gotsupertaunt", x, y)
                                    dynamiteholdtimer = 300
                                    dynamitereal = 1
                                }
                            }
                        }
                        if dynamitereal
                        {
                            if (dynamiteholdtimer > 0)
                            {
                                dynamiteholdtimer--
                                if ((key_superjump || key_up2) && dynamitereal && dynamitesjump == 0 && dynamitebuffer == 0)
                                {
                                    dynamitesjump = 1
                                    dynamitebuffer = 1
                                    if (state != (0 << 0))
                                        vsp = -20
                                    else
                                        vsp = -17
                                    if (state != (101 << 0) && state != (121 << 0))
                                    {
                                        sprite_index = spr_superjump
                                        state = (92 << 0)
                                    }
                                    else
                                    {
                                        if (state == (101 << 0))
                                            sprite_index = spr_mach2jump
                                        if (state == (121 << 0))
                                            sprite_index = spr_mach3jump
                                    }
                                    image_index = 0
                                    jumpAnim = 1
                                    jumpstop = 1
                                    dynamitehold = 0
                                    dynamitereal = 0
                                    dynamiteholdtimer = 0
                                    fmod_event_one_shot_3d("event:/sfx/vigilante/throw", x, y)
                                    instance_create(x, y, obj_dynamiteexplosion)
                                    instance_create(x, y, obj_explosioneffect)
                                }
                            }
                            else
                            {
                                dynamiteholdtimer = 0
                                dynamitehold = 0
                                dynamitereal = 0
                                scr_hurtplayer(id)
                                instance_create(x, y, obj_dynamiteexplosion)
                            }
                        }
                    }
                }
                if (dynamitebuff == 0)
                {
                    if (key_shoot2 && dynamitehold == 0)
                        dynamitehold = 1
                    if (dynamitehold == 1)
                    {
                        if (!key_shoot)
                        {
                            dynamitereal = 0
                            dynamitehold = 0
                            dynamiteholdtimer = 0
                        }
                        else
                        {
                            dynamitehold = 1
                            if (dynamitereal == 0)
                            {
                                flash = 1
                                fmod_event_one_shot_3d("event:/sfx/pep/gotsupertaunt", x, y)
                                dynamiteholdtimer = 300
                                dynamitereal = 1
                            }
                        }
                    }
                }
            }
        }
        if (character == "P" && ispeppino)
        {
            if (state == (42 << 0) || state == (105 << 0) || state == (124 << 0) || state == (93 << 0) || (state == (80 << 0) && sprite_index == spr_uppercut) || state == (97 << 0) || state == (37 << 0) || state == (0 << 0) || state == (92 << 0) || state == (100 << 0) || state == (101 << 0) || state == (102 << 0) || state == (104 << 0) || state == (121 << 0) || (state == (5 << 0) && sprite_index != spr_tumble && sprite_index != spr_tumbleend && sprite_index != spr_tumblestart) || state == (65 << 0))
            {
                if (key_shoot2 && (!shotgunAnim) && (!global.pistol))
                {
                    if (global.shootkeyattack == 1 && sprite_index != spr_player_kungfuattackstance)
                    {
                        if (grounded && move == 0)
                            sprite_index = spr_player_kungfuattackstance
                        else
                        {
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
                        }
                        image_index = 0
                        if (move != 0)
                            xscale = move
                        dir = xscale
                        state = (80 << 0)
                    }
                    if (global.shootkeyattack == 2)
                    {
                        slapbuffer = 0
                        flash = 1
                        if (movespeed < 14 && (state == (42 << 0) || state == (124 << 0) || state == (97 << 0) || state == (104 << 0) || state == (121 << 0)))
                            movespeed = 14
                        if (movespeed >= 10)
                        {
                            fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
                            sprite_index = spr_player_slapdash
                            movespeed = 14
                        }
                        else if key_up
                            sprite_index = spr_player_slapup
                        else if grounded
                        {
                            if (move == 0)
                            {
                                if (slaphand == 1)
                                    sprite_index = spr_player_slap1
                                if (slaphand == -1)
                                    sprite_index = spr_player_slap2
                            }
                            else if (move != 0)
                            {
                                if (slaphand == 1)
                                    sprite_index = spr_player_slaprun1
                                if (slaphand == -1)
                                    sprite_index = spr_player_slaprun2
                            }
                        }
                        else
                        {
                            if (slaphand == 1)
                                sprite_index = spr_player_slap1air
                            if (slaphand == -1)
                                sprite_index = spr_player_slap2air
                        }
                        image_index = 0
                        if (move != 0)
                            xscale = move
                        dir = xscale
                        state = (23 << 0)
                    }
                    if (global.shootkeyattack == 3)
                    {
                        flash = 1
                        fmod_event_one_shot_3d("event:/sfx/pep/suplexdash", x, y)
                        if (movespeed < 16)
                            movespeed = 16
                        if (state == (42 << 0) || state == (124 << 0) || state == (97 << 0) || state == (104 << 0) || state == (121 << 0))
                        {
                            if (!grounded)
                            {
                                vsp = -8
                                sprite_index = spr_player_buttattackstart
                            }
                            else
                                sprite_index = spr_player_breakdancesuper
                        }
                        else
                            sprite_index = spr_player_breakdance
                        image_index = 0
                        if (move != 0)
                            xscale = move
                        dir = xscale
                        state = (80 << 0)
                    }
                    if (global.shootkeyattack == 4)
                    {
                        if (global.fuel > 0)
                        {
                            if (state == (42 << 0) || state == (124 << 0) || state == (97 << 0) || state == (104 << 0) || state == (121 << 0))
                            {
                                if (sprite_index != spr_player_chainsawdash && sprite_index != spr_player_chainsawair)
                                {
                                    if grounded
                                    {
                                        vsp = -9
                                        sprite_index = spr_player_chainsawdash
                                    }
                                    else
                                        sprite_index = spr_player_chainsawair
                                    chainsawrev = (30 + movespeed)
                                }
                                movespeed = (10 + ceil((chainsawrev / 6)))
                            }
                            else
                                sprite_index = spr_player_chainsawstart
                            image_index = 0
                            if (move != 0)
                                xscale = move
                            dir = xscale
                            state = (41 << 0)
                        }
                        else if (irandom(100) >= 75)
                            fmod_event_one_shot_3d("event:/sfx/voice/myea", x, y)
                    }
                }
            }
        }
    }
}
