function scr_player_bombgrab() //scr_player_bombgrab
{
    move = (key_left + key_right)
    if (sprite_index != spr_uppercutfinishingblow && sprite_index != spr_player_throw && sprite_index != spr_playerN_noisebombthrow)
        hsp = (move * movespeed)
    else
        hsp = 0
    if (hsp != 0)
        xscale = sign(hsp)
    if (dir != xscale)
    {
        dir = xscale
        movespeed = 0
    }
    if grounded
        jumpstop = 0
    if ((!key_jump2) && (!jumpstop) && vsp < 0.5 && (!stompAnim))
    {
        vsp /= 2
        jumpstop = 1
    }
    image_speed = 0.35
    if (sprite_index == spr_haulingstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_bombpepintro
    if (move != 0)
    {
        if (movespeed < 8)
            movespeed += 0.5
        else if (movespeed == 6)
            movespeed = 6
        else
            movespeed -= 0.5
    }
    else
        movespeed = 0
    if (!instance_exists(bombgrabID))
        state = (0 << 0)
    if (sprite_index != spr_haulingstart && sprite_index != spr_uppercutfinishingblow && sprite_index != spr_player_throw && sprite_index != spr_playerN_noisebombthrow)
    {
        if (grounded && vsp > 0)
        {
            if (hsp != 0)
                sprite_index = spr_bombwalk
            else
                sprite_index = spr_bombpepintro
        }
        else if (sprite_index != spr_haulingjump)
            sprite_index = spr_haulingfall
        if (input_buffer_jump > 0 && can_jump)
        {
            scr_fmod_soundeffect(jumpsnd, x, y)
            instance_create(x, y, obj_highjumpcloud2)
            vsp = -11
            input_buffer_jump = 0
            sprite_index = spr_haulingjump
            image_index = 0
        }
        if ((sprite_index == spr_haulingjump || sprite_index == spr_haulingfall) && grounded && vsp > 0)
        {
            fmod_event_one_shot_3d("event:/sfx/pep/step", x, y)
            create_particle(x, y, (12 << 0))
        }
        if (sprite_index == spr_haulingjump && floor(image_index) == (image_number - 1))
            sprite_index = spr_haulingfall
        if (input_buffer_slap > 0)
        {
            input_buffer_slap = 0
            image_index = 0
            if key_up
            {
                fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y)
                sprite_index = spr_uppercutfinishingblow
                image_index = 3
                with (bombgrabID)
                {
                    state = (0 << 0)
                    vsp = -20
                    hsp = 0
                }
            }
            else
            {
                if (character == "P" && ispeppino)
                    sprite_index = spr_player_throw
                if ((character == "P" && ispeppino == 0) || character == "N")
                    sprite_index = spr_playerN_noisebombthrow
                with (bombgrabID)
                {
                    state = (0 << 0)
                    movespeed = 9
                    vsp = -11
                }
            }
            with (bombgrabID)
            {
                while scr_solid(x, y)
                {
                    y++
                    if (y > room_height)
                        y = other.y
                }
            }
        }
        else if key_down
        {
            if grounded
            {
                state = (0 << 0)
                with (bombgrabID)
                    state = (0 << 0)
            }
        }
    }
    else if (sprite_index != spr_haulingstart)
    {
        if (floor(image_index) == (image_number - 1))
            state = (0 << 0)
    }
}

function scr_player_bombpepup() //scr_player_bombpepup
{
    image_speed = 0.35
    vsp = (bombup_dir * 14)
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
            if point_in_camera(x, y, view_camera[0])
            {
                image_index = 0
                if grounded
                    vsp = -7
            }
        }
        fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
        image_index = 0
        state = (123 << 0)
        machhitAnim = 0
    }
    if (bombup_dir == 1 && scr_solid(x, (y + 1)) && (!(place_meeting(x, (y + 1), obj_destructibles))))
    {
        state = (111 << 0)
        sprite_index = spr_bodyslamland
        image_index = 0
        with (obj_camera)
        {
            shake_mag = 10
            shake_mag_acc = (30 / room_speed)
        }
        with (obj_baddie)
        {
            if point_in_camera(x, y, view_camera[0])
            {
                image_index = 0
                if grounded
                    vsp = -7
            }
        }
    }
    with (instance_place(x, (y + vsp), obj_metalblock))
        instance_destroy()
}

