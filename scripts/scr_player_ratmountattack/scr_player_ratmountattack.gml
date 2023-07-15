function scr_player_ratmountattack() //scr_player_ratmountattack
{
    image_speed = 0.25
    ratdashnotif = 0
    ratshootbuffer = 30
    if (image_index < 2)
    {
        if (move != 0)
            xscale = move
    }
    hsp = (xscale * ratmount_movespeed)
    vsp = 0
    move = (key_left + key_right)
    landAnim = 0
    if (ratmount_movespeed < 18 && grounded)
        ratmount_movespeed += (0.5 * xscale)
    if brick
    {
        if key_attack2
        {
            particle_set_scale((5 << 0), xscale, 1)
            create_particle(x, y, (5 << 0), 0)
            input_buffer_slap = 0
            if (brick == 1)
            {
                with (instance_create(x, y, obj_brickcomeback))
                    wait = 1
            }
            brick = 0
            ratmountpunchtimer = 25
            gustavohitwall = 0
            state = (259 << 0)
            image_index = 0
            if (move != 0)
                xscale = move
            if grounded
                movespeed = (xscale * 16)
            else
                movespeed = (xscale * 14)
            sprite_index = spr_lonegustavo_punch
        }
        else if (input_buffer_slap > 0 && key_up && brick && gusdashpadbuffer == 0)
        {
            input_buffer_slap = 0
            ratmount_kickbrick()
            if (state == (204 << 0))
            {
                movespeed = (-movespeed)
                hsp = movespeed
            }
        }
        else if (!grounded)
        {
            if key_shoot2
            {
                if grounded
                {
                    if (ratmissilecool == 0)
                    {
                        sprite_index = spr_player_ratmountmissilecharge
                        image_index = 0
                        state = (194 << 0)
                        hsp = 0
                    }
                    else if (sprite_index != spr_player_ratmountidleanim)
                    {
                        sprite_index = spr_player_ratmountidleanim
                        image_index = 0
                    }
                }
                else
                {
                    ratdashnotif = 1
                    ratshootbuffer = 0
                    state = (197 << 0)
                    sprite_index = spr_lonegustavo_jumpstart
                    image_index = 0
                    image_speed = 0.35
                    gustavokicktimer = 5
                    brick = 0
                    movespeed = hsp
                    with (instance_create(x, (y + 50), obj_ratmountgroundpound))
                    {
                        image_xscale = other.xscale
                        image_index = 0
                    }
                }
            }
            else if key_jump
            {
                ratshootbuffer /= 2
                GamepadSetVibration(0, 0.8, 0.65)
                state = (198 << 0)
                instance_create(x, y, obj_highjumpcloud2)
                sprite_index = spr_player_ratmountwalljump
                image_index = 0
                vsp = -16
            }
        }
        else if grounded
        {
            if (input_buffer_jump > 0 && can_jump && gusdashpadbuffer == 0 && state != (204 << 0))
            {
                input_buffer_jump = 0
                particle_set_scale((4 << 0), xscale, 1)
                create_particle(x, y, (4 << 0), 0)
                scr_fmod_soundeffect(jumpsnd, x, y)
                if brick
                {
                    if ((ratmount_movespeed >= 14 && key_attack) || gusdashpadbuffer > 0)
                        sprite_index = spr_player_ratmountdashjump
                    else
                        sprite_index = spr_player_ratmountjump
                }
                else if ((ratmount_movespeed >= 14 && key_attack) || gusdashpadbuffer > 0)
                    sprite_index = spr_lonegustavo_dashjump
                else
                    sprite_index = spr_player_ratmountgroundpound
                image_index = 0
                jumpAnim = 1
                state = (192 << 0)
                vsp = -11
                jumpstop = 0
            }
        }
    }
    if (floor(image_index) == (image_number - 1))
    {
        if grounded
        {
            ratdashnotif = 1
            ratshootbuffer = 0
        }
        ratmount_movespeed = 0
        state = (191 << 0)
    }
    if (scr_solid((x + xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) || scr_solid_slope((x + sign(hsp)), y)) && (!(place_meeting((x + xscale), y, obj_destructibles))))
        ledge_bump((vsp >= 0 ? 32 : 22))
}

