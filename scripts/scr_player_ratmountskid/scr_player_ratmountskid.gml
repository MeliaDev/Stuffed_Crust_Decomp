function scr_player_ratmountskid() //scr_player_ratmountskid
{
    hsp = (xscale * (-movespeed))
    movespeed = Approach(movespeed, 0, 0.8)
    if brick
        sprite_index = spr_ratmount_skid
    else
        sprite_index = spr_lonegustavo_skid
    gustavodash = 0
    ratmount_movespeed = 8
    image_speed = 0.4
    if (abs(movespeed) <= 0 || abs(hsp) <= 0)
    {
        movespeed = 0
        state = (191 << 0)
    }
    if (input_buffer_jump > 0 && can_jump && sprite_index != spr_player_ratmountswallow)
    {
        particle_set_scale((4 << 0), xscale, 1)
        create_particle(x, y, (4 << 0), 0)
        fmod_event_one_shot_3d("event:/sfx/pep/jump", x, y)
        if (brick && (!key_shoot))
            sprite_index = spr_player_ratmountjump
        else if (ratmount_movespeed >= 12)
            sprite_index = spr_lonegustavo_dashjump
        else
            sprite_index = spr_player_ratmountgroundpound
        image_index = 0
        if (state != (191 << 0))
            xscale *= -1
        input_buffer_jump = 0
        movespeed = hsp
        jumpAnim = 1
        state = (192 << 0)
        vsp = -11
        jumpstop = 0
    }
    if (brick && key_shoot2)
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
    if (input_buffer_slap > 0 && key_up && brick)
    {
        input_buffer_slap = 0
        ratmount_kickbrick()
        movespeed = (-movespeed)
        hsp = movespeed
        ratmount_movespeed = 8
    }
    if (input_buffer_slap > 0 && (!key_up))
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
            movespeed = (-movespeed)
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
    if ((!instance_exists(dashcloudid)) && grounded)
    {
        with (instance_create(x, y, obj_dashcloud))
        {
            image_xscale = other.xscale
            if other.brick
                sprite_index = spr_ratdust
            other.dashcloudid = id
        }
    }
}

