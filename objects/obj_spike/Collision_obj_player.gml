if (other.state != (113 << 0))
{
    scr_hurtplayer(other)
    if fake
        instance_destroy()
}
else
{
    with (other)
    {
        state = (106 << 0)
        if (!isgustavo)
            sprite_index = spr_bump
        else if brick
            sprite_index = spr_player_ratmountbump
        else
            sprite_index = spr_lonegustavo_bump
        image_index = 0
        hsp = (-6 * xscale)
        vsp = -4
        repeat (3)
            create_debris(x, y, 1511)
    }
}
