switch state
{
    case (135 << 0):
        hsp = 0
        if (grounded && vsp > 0)
        {
            fmod_event_one_shot_3d("event:/sfx/noise/bombbounce", x, y)
            sprite_index = spr_playerN_noisebombland
            image_index = 0
            state = (136 << 0)
        }
        break
    case (0 << 0):
        hsp = (image_xscale * 6)
        if (floor(image_index) == (image_number - 1))
        {
            if (sprite_index == spr_playerN_noisebombland)
                sprite_index = spr_playerN_noisebomb
            if (sprite_index == spr_playerN_noisebombhitwall)
                sprite_index = spr_playerN_noisebomb
        }
        if (grounded && vsp > 0)
        {
            fmod_event_one_shot_3d("event:/sfx/noise/bombbounce", x, y)
            sprite_index = spr_playerN_noisebombland
            image_index = 0
            state = (136 << 0)
        }
        else if place_meeting((x + sign(hsp)), y, obj_solid)
        {
            sprite_index = spr_playerN_noisebombhitwall
            image_index = 0
            image_xscale *= -1
        }
        break
    case (136 << 0):
        hsp = 0
        vsp = 0
        if (floor(image_index) >= 5)
        {
            state = (0 << 0)
            vsp = -5
        }
        break
}

if (sprite_index == spr_playerN_noisebomb && cooldown <= 60)
    sprite_index = spr_playerN_noisebombflash
if (state != (135 << 0))
{
    if (cooldown > 0)
        cooldown--
    else
        instance_destroy()
}
scr_collide()
