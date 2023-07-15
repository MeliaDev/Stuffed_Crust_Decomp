function scr_player_dynamite() //scr_player_dynamite
{
    move = (key_left + key_right)
    if grounded
    {
        hsp = (xscale * movespeed)
        if (movespeed > 0)
            movespeed -= 0.1
    }
    landAnim = 0
    if (move == (-xscale))
        hsp = 0
    if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerV_dynamitethrow)
    {
        if (move != 0)
            xscale = move
        if (key_attack && hsp != 0)
            state = (104 << 0)
        else
            state = (0 << 0)
    }
    image_speed = 0.4
}

