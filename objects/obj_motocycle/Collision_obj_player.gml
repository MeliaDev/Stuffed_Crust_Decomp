with (other)
{
    if (other.buffer <= 0)
    {
        if (state == (121 << 0))
        {
            state = (32 << 0)
            movespeed = abs(hsp)
            sprite_index = spr_player_pizzacar
            dir = xscale
            jumpstop = 1
            if (vsp < 0)
                vsp = 0
            instance_destroy(other)
            create_transformation_tip(lang_get_value("weenietip"), "weenie")
        }
        else if (state == (42 << 0))
        {
            fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
            vsp = -5
            hsp = (-4 * xscale)
            state = (106 << 0)
            if (!isgustavo)
                sprite_index = spr_bump
            else if brick
                sprite_index = spr_player_ratmountbump
            else
                sprite_index = spr_lonegustavo_bump
            image_index = 0
        }
        else if (vsp > 0 && (!grounded))
        {
            xscale = sign(other.image_xscale)
            state = (32 << 0)
            movespeed = abs(hsp)
            sprite_index = spr_player_pizzacar
            dir = xscale
            jumpstop = 1
            if (vsp < 0)
                vsp = 0
            instance_destroy(other)
            create_transformation_tip(lang_get_value("weenietip"), "weenie")
        }
    }
}
