var v = id
with (other)
{
    if (state != (97 << 0) && state != (186 << 0) && state != (146 << 0))
    {
        if (state == (47 << 0) || state == (48 << 0) || state == (38 << 0))
        {
            with (instance_create(x, y, obj_knightdebris))
                image_index = 0
            with (instance_create(x, y, obj_knightdebris))
                image_index = 1
            with (instance_create(x, y, obj_knightdebris))
                image_index = 2
            with (instance_create(x, y, obj_knightdebris))
                image_index = 3
            with (instance_create(x, y, obj_knightdebris))
                image_index = 4
            with (instance_create(x, y, obj_knightdebris))
                image_index = 5
        }
        if (state == (51 << 0))
            instance_create(x, y, obj_bombexplosion)
        x = other.x
        if (other.image_yscale == 1)
            instance_create(x, (y - 20), obj_bangeffect)
        if (other.image_yscale == 1)
        {
            if isgustavo
            {
                if brick
                    sprite_index = spr_player_ratmountballoonend1
                else
                    sprite_index = spr_lonegustavo_superspring
            }
            else
                sprite_index = spr_superspringplayer
            state = (97 << 0)
            vsp = -10
        }
        else
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
            freefallsmash = 14
            vsp = 10
        }
        with (other)
        {
            if (sprite_index != activatespr)
            {
                if (sprite_index == spr_bottle_idle || sprite_index == spr_bottle_activate)
                {
                    repeat (5)
                    {
                        if (image_yscale == -1)
                        {
                            with (instance_create(x, (y + 40), obj_bubbles))
                                yscale = -1
                        }
                        else
                            instance_create(x, (y - 40), obj_bubbles)
                    }
                    fmod_event_one_shot_3d("event:/sfx/misc/bottlepop", x, y)
                }
                fmod_event_one_shot_3d("event:/sfx/misc/superspring", x, y)
            }
        }
        with (instance_create(x, y, obj_speedlinesup))
        {
            playerid = other.id
            image_yscale = v.image_yscale
        }
        other.image_index = 0
        other.sprite_index = other.activatespr
    }
}
