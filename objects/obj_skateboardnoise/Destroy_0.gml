scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
create_debris(x, y, 1514)
create_debris(x, y, 1512)
if (playerid != noone)
{
    with (playerid)
    {
        xscale = other.image_xscale
        sprite_index = spr_player_skateboard
        state = (106 << 0)
        sprite_index = spr_bump
        hsp = ((-xscale) * 4)
        vsp = -5
        fmod_event_one_shot_3d("event:/sfx/pep/bumpwall", x, y)
    }
}
fmod_event_instance_stop(snd, 1)
fmod_event_instance_release(snd)
