if (playerid != noone)
{
    visible = false
    if (playerid.state != (184 << 0) && playerid.state != (185 << 0) && playerid.state != (61 << 0))
    {
        visible = true
        create_particle(x, y, (9 << 0))
        playerid = -4
    }
}
else
    visible = true
