switch state
{
    case (0 << 0):
        targetplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
        var _g = distance_to_point(targetplayer.x, targetplayer.y)
        if (_g < 150)
            movespeed = 2
        else if (_g < 300)
            movespeed = 3
        else if (_g < 450)
            movespeed = 7
        else
            movespeed = 11
        var _d = point_direction(x, y, targetplayer.x, targetplayer.y)
        hsp = lengthdir_x(movespeed, _d)
        vsp = lengthdir_y(movespeed, _d)
        image_xscale = (targetplayer.x != x ? sign((targetplayer.x - x)) : image_xscale)
        x += hsp
        y += vsp
        if (blur_effect > 0)
            blur_effect--
        else
        {
            blur_effect = 2
            with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), image_xscale))
                playerid = other.id
        }
        break
    case (291 << 0):
        var acc = 0.05
        if (!fadein)
        {
            image_alpha = Approach(image_alpha, 0, acc)
            with (playerid)
            {
                hsp = 0
                vsp = 0
                movespeed = 0
                x = hitX
                y = hitY
                image_alpha = other.image_alpha
            }
            if (image_alpha <= 0)
            {
                fadein = 1
                with (playerid)
                {
                    x = roomstartx
                    y = roomstarty
                    ghostdash = 0
                    ghostpepper = 0
                    other.x = other.xstart
                    other.y = other.ystart
                }
            }
        }
        else
        {
            image_alpha = Approach(image_alpha, 1, acc)
            with (playerid)
            {
                image_alpha = other.image_alpha
                if (image_alpha >= 1)
                {
                    state = (0 << 0)
                    other.state = (0 << 0)
                    other.image_alpha = other.start_alpha
                }
            }
        }
        break
}

fmod_event_instance_set_3d_attributes(snd, x, y)
if (!fmod_event_instance_is_playing(snd))
    fmod_event_instance_play(snd)
