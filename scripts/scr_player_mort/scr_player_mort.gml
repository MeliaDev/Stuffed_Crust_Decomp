function scr_player_mort() //scr_player_mort
{
    move = (key_right + key_left)
    hsp = movespeed
    mort = 0
    doublejump = 0
    jumpstop = 0
    if (move != 0)
    {
        if (move == xscale)
        {
            var multi = 8
            if (sprite_index == spr_player_mortrun)
            {
                if (!fmod_event_instance_is_playing(mortslap))
                    fmod_event_instance_play(mortslap)
                multi = 10
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
            else
                multi = 8
            movespeed = Approach(movespeed, (xscale * multi), 0.8)
        }
        else
            movespeed = Approach(movespeed, 0, 0.8)
        if (movespeed <= 0)
            xscale = move
    }
    else
        movespeed = Approach(movespeed, 0, 0.8)
    if (move != 0 && grounded && vsp > 0)
    {
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            create_particle(x, (y + 43), (1 << 0), 0)
            steppybuffer = 16
        }
    }
    if (((movespeed < 3 && xscale == 1) || (movespeed > -3 && xscale == -1)) && move != 0)
        image_speed = 0.35
    else if ((movespeed > 3 && movespeed < 6 && xscale == 1) || (movespeed < -3 && movespeed > -6 && xscale == -1))
        image_speed = 0.45
    else
        image_speed = 0.6
    if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    {
        movespeed = 0
        if (sprite_index == spr_player_barrelmove)
            sprite_index = spr_player_barrelidle
    }
    if (!landAnim)
    {
        if (move != 0)
        {
            if key_attack
            {
                if (sprite_index != spr_player_mortrun)
                    image_index = 0
                sprite_index = spr_player_mortrun
            }
            else
                sprite_index = spr_player_mortwalk
        }
        else
            sprite_index = spr_player_mortidle
    }
    else if (floor(image_index) == (image_number - 1))
    {
        landAnim = 0
        if (move != 0)
            sprite_index = spr_player_mortwalk
        else
            sprite_index = spr_player_mortidle
    }
    if (!grounded)
    {
        state = (12 << 0)
        sprite_index = spr_player_mortjump
    }
    else if (input_buffer_jump > 0)
    {
        input_buffer_jump = 0
        state = (12 << 0)
        doublejump = 0
        vsp = -11
        sprite_index = spr_player_mortjumpstart
        image_index = 0
        scr_fmod_soundeffect(jumpsnd, x, y)
        create_particle(x, y, (4 << 0), 0)
        repeat (6)
            create_debris(x, y, 1541)
    }
    mort_attack()
}

function mort_attack() //mort_attack
{
    if (input_buffer_slap > 0)
    {
        input_buffer_slap = 0
        state = (13 << 0)
        sprite_index = spr_player_mortattackfront
        image_index = 0
        if (move != 0)
            xscale = move
        var _angle = 0
        if key_up
        {
            _angle = 90
            sprite_index = spr_player_mortattackup
        }
        else if (key_down && (!grounded))
        {
            if (!grounded)
                vsp = 3
            _angle = 270
            sprite_index = spr_player_mortattackdown
        }
        else
            movespeed = (xscale * 10)
        var xsc = xscale
        var spr = sprite_index
        with (instance_create(x, y, obj_morthitbox))
        {
            playerid = other.id
            if (_angle == 0)
                image_xscale = other.xscale
            image_angle = _angle
            with (instance_create(x, y, obj_parryeffect))
            {
                follow = 1
                if (spr == spr_player_mortattackup)
                    sprite_index = spr_mortswingup
                else if (spr == spr_player_mortattackdown)
                    sprite_index = spr_mortswingdown
                else
                    sprite_index = spr_mortswing
                image_xscale = xsc
            }
            repeat (6)
                create_debris(x, y, 1541)
            alarm[0] = 15
        }
    }
    if key_shoot
    {
        with (instance_create((x + (xscale * 20)), y, obj_shotgunbullet))
        {
            is_solid = 0
            image_xscale = other.xscale
            sprite_index = spr_mortprojectile
            spd = 18
        }
        image_index = 0
        sprite_index = spr_mortthrow
        state = (72 << 0)
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
        fmod_event_one_shot_3d("event:/sfx/mort/side", (x + hsp), y)
    }
    if (sprite_index == spr_player_mortattackdown || sprite_index == spr_player_mortattackup || sprite_index == spr_player_mortattack)
    {
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
    if (sprite_index == spr_player_mortattackfront)
        fmod_event_one_shot_3d("event:/sfx/mort/side", (x + hsp), y)
    else if (sprite_index == spr_player_mortattackup)
        fmod_event_one_shot_3d("event:/sfx/mort/up", x, (y + vsp))
    else if (sprite_index == spr_player_mortattackdown)
        fmod_event_one_shot_3d("event:/sfx/mort/down", x, (y + vsp))
}

function Mort_DownMovement() //Mort_DownMovement
{
    if (image_angle == 270)
    {
        with (playerid)
        {
            doublejump = 0
            vsp = -14
        }
    }
}

