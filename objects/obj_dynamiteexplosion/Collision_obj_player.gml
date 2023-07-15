with (other)
{
    if (other.hurtplayer == 0)
    {
        if key_jump2
        {
            vsp = -24
            if (state == (0 << 0) || state == (92 << 0) || hsp == 0)
            {
                sprite_index = spr_playerV_superjump
                state = (92 << 0)
            }
            image_index = 0
            jumpAnim = 1
            jumpstop = 1
            other.hurtplayer = 1
        }
    }
}
