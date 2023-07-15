function scr_player_Sjump() //scr_player_Sjump
{
    move = (key_right + key_left)
    hsp = 0
    mach2 = 0
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    if (sprite_index == spr_superjump)
    {
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            create_particle((x + irandom_range(-25, 25)), (y + irandom_range(-10, 35)), (1 << 0), 0)
            steppybuffer = 8
        }
        if (piledrivereffect > 0)
            piledrivereffect--
        else
        {
            with (instance_create(x, y, obj_parryeffect))
            {
                sprite_index = spr_piledrivereffect
                image_yscale = -1
            }
            piledrivereffect = 15
        }
    }
    if (sprite_index == spr_superjump || sprite_index == spr_superspringplayer || isgustavo)
    {
        if (character == "V" && sprite_index != spr_superspringplayer)
        {
            if (sprite_index == spr_playerV_superjump)
            {
                if (vsp < 0)
                {
                    if dynamitesjump
                        vsp += 0.05
                    else
                        vsp += 0.015
                    if (image_index >= 10)
                        image_index = 5
                }
                else if (image_index < 10)
                    image_index = 10
            }
        }
        else
        {
            vsp = sjumpvsp
            sjumpvsp -= 0.25
        }
    }
    if (sprite_index == spr_player_supersidejump)
    {
        if (a < 25)
            a++
        hsp = (xscale * a)
        vsp = 0
    }
    if (sprite_index == spr_playerN_jetpackboostdown)
    {
        if (vsp < 10)
            vsp = 10
        vsp += 0.5
    }
    if (scr_solid(x, (y - 1)) && (!(place_meeting(x, (y - 1), obj_destructibles))))
    {
        pizzapepper = 0
        a = 0
        if (sprite_index == spr_player_supersidejump)
            sprite_index = spr_player_supersidejumpland
        if (sprite_index == spr_superjump || sprite_index == spr_superspringplayer)
            sprite_index = spr_superjumpland
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = (30 / room_speed)
        }
        with (obj_baddie)
        {
            if (shakestun && point_in_camera(x, y, view_camera[0]) && grounded && vsp > 0)
            {
                image_index = 0
                if grounded
                    vsp = -7
            }
        }
        fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
        image_index = 0
        if isgustavo
        {
            if brick
                sprite_index = spr_player_ratmountidle
            else
                sprite_index = spr_lonegustavo_idle
            state = (191 << 0)
            movespeed = 0
            hsp = 0
        }
        else
            state = (123 << 0)
        machhitAnim = 0
    }
    else if ((key_attack2 || key_superjump2 || input_buffer_slap > 0) && sprite_index != spr_superspringplayer && (!isgustavo) && sprite_index != spr_superjumpcancelstart)
    {
        input_buffer_slap = 0
        image_index = 0
        if (move != 0)
            xscale = move
        sprite_index = spr_superjumpcancelstart
        fmod_event_one_shot_3d("event:/sfx/pep/superjumpcancel", x, y)
    }
    if (sprite_index == spr_superjumpcancelstart)
    {
        vsp = 0
        if (floor(image_index) == (image_number - 1))
        {
            if (character == "N")
            {
                if (sprite_index == spr_playerN_jetpackstart)
                {
                    if (key_up || key_down)
                    {
                        sprite_index = ((!key_up) ? spr_playerN_jetpackboostdown : spr_superjump)
                        state = (97 << 0)
                        vsp = -17
                        image_index = 0
                    }
                    else
                    {
                        state = (121 << 0)
                        sprite_index = spr_superjumpcancel
                        instance_create(x, y, obj_jumpdust)
                        movespeed = 15
                    }
                }
                else if (sprite_index == spr_superjumpprep)
                {
                    fmod_event_instance_set_parameter(superjumpsnd, "state", 2, 1)
                    instance_create(x, y, obj_explosioneffect)
                    sprite_index = spr_superjump
                    if (move != 0)
                        xscale = move
                    state = (97 << 0)
                    vsp = -17
                }
            }
            else
            {
                jumpstop = 1
                vsp = -4
                flash = 1
                movespeed = 13
                image_index = 0
                sprite_index = spr_superjumpcancel
                state = (121 << 0)
                with (instance_create(x, y, obj_crazyrunothereffect))
                    image_xscale = other.xscale
            }
        }
    }
    if (character == "N")
    {
        if (sprite_index == spr_superjumpcancel)
        {
            if (move == 1)
                hsp = 5
            if (move == -1)
                hsp = -5
        }
        if (key_jump2 && (!key_attack))
        {
            if (move != 0)
                xscale = move
            jumpstop = 0
            vsp = -15
            state = (92 << 0)
            sprite_index = spr_playerN_noisebombspinjump
            image_index = 0
            with (instance_create(x, y, obj_jumpdust))
                image_xscale = other.xscale
        }
    }
    if (grounded && sprite_index == spr_playerN_jetpackboostdown)
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
        fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
        freefallstart = 0
        with (obj_camera)
        {
            shake_mag = 5
            shake_mag_acc = (15 / room_speed)
        }
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
        create_particle(x, (y + 3), (14 << 0), 0)
    }
    if (character == "V" && floor(image_index) == (image_number - 1))
    {
        sprite_index = spr_playerV_fall
        if (vsp > 0)
            state = (92 << 0)
    }
    image_speed = 0.5
    scr_collide_player()
}

