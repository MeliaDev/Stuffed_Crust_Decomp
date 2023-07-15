function scr_player_ratmount() //scr_player_ratmount
{
    move = (key_left + key_right)
    doublejump = 0
    if (!move)
    {
        if (windingAnim > 0)
            windingAnim -= 2
    }
    if (ratgrabbedID != noone && (!instance_exists(ratgrabbedID)))
        ratgrabbedID = noone
    hsp = movespeed
    var r = ratmount_movespeed
    if ((place_meeting((x + xscale), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_destructibles)))) || (abs(movespeed) < 8 && move != xscale) || (!key_attack) || abs(movespeed) <= 6)
    {
        gustavodash = 0
        ratmount_movespeed = 8
    }
    if grounded
    {
        if (ratshootbuffer > 0)
            ratshootbuffer -= 1
        else
            ratshootbuffer = 0
    }
    if (ratmissilecool > 0)
        ratmissilecool -= 0.5
    else
        ratmissilecool = 0
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_destructibles))) && gustavodash != 51)
    {
        movespeed = 0
        if (r >= 14)
        {
            var _bump = ledge_bump((vsp >= 0 ? 32 : 22))
            if _bump
            {
                fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
                state = (106 << 0)
                if brick
                    sprite_index = spr_player_ratmountbump
                else
                    sprite_index = spr_lonegustavo_bump
                image_index = 0
                instance_create((x + (xscale * 15)), (y + 10), obj_bumpeffect)
                hsp = ((-xscale) * 4)
                vsp = -5
                with (obj_camera)
                {
                    shake_mag = 4
                    shake_mag_acc = (5 / room_speed)
                }
            }
        }
    }
    if (ratmount_movespeed >= 14 && gustavodash != 51)
    {
        instance_create(x, y, obj_jumpdust)
        gustavodash = 51
    }
    if (ratmount_movespeed >= 14 || gusdashpadbuffer > 0)
    {
        if (!instance_exists(chargeeffectid))
        {
            with (instance_create(x, y, obj_chargeeffect))
            {
                playerid = other.object_index
                other.chargeeffectid = id
            }
        }
    }
    if (move != xscale && move != 0 && gusdashpadbuffer <= 0 && sprite_index != spr_lonegustavo_kick)
    {
        xscale = move
        if (abs(movespeed) > 2 && abs(hsp) > 2 && grounded)
        {
            fmod_event_one_shot_3d("event:/sfx/pep/backslide", x, y)
            state = (204 << 0)
            movespeed = abs(movespeed)
        }
    }
    if (gusdashpadbuffer > 0 && movespeed != 0)
        xscale = sign(movespeed)
    if (gusdashpadbuffer > 0)
        gusdashpadbuffer--
    if (gusdashpadbuffer <= 0)
    {
        if (move != 0)
        {
            if (move == xscale)
                movespeed = Approach(movespeed, (xscale * ratmount_movespeed), 0.5)
            else
                movespeed = Approach(movespeed, 0, 0.5)
        }
        else
            movespeed = Approach(movespeed, 0, 0.5)
    }
    else
    {
        if brick
            ratmount_movespeed = 14
        else
            ratmount_movespeed = 16
        movespeed = (xscale * ratmount_movespeed)
    }
    if (abs(movespeed) > 2)
        image_speed = (abs(movespeed) / 14)
    else
        image_speed = 0.35
    if (sprite_index == spr_player_ratmountmach3 || sprite_index == spr_lonegustavo_mach3 || sprite_index == spr_gustavo_grab)
        image_speed = 0.4
    var front = (scr_solid((x + sign(hsp)), y) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
    if brick
    {
        if (!landAnim)
        {
            if (hsp != 0 && (!front))
            {
                if (ratmount_movespeed >= 14 || gusdashpadbuffer > 0)
                {
                    if (windingAnim < 2000)
                        windingAnim++
                    sprite_index = spr_player_ratmountmach3
                }
                else if key_attack
                    sprite_index = spr_player_ratmountattack
                else
                    sprite_index = spr_player_ratmountmove
            }
            else
            {
                image_speed = 0.35
                if (sprite_index != spr_player_ratmountidleanim)
                {
                    if (windingAnim < 1800)
                        sprite_index = spr_player_ratmountidle
                    else
                        sprite_index = spr_player_ratmounttumble
                    if (ratgrabbedID == noone)
                    {
                        if (idle < 400)
                            idle++
                        if (idle >= 150)
                        {
                            sprite_index = spr_player_ratmountidleanim
                            image_index = 0
                        }
                    }
                }
                else if (floor(image_index) == (image_number - 1))
                {
                    idle = 0
                    sprite_index = spr_player_ratmountidle
                }
            }
        }
        if (floor(image_index) == (image_number - 1))
        {
            landAnim = 0
            if (sprite_index == spr_player_ratmountland)
                sprite_index = spr_player_ratmountidle
        }
        if (sprite_index == spr_player_ratmountland)
            image_speed = 0.35
    }
    else if (hsp != 0 && (!front))
    {
        if (ratmount_movespeed >= 14 || gusdashpadbuffer > 0)
        {
            if (windingAnim < 2000)
                windingAnim++
            sprite_index = spr_lonegustavo_mach3
            if (ratmount_movespeed >= 17)
                sprite_index = spr_gustavo_grab
        }
        else if key_attack
            sprite_index = spr_lonegustavo_dash
        else
            sprite_index = spr_lonegustavo_walk
    }
    else
    {
        image_speed = 0.2
        if (sprite_index != spr_lonegustavo_grabbable && sprite_index != spr_intro_gustavomap && sprite_index != spr_gustavo_givepizza && sprite_index != spr_gustavo_makepizza && sprite_index != spr_gustavo_showpizza && sprite_index != spr_gustavo_point)
        {
            if (windingAnim < 1800)
                sprite_index = spr_lonegustavo_idle
            else
                sprite_index = spr_lonegustavo_grabbable
            if (idle < 400)
                idle++
            if (idle >= 200)
            {
                sprite_index = choose(spr_lonegustavo_grabbable, spr_intro_gustavomap, spr_gustavo_givepizza, spr_gustavo_makepizza, spr_gustavo_showpizza)
                image_index = 0
                if (sprite_index == spr_gustavo_givepizza)
                    image_index = 6
                image_speed = 0.25
                if (sprite_index == spr_gustavo_showpizza || sprite_index == spr_lonegustavo_grabbable)
                    image_speed = 0.15
                if (sprite_index == spr_intro_gustavomap)
                    image_speed = 0.5
            }
        }
        else if (floor(image_index) == (image_number - 1))
        {
            if (sprite_index == spr_gustavo_givepizza)
                sprite_index = spr_gustavo_point
            else
            {
                idle = 0
                sprite_index = spr_lonegustavo_idle
            }
        }
    }
    if (hsp != 0 && grounded && vsp > 0 && (!front))
    {
        if (steppybuffer > 0)
            steppybuffer--
        else
        {
            create_particle(x, (y + 43), (1 << 0), 0)
            steppybuffer = 18
            fmod_event_one_shot_3d("event:/sfx/pep/step", x, y)
        }
    }
    if (input_buffer_jump > 0 && can_jump && gusdashpadbuffer == 0 && state != (204 << 0))
    {
        if (windingAnim < 2000)
            windingAnim++
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
        {
            sprite_index = spr_lonegustavo_dashjump
            if (ratmount_movespeed >= 17)
                sprite_index = spr_gustavo_grab
        }
        else
            sprite_index = spr_player_ratmountgroundpound
        image_index = 0
        jumpAnim = 1
        state = (192 << 0)
        if (ratmount_movespeed >= 12)
            vsp = (-((ratmount_movespeed + 2)))
        else
            vsp = -13
        jumpstop = 0
    }
    if ((!grounded) && sprite_index != spr_player_ratmountswallow)
    {
        state = (192 << 0)
        jumpAnim = 0
        if (windingAnim < 2000)
            windingAnim++
        if (ratmount_movespeed >= 14)
        {
            if brick
                sprite_index = spr_player_ratmountdashjump
            else
            {
                sprite_index = spr_lonegustavo_dashjump
                if (ratmount_movespeed >= 17)
                    sprite_index = spr_gustavo_grab
            }
        }
        else if brick
            sprite_index = spr_player_ratmountfall
        else if (!brick)
        {
            if gusuppercutbuff
                sprite_index = spr_lonegustavo_jump
            else
                sprite_index = spr_player_ratmountgroundpoundfall
        }
    }
    if (key_attack && grounded && (!(place_meeting((x + xscale), y, obj_solid))))
    {
        move = xscale
        if brick
        {
            if (ratmount_movespeed < 14)
                ratmount_movespeed = Approach(ratmount_movespeed, 14, 0.15)
        }
        else if (ratmount_movespeed < 18)
            ratmount_movespeed = Approach(ratmount_movespeed, 18, 0.12)
    }
    if brick
    {
        if (input_buffer_slap > 0 && key_up && gusdashpadbuffer == 0)
        {
            input_buffer_slap = 0
            ratmount_kickbrick()
            if (state == (204 << 0))
            {
                movespeed = (-movespeed)
                hsp = movespeed
            }
        }
        else if key_shoot2
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
    }
    else if (input_buffer_slap > 0 && key_up && (!gusuppercutbuff))
    {
        jumpstop = 1
        gusuppercutbuff = 1
        ratshootbuffer = 0
        state = (197 << 0)
        input_buffer_slap = 0
        image_index = 0
        sprite_index = spr_lonegustavo_jumpstart
        fmod_event_instance_play(snd_uppercut)
        vsp = -14
        movespeed = hsp
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
    }
    if (input_buffer_slap > 0 && (!key_up) && gusdashpadbuffer == 0)
    {
        if (key_attack || (!brick) || ratshootbuffer > 0)
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
        else if (ratshootbuffer == 0)
        {
            ratshootbuffer = 30
            state = (193 << 0)
            ratmount_movespeed = 14
            sprite_index = spr_player_ratmountattack
            image_index = 0
        }
    }
    if (sprite_index == spr_gustavo_grab && floor(image_index) == (image_number - 1))
        image_index = 3
    if ((!instance_exists(dashcloudid)) && grounded && ratmount_movespeed >= 14)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            if other.brick
                sprite_index = spr_ratdust
            other.dashcloudid = id
        }
    }
    if ((key_down && grounded && vsp > 0 && gusdashpadbuffer <= 0) || scr_solid(x, y))
    {
        state = (260 << 0)
        if (brick == 1)
        {
            with (instance_create(x, y, obj_brickcomeback))
                wait = 1
        }
        brick = 0
    }
    with (ratgrabbedID)
        scr_enemy_ratgrabbed()
    ratmount_shootpowerup()
    ratmount_dotaunt()
}

