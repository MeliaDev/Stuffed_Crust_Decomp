if (state == (55 << 0))
{
    with (obj_player1)
    {
        if ((!ispeppino) || character == "N")
        {
            if (boxxed == 0)
            {
                if (sprite_index == spr_player_catched)
                    sprite_index = spr_playerN_slipnslide
            }
            else if (sprite_index == spr_boxxedpep_air)
                sprite_index = spr_playerN_boxxedfall
        }
    }
}
