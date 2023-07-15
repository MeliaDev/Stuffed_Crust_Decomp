if (state == (150 << 0))
{
    if (floor(image_index) >= 11 && (!shot))
    {
        shot = 1
        with (playerid)
        {
            state = (150 << 0)
            tube_id = other.id
            if (other.stored_spd == 0)
                other.stored_spd = 1
            hsp = (other.hsp * other.movespeed)
            vsp = (other.vsp * other.movespeed)
            tube_vsp = (other.vsp * other.movespeed)
            stored_spd = 0
        }
    }
    else if (!shot)
    {
        with (playerid)
        {
            hsp = 0
            vsp = 0
        }
    }
    with (playerid)
    {
        if (!(place_meeting(x, y, other.id)))
        {
            with (other)
            {
                playerid = -1
                state = (0 << 0)
                shot = 0
            }
        }
    }
}
