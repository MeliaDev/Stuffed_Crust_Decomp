function scr_player_bossintro() //scr_player_bossintro
{
    hsp = 0
    xscale = 1
    hurted = 0
    inv_frames = 0
    if ((!ispeppino) || character == "N")
    {
        if (sprite_index == spr_player_bossintro)
            sprite_index = spr_playerN_bossintro
        if (sprite_index == spr_player_levelcomplete)
            sprite_index = spr_noise_vulnerable1
        if (sprite_index == spr_playerN_bossintro && floor(image_index) == (image_number - 1))
        {
            state = (0 << 0)
            image_index = 0
        }
        if (sprite_index == spr_noise_vulnerable1loop && floor(image_index) == (image_number - 1))
            image_index = 0
        if (sprite_index == spr_noise_vulnerable1 && floor(image_index) == (image_number - 1))
            sprite_index = spr_noise_vulnerable1loop
        else
            image_speed = 0.35
    }
    else
    {
        if (sprite_index == spr_player_bossintro)
        {
            if (sprite_index == spr_player_bossintro && floor(image_index) == (image_number - 1))
            {
                state = (0 << 0)
                image_index = 0
            }
        }
        if (sprite_index == spr_player_levelcomplete && floor(image_index) == (image_number - 1))
            image_speed = 0
        else
            image_speed = 0.35
    }
}

