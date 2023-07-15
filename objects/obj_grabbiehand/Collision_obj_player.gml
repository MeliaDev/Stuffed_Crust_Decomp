if (state != (55 << 0) && other.state != (52 << 0) && x == xstart && y == ystart && (!thumbingup))
{
    with (other)
    {
        fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
        fmod_event_instance_play(other.snd)
        if (state != (61 << 0) && state != (84 << 0))
        {
            tauntstoredmovespeed = movespeed
            tauntstoredvsp = vsp
            tauntstoredsprite = sprite_index
            tauntstoredstate = state
        }
        with (instance_create(x, (y - 5), obj_parryeffect))
        {
            image_yscale = -1
            sprite_index = spr_grabhangeffect
            image_speed = 0.35
        }
        state = (106 << 0)
        if ispeppino
        {
            if (boxxed == 0)
                sprite_index = spr_player_catched
            else
                sprite_index = spr_boxxedpep_air
        }
        if ((!ispeppino) || character == "N")
        {
            if (boxxed == 0)
                sprite_index = spr_playerN_slipnslide
            else
                sprite_index = spr_playerN_boxxedfall
        }
        other.playerid = id
        other.state = (55 << 0)
        if (tauntstoredstate != (104 << 0) && tauntstoredstate != (121 << 0))
        {
            tauntstoredstate = (92 << 0)
            tauntstoredsprite = spr_jump
            tauntstoredmovespeed = 0
            tauntstoredvsp = 0
        }
        else if (tauntstoredstate == (104 << 0))
            sprite_index = spr_mach
        else if (tauntstoredstate == (121 << 0))
            sprite_index = spr_mach4
    }
}
