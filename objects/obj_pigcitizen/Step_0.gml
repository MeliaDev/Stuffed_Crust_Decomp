switch state
{
    case (0 << 0):
        if (!global.panic)
        {
            image_speed = 0.15
            sprite_index = walkspr
            if (randombuffer > 0)
                randombuffer--
            else
            {
                randombuffer = (80 + irandom(50))
                var _move = irandom(100)
                image_xscale = choose(-1, 1)
                if (_move > 50)
                    movespeed = 1
                else
                    movespeed = 0
            }
            hsp = (movespeed * image_xscale)
            if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
                image_xscale *= -1
            if (movespeed == 0)
                image_index = 0
        }
        else
        {
            image_speed = 0.35
            sprite_index = panicspr
            hsp = (image_xscale * 5)
            if (randombuffer > 0)
                randombuffer--
            else
            {
                randombuffer = (80 + irandom_range(-40, 80))
                image_xscale = choose(-1, 1)
            }
            if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
                image_xscale *= -1
        }
        if (obj_player.state == (84 << 0) && bbox_in_camera(view_camera[0], 50))
        {
            if (state != (84 << 0))
                fmod_event_one_shot_3d("event:/sfx/voice/pigphoto", x, y)
            tauntstoredhsp = hsp
            tauntstoredvsp = vsp
            state = (84 << 0)
            hsp = 0
            vsp = 0
            if (x != obj_player.x)
                image_xscale = sign((obj_player.x - x))
            if (ds_list_find_index(global.saveroom, id) == -1)
            {
                ds_list_add(global.saveroom, id)
                notification_push((22 << 0), [room, id])
            }
        }
        break
    case (84 << 0):
        sprite_index = tauntspr
        if (obj_player.state != (84 << 0))
        {
            state = (0 << 0)
            hsp = tauntstoredhsp
            vsp = tauntstoredvsp
        }
        break
}

scr_collide()
