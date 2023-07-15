function scr_player_thrown() //scr_player_thrown
{
    image_speed = 0.35
    if (sprite_index == spr_player_outofpizza1 && (character != "P" || (!ispeppino)))
        sprite_index = spr_slipbanan1
    hsp = (movespeed * (-xscale))
    if (place_meeting((x + sign(hsp)), y, obj_solid) && (!grounded))
    {
        xscale *= -1
        movespeed /= 2
    }
    if (grounded && vsp > -1)
    {
        hsp = 0
        if (sprite_index == spr_player_outofpizza2)
        {
            fmod_event_one_shot("event:/sfx/misc/bossdefeattonk")
            sprite_index = spr_player_outofpizza3
            image_index = 0
        }
        if (sprite_index == spr_slipbanan1)
        {
            fmod_event_one_shot("event:/sfx/misc/bossdefeattonk")
            sprite_index = spr_slipbanan2
            image_index = 0
        }
    }
    if (grounded && vsp > 0 && sprite_index != spr_player_outofpizza1 && sprite_index != spr_player_outofpizza2 && sprite_index != spr_player_outofpizza3 && sprite_index != spr_player_outofpizza4 && sprite_index != spr_slipbanan1 && sprite_index != spr_slipbanan2)
    {
        state = (0 << 0)
        movespeed = 0
        sprite_index = spr_idle
        inv_frames = 1
        alarm[1] = 15
        hitstunned = 0
    }
    if ispeppino
    {
        if (image_index > (image_number - 1))
        {
            switch sprite_index
            {
                case spr_player_outofpizza1:
                    sprite_index = spr_player_outofpizza2
                    image_index = 0
                    break
                case 1100:
                    sprite_index = spr_player_outofpizza4
                    image_index = 0
                    break
            }

        }
    }
}