function scr_player_bombpepside() //scr_player_bombpepside
{
    vsp = 0
    mach2 = 0
    if (sprite_index != spr_meteorpepimpact)
    {
        hsp = (xscale * movespeed)
        if (movespeed < 25)
            movespeed += 0.25
    }
    jumpAnim = 1
    dashAnim = 1
    landAnim = 0
    moveAnim = 1
    stopAnim = 1
    crouchslideAnim = 1
    crouchAnim = 0
    machhitAnim = 0
    if (sprite_index == spr_meteorpepimpact && floor(image_index) == (image_number - 1))
    {
        state = (54 << 0)
        bombup_dir = -1
        sprite_index = spr_superspringplayer
        image_index = 0
    }
    with (instance_place((x + hsp), y, obj_metalblock))
        instance_destroy()
    if scr_slope()
    {
        with (instance_place((x - (34 * xscale)), (y + 48), obj_slope))
        {
            with (other)
            {
                if ((other.image_xscale > 0 && hsp > 0) || (other.image_xscale < 0 && hsp < 0))
                {
                    if (other.image_yscale > 0)
                    {
                        image_index = 0
                        image_speed = 0.75
                        sprite_index = spr_meteorpepimpact
                        movespeed = 0
                        vsp = 0
                        hsp = 0
                    }
                    if (other.image_yscale < 0)
                    {
                        if isgustavo
                        {
                            if brick
                                sprite_index = spr_player_ratmountwalljump
                            else
                                sprite_index = spr_lonegustavo_groundpound
                        }
                        else
                            sprite_index = spr_rockethitwall
                        state = (108 << 0)
                        vsp = 14
                    }
                }
            }
        }
    }
    if (scr_solid((x + xscale), y) && (scr_solid_slope((x + sign(hsp)), y) || place_meeting((x + sign(hsp)), y, obj_solid)) && (!(place_meeting((x + sign(hsp)), y, obj_metalblock))) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))) && (!(instance_place(x, y, obj_hallway))))
    {
        if (!isgustavo)
            sprite_index = spr_meteorpepland
        else if brick
            sprite_index = spr_player_ratmountbump
        else
            sprite_index = spr_lonegustavo_bump
        fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
        fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
        with (obj_camera)
        {
            shake_mag = 20
            shake_mag_acc = (40 / room_speed)
        }
        hsp = 0
        with (obj_baddie)
        {
            if point_in_camera(x, y, view_camera[0])
            {
                stun = 1
                alarm[0] = 200
                ministun = 0
                vsp = -5
                hsp = 0
            }
        }
        flash = 0
        state = (106 << 0)
        hsp = -2.5
        vsp = -3
        mach2 = 0
        image_index = 0
        instance_create((x + 10), (y + 10), obj_bumpeffect)
    }
}

function scr_player_bombpep() //scr_player_bombpep
{
    alarm[8] = 60
    alarm[7] = 120
    hurted = 1
    if key_jump
        input_buffer_jump = 0
    if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
    {
        vsp /= 2
        jumpstop = 1
    }
    if (grounded && vsp > 0)
        jumpstop = 0
    mach2 = 0
    landAnim = 0
    alarm[5] = 2
    if (sprite_index == spr_bombpepintro && floor(image_index) == (image_number - 1))
        sprite_index = spr_bombpeprun
    if (sprite_index == spr_bombpeprun || sprite_index == spr_bombpeprunabouttoexplode)
    {
        if (movespeed <= 8)
            movespeed += 0.2
        move = (key_left + key_right)
        if grounded
        {
            if (move != 0 && (!instance_exists(obj_bumpeffect)))
                xscale = move
        }
        hsp = floor((xscale * movespeed))
    }
    else
    {
        hsp = 0
        movespeed = 0
    }
    if (bombpeptimer < 20 && bombpeptimer != 0)
        sprite_index = spr_bombpeprunabouttoexplode
    if (sprite_index == spr_bombpepend && floor(image_index) == (image_number - 1))
    {
        alarm[5] = 2
        alarm[7] = 60
        hurted = 1
        state = (0 << 0)
        sprite_index = spr_idle
        image_index = 0
    }
    if (bombpeptimer == 0 && sprite_index == spr_bombpeprunabouttoexplode)
    {
        hurted = 1
        scr_losepoints()
        instance_create(x, y, obj_bombexplosion)
        GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 1, 1, 0.9)
        sprite_index = spr_bombpepend
    }
    if (bombpeptimer > 0)
        bombpeptimer -= 0.5
    if (scr_solid((x + 1), y) && xscale == 1 && hsp != 0 && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
    {
        instance_create((x + 10), (y + 10), obj_bumpeffect)
        xscale *= -1
        GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.2, 0.4)
    }
    if (scr_solid((x - 1), y) && xscale == -1 && hsp != 0 && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)))
    {
        instance_create((x - 10), (y + 10), obj_bumpeffect)
        xscale *= -1
        GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 0.2, 0.4)
    }
    if (input_buffer_jump > 0 && can_jump && hsp != 0)
    {
        input_buffer_jump = 0
        vsp = -11
    }
    if (movespeed < 4)
        image_speed = 0.35
    else if (movespeed > 4 && movespeed < 8)
        image_speed = 0.45
    else
        image_speed = 0.6
    if (hsp != 0 && (floor(image_index) == 0 || floor(image_index) == 2) && steppy == 0 && grounded)
        steppy = 1
    if (floor(image_index) != 0 && floor(image_index) != 2)
        steppy = 0
    if (key_slap2 && state != (0 << 0) && sprite_index != spr_bombpepintro && sprite_index != spr_bombpepend)
    {
        sprite_index = spr_player_throw
        fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y)
        image_index = 0
        hsp = 0
        bombpeptimer = 0
        movespeed = 0
        state = (84 << 0)
        with (instance_create((x + (xscale * 50)), y, obj_pizzagoblinbomb))
        {
            hsp = (other.xscale * 8)
            vsp = -11
            if scr_solid(x, y)
            {
                var _dir = (-sign(other.xscale))
                var tx = try_solid(_dir, 0, 517, 78)
                if (tx != -1)
                    x += (tx * _dir)
            }
        }
    }
    if ((!instance_exists(obj_dashcloud)) && grounded && hsp != 0)
    {
        with (instance_create(x, y, obj_dashcloud))
            image_xscale = other.xscale
    }
}

