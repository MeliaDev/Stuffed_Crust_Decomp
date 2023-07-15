if (room == timesuproom)
    instance_destroy()
switch state
{
    case (0 << 0):
        sprite_index = spr_kingghost
        var dir = point_direction(x, y, obj_player1.x, obj_player1.y)
        x = lerp(x, (obj_player1.x - (100 * obj_player1.xscale)), 0.05)
        y = lerp(y, (obj_player1.y - 100), 0.05)
        if (x != obj_player1.x)
            image_xscale = (-(sign((x - obj_player1.x))))
        break
    case (8 << 0):
        sprite_index = spr_kingghost_dash
        if ((!instance_exists(trapid)) || (distance_to_object(obj_player1) > trapid.player_distance_threshold && trapid.object_index != obj_tvtrap))
            state = (0 << 0)
        if instance_exists(trapid)
        {
            var xto = (trapid.x + trapid.xoffset)
            var yto = (trapid.y + trapid.yoffset)
            dir = point_direction(x, y, xto, yto)
            x = Approach(x, xto, abs(lengthdir_x(32, dir)))
            y = Approach(y, yto, abs(lengthdir_y(32, dir)))
            if (x == xto && y == yto)
                state = (141 << 0)
        }
        break
    case (141 << 0):
        if ((!instance_exists(trapid)) || (distance_to_object(obj_player1) > trapid.player_distance_threshold && trapid.object_index != obj_tvtrap && (trapid.object_index != obj_pinballtrap || trapid.sprite_index != spr_kingghost_pinball3)))
        {
            state = (0 << 0)
            with (trapid)
            {
                switch object_index
                {
                    case obj_anchortrap:
                        sprite_index = spr_kingghost_anchor
                        break
                    case 302:
                        sprite_index = spr_kingghost_spike
                        break
                    case 167:
                        sprite_index = spr_kingghost_tv
                        break
                    case 398:
                        sprite_index = spr_kingghost_pinball
                        break
                }

            }
            break
        }
        else
        {
            with (trapid)
            {
                switch object_index
                {
                    case obj_anchortrap:
                        sprite_index = spr_kingghost_anchor2
                        if (state != (135 << 0) && state != (92 << 0) && obj_player1.x > (x - 100) && obj_player1.x < (x + 100) && obj_player1.y > y && obj_player1.y < (y + 500))
                        {
                            fmod_event_one_shot_3d("event:/sfx/enemies/presentfall", x, y)
                            state = (135 << 0)
                            vsp = 10
                        }
                        break
                    case 302:
                        if (cooldown == 0 && state != (80 << 0) && obj_player1.x > (x - 200) && obj_player1.x < (x + 200) && obj_player1.y > (y - 100) && obj_player1.y < (y + 100))
                        {
                            state = (80 << 0)
                            sprite_index = spr_kingghost_spike3
                            fmod_event_one_shot_3d("event:/sfx/enemies/pizzardelectricity", x, y)
                            image_index = 0
                            attackbuffer = 30
                            cooldown = 50
                        }
                        if (state == (0 << 0))
                            sprite_index = spr_kingghost_spike2
                        break
                    case 167:
                        sprite_index = spr_kingghost_tv2
                        break
                    case 398:
                        if (sprite_index != spr_kingghost_pinball3)
                            sprite_index = spr_kingghost_pinball2
                        break
                }

            }
            break
        }
}

visible = state != (141 << 0)
if (distance_to_object(obj_player1) <= 200)
    alpha = 1
if alpha
    image_alpha = Approach(image_alpha, target_alpha, 0.01)
if (room == rank_room)
    instance_destroy()
fmod_event_instance_set_3d_attributes(snd_move, x, y)
if (state == (0 << 0))
{
    if (!fmod_event_instance_is_playing(snd_loop))
        fmod_event_instance_play(snd_loop)
    fmod_event_instance_set_3d_attributes(snd_loop, x, y)
}
else
    fmod_event_instance_stop(snd_loop, 1)
