with (other)
{
    if (((!instakillmove) || state == (104 << 0)) && state != (225 << 0) && state != (106 << 0) && other.state == (134 << 0) && state != (61 << 0))
    {
        fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
        vsp = -4
        hsp = (-3 * xscale)
        state = (106 << 0)
        if (!isgustavo)
            sprite_index = spr_bump
        else if brick
            sprite_index = spr_player_ratmountbump
        else
            sprite_index = spr_lonegustavo_bump
        image_index = 0
        other.state = (106 << 0)
        other.sprite_index = spr_clownmato_bounce
        other.image_index = 0
    }
}
