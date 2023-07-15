function scr_player_hang() //scr_player_hang
{
    hsp = 0
    if (sprite_index == spr_playerN_wallclingstart && floor(image_index) == (image_number - 1))
        sprite_index = spr_playerN_wallcling
    vsp = 0
    wallclingcooldown = 0
    if (floor(image_index) == (image_number - 1))
    {
        fmod_event_one_shot_3d("event:/sfx/noise/spin", x, y)
        jumpstop = 0
        if key_up
            vsp = -18
        else
            vsp = -13
        state = (92 << 0)
        sprite_index = spr_playerN_noisebombspinjump
        image_index = 0
        with (instance_create(x, y, obj_jumpdust))
            image_xscale = other.xscale
    }
    image_speed = 0.35
}

