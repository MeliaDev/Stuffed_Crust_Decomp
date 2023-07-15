function scr_player_firemouth() //scr_player_firemouth
{
    alarm[5] = 2
    alarm[7] = 60
    move = (key_left + key_right)
    if (firemouthballbuffer > 0)
        firemouthballbuffer--
    if (sprite_index != spr_player_firemouthspin_reverse)
    {
        if (realdoublejump > 0)
            realdoublejump--
    }
    with (instance_place((x + hsp), y, obj_iceblock_breakable))
    {
        instance_destroy()
        if (other.vsp > -11)
            other.vsp = -11
        jumpstop = 0
    }
    with (instance_place((x + xscale), y, obj_iceblock_breakable))
    {
        instance_destroy()
        if (other.vsp > -11)
            other.vsp = -11
        jumpstop = 0
    }
    with (instance_place(x, (y + vsp), obj_iceblock_breakable))
    {
        instance_destroy()
        if (other.vsp > -11)
            other.vsp = -11
        jumpstop = 0
    }
    with (instance_place(x, (y + vsp), obj_ratblock))
        instance_destroy()
    if (scr_slope() && hsp != 0 && movespeed > 8)
        scr_player_addslopemomentum(0.1, 0.25)
    with (instance_place((x + xscale), y, obj_destructibles))
    {
        instance_destroy()
        if (other.vsp > -11)
            other.vsp = -11
        jumpstop = 0
    }
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
    if (sprite_index == spr_firemouthintro && floor(image_index) == (image_number - 1))
    {
        scr_losepoints()
        sprite_index = spr_firemouth
        dir = xscale
    }
    if (scr_check_groundpound() && (!grounded))
        vsp += 10
    if (sprite_index != spr_firemouthintro && sprite_index != spr_firemouthend)
    {
        move = (key_left + key_right)
        if (input_buffer_jump > 0 && can_jump)
        {
            GamepadSetVibration(0, 0.2, 0.4)
            input_buffer_jump = 0
            realdoublejump = 5
            fmod_event_one_shot_3d("event:/sfx/firemouth/jump", x, y)
            with (instance_create(x, y, obj_highjumpcloud2))
                sprite_index = spr_player_firemouthjumpdust
            repeat irandom_range(3, 5)
                instance_create(x, y, obj_firemouthflame)
            vsp = -13
        }
        if ((key_jump || (key_jump2 && vsp >= 0)) && realdoublejump <= 0 && sprite_index != spr_player_firemouthspin_reverse)
        {
            GamepadSetVibration(0, 0.2, 0.4)
            sprite_index = spr_player_firemouthspin_reverse
            repeat irandom_range(3, 5)
            {
                with (instance_create((x + random_range(-50, 50)), (y + random_range(0, obj_negativenumber)), obj_highjumpcloud2))
                {
                    vspeed = 2
                    sprite_index = spr_cloudeffect
                }
            }
            fmod_event_one_shot_3d("event:/sfx/firemouth/jump", x, y)
            repeat irandom_range(1, 3)
                instance_create(x, y, obj_firemouthflame)
            vsp = -9
        }
        if grounded
        {
            doublejump = 0
            if (move != 0)
            {
                if (movespeed <= 8)
                    movespeed += 0.5
                xscale = move
            }
            else
                movespeed = Approach(movespeed, 0, 0.5)
            if (dir != xscale)
            {
                dir = xscale
                movespeed = 0
            }
            if (sprite_index != spr_player_firemouthshoot)
            {
                hsp = (xscale * movespeed)
                if (hsp != 0)
                    sprite_index = spr_firemouth
                else
                    sprite_index = spr_player_firemouthidle
                if (key_shoot2 && (sprite_index == spr_firemouth || sprite_index == spr_player_firemouthidle))
                {
                    fmod_event_one_shot_3d("event:/sfx/firemouth/jump", x, y)
                    if (movespeed > 0)
                        movespeed -= 0.4
                    image_index = 0
                    sprite_index = spr_player_firemouthshoot
                }
            }
            else
            {
                if (movespeed > 0)
                    movespeed -= 0.3
                if (sprite_index == spr_player_firemouthshoot && floor(image_index) == 3)
                {
                    repeat irandom_range(3, 5)
                        instance_create(x, y, obj_firemouthflame)
                    with (instance_create(((x + (floor(movespeed) * xscale)) + 2), y, obj_firemouth_projectile))
                        image_xscale = other.xscale
                    image_index = 4
                }
                if (sprite_index == spr_player_firemouthshoot && floor(image_index) == (image_number - 1))
                {
                    sprite_index = spr_firemouth
                    image_index = 0
                }
            }
        }
        else if (sprite_index != spr_player_firemouthdash)
        {
            dir = xscale
            if (sprite_index != spr_player_firemouthspin_reverse)
                sprite_index = spr_player_firemouthspin
            if (move != 0)
            {
                if (move != xscale)
                {
                    if (movespeed > 0)
                        movespeed -= 0.5
                    if (movespeed <= 0)
                        xscale = move
                }
                else if (movespeed < 8)
                    movespeed += 0.5
            }
            if ((!doublejump) && input_buffer_slap > 0)
            {
                GamepadSetVibration(0, 1, 1, 0.8)
                input_buffer_slap = 0
                doublejump = 1
                repeat irandom_range(3, 5)
                    instance_create(x, y, obj_firemouthflame)
                sprite_index = spr_player_firemouthdash
                realdoublejump = 5
                image_index = 0
                if (move != 0)
                    xscale = move
                fmod_event_one_shot_3d("event:/sfx/firemouth/dash", (x + (12 * xscale)), y)
                dir = xscale
                movespeed = 12
            }
            else if (key_shoot2 && firemouthballbuffer == 0)
            {
                fmod_event_one_shot_3d("event:/sfx/firemouth/jump", x, y)
                repeat irandom_range(3, 5)
                    instance_create(x, y, obj_firemouthflame)
                with (instance_create(((x + (floor(movespeed) * xscale)) + 2), y, obj_firemouth_projectile))
                    image_xscale = other.xscale
                firemouthballbuffer = 20
                image_index = 0
            }
            hsp = (xscale * movespeed)
        }
        else
        {
            hsp = (xscale * movespeed)
            vsp = 0
            if (floor(image_index) == (image_number - 1))
                sprite_index = spr_player_firemouthspin
        }
        if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && (!(place_meeting((x + hsp), y, obj_tntblock))) && (!(place_meeting((x + hsp), y, obj_iceblock))) && (!(place_meeting((x + hsp), y, obj_ratblock))))
            movespeed = 0
        if (firemouth_afterimage > 0)
            firemouth_afterimage--
        else if ((collision_flags & (1 << 0)) == 0)
        {
            firemouth_afterimage = 8
            with (create_firemouth_afterimage(x, y, sprite_index, (image_index - 1), xscale))
                playerid = other.id
        }
    }
    else
    {
        hsp = 0
        movespeed = 0
    }
    if (sprite_index == spr_firemouthend && floor(image_index) == (image_number - 1))
    {
        alarm[5] = 2
        alarm[7] = 60
        state = (0 << 0)
        sprite_index = spr_idle
        image_index = 0
    }
    if (sprite_index == spr_firemouthintro && image_index > 22 && firemouthflames == 0)
    {
        repeat irandom_range(8, 11)
            instance_create(x, y, obj_firemouthflame)
        firemouthflames = 1
    }
    if (sprite_index == spr_firemouth)
    {
        if (movespeed < 4)
            image_speed = 0.35
        else if (movespeed > 4 && movespeed < 8)
            image_speed = 0.45
        else
            image_speed = 0.6
    }
    if (sprite_index == spr_player_firemouthspin_reverse)
    {
        image_speed = (abs(vsp) / 7)
        if (image_speed < 0.3)
            image_speed = 0.3
    }
    else if (sprite_index == spr_player_firemouthspin)
    {
        image_speed = (abs(vsp) / 10)
        if (image_speed < 0.25)
            image_speed = 0.25
    }
    else
        image_speed = 0.35
    if (hsp != 0 && (floor(image_index) == 0 || floor(image_index) == 2) && steppy == 0 && grounded)
        steppy = 1
    if (floor(image_index) != 0 && floor(image_index) != 2)
        steppy = 0
    if ((!instance_exists(obj_dashcloud)) && grounded && hsp != 0)
    {
        with (instance_create(x, y, obj_dashcloud))
            image_xscale = other.xscale
    }
}

