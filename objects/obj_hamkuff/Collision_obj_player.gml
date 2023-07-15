if (state != (138 << 0))
{
    if (!other.isgustavo)
    {
        if (other.state != (121 << 0) || (!other.launched))
        {
            if (state != (206 << 0))
            {
                sprite_index = spr_hamkuff_chain1
                state = (206 << 0)
                playerid = other.id
            }
        }
        else
        {
            fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
            instance_destroy()
        }
    }
    else if (other.brick && state != (206 << 0))
    {
        other.brick = 0
        state = (206 << 0)
        sprite_index = spr_hamkuff_chain1
        state = (206 << 0)
        with (other)
        {
            state = (196 << 0)
            xscale = (-other.image_xscale)
            movespeed = 6
            vsp = -10
        }
        with (instance_create(other.x, other.y, obj_brickcomeback))
        {
            trapped = 1
            baddieID = other.id
            other.playerid = id
        }
    }
    else if (other.state == (259 << 0) || other.ratmount_movespeed >= 12)
    {
        fmod_event_one_shot_3d("event:/sfx/pep/punch", x, y)
        instance_destroy()
    }
    else
        scr_hurtplayer(other)
}