function ratmount_dotaunt() //ratmount_dotaunt
{
    if (key_taunt2 && state != (84 << 0) && brick && gusdashpadbuffer == 0)
    {
        notification_push((54 << 0), [room])
        tauntstoredisgustavo = 1
        taunttimer = 20
        tauntstoredmovespeed = movespeed
        tauntstoredratmount_movespeed = ratmount_movespeed
        tauntstoredsprite = sprite_index
        tauntstoredstate = state
        tauntstoredvsp = vsp
        state = (84 << 0)
        if ((!supercharged) || (!key_up))
        {
            scr_create_parryhitbox()
            fmod_event_one_shot_3d("event:/sfx/pep/taunt", x, y)
            sprite_index = spr_player_ratmounttaunt
            image_index = irandom((sprite_get_number(sprite_index) - 1))
            with (instance_create(x, y, obj_taunteffect))
                player = other.id
        }
        else if (supercharged && key_up)
        {
            ini_open_from_string(obj_savesystem.ini_str)
            ini_write_real("Game", "supertaunt", 1)
            obj_savesystem.ini_str = ini_close()
            fmod_event_one_shot_3d("event:/sfx/pep/supertaunt", x, y)
            sprite_index = spr_player_ratmountsupertaunt
            image_index = 0
        }
    }
}

