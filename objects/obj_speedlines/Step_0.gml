x = playerid.x
y = playerid.y
image_xscale = playerid.xscale
if (abs(playerid.hsp) <= 0 || playerid.state != (121 << 0) || playerid.state == (165 << 0) || abs(playerid.movespeed) <= 12 || (playerid.collision_flags & (1 << 0)) > 0 || playerid.cutscene || playerid.state == (95 << 0) || playerid.state == (112 << 0) || room == timesuproom)
    instance_destroy()
if (room == timesuproom)
    instance_destroy()
