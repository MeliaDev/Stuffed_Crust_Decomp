if (sprite_index == spr_player_move)
{
    if (steppy > 0)
        steppy--
    else
    {
        steppy = 8
        create_particle(x, (y + 43), (1 << 0))
    }
}