function ratmount_kickbrick() //ratmount_kickbrick
{
    var _pad = 32
    fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", (x + (image_xscale * _pad)), y)
    with (instance_create((x + (image_xscale * _pad)), y, obj_brickball))
    {
        if (other.state == (192 << 0) || other.state == (198 << 0))
            up = 1
        image_xscale = other.xscale
        xoffset = _pad
    }
    state = (197 << 0)
    sprite_index = spr_lonegustavo_kick
    image_index = 0
    image_speed = 0.35
    gustavokicktimer = 5
    brick = 0
}

function ratmount_shootpowerup() //ratmount_shootpowerup
{
    if (key_shoot2 && ratpowerup != -4 && ratshootbuffer <= 0)
    {
        switch ratpowerup
        {
            case 660:
                with (instance_create((x + (20 * xscale)), y, obj_playernoisearrow))
                    direction = point_direction(x, y, (x + (other.xscale * 4)), y)
                break
            case 377:
                with (instance_create((x + (20 * xscale)), (y + 20), obj_playersmokehitbox))
                {
                    spd += (other.movespeed / 2)
                    image_xscale = other.xscale
                }
                break
            case 676:
                with (instance_create((x + (20 * xscale)), y, obj_playerspikecheese))
                {
                    spd += other.movespeed
                    image_xscale = other.xscale
                }
                break
        }

        ratshootbuffer = 30
    }
}

