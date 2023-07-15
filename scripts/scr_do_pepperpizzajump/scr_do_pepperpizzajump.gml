function scr_do_pepperpizzajump() //scr_do_pepperpizzajump
{
    state = (254 << 0)
    jumpstop = 0
    if (character == "N" || (character == "P" && (!ispeppino)))
        sprite_index = spr_playerN_noisebombspinjump
    else
        sprite_index = spr_player_jetpackstart2
}

