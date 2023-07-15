if (state != (55 << 0) && x == xstart && y == ystart)
{
    with (other)
    {
        other.playerid = id
        other.state = (55 << 0)
        if (state == (4 << 0))
        {
            state = (0 << 0)
            with (playerid)
                bombgrabID = -4
        }
    }
}
