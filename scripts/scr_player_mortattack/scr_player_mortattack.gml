function scr_player_mortattack() //scr_player_mortattack
{
    image_speed = 0.45
    hsp = movespeed
    if (floor(image_index) == (image_number - 1))
    {
        if (grounded && vsp > 0)
        {
            state = (11 << 0)
            sprite_index = spr_player_mortidle
            landAnim = 0
        }
        else
        {
            state = (12 << 0)
            sprite_index = spr_player_mortjump
        }
    }
    if (punch_afterimage > 0)
        punch_afterimage--
    else
    {
        punch_afterimage = 5
        with (create_mach3effect(x, y, sprite_index, image_index, 1))
            image_xscale = other.xscale
    }
}

