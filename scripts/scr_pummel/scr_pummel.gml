function scr_pummel() //scr_pummel
{
    if (character == "N" || (character == "P" && ispeppino == 0))
        sprite_index = choose(spr_playerN_suplexmash1, spr_playerN_suplexmash2, spr_playerN_suplexmash3, spr_playerN_suplexmash4, spr_playerN_punch)
    else
        sprite_index = choose(spr_player_suplexmash1, spr_player_suplexmash2, spr_player_suplexmash3, spr_player_suplexmash4, spr_player_suplexmash5, spr_player_suplexmash6, spr_player_suplexmash7, spr_player_punch)
    image_index = 0
    state = (91 << 0)
    movespeed = 4
    vsp = -3
}

