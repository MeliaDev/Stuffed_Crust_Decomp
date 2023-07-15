if (!instance_exists(playerid))
{
    instance_destroy()
    return;
}
else
{
    image_speed = 0.35
    image_xscale = playerid.xscale
    x = playerid.x
    y = playerid.y
    if (playerid == obj_player1 || playerid == obj_player2)
    {
        if (global.combo < 25 || playerid.state != (0 << 0))
            instance_destroy()
    }
}
