image_xscale = playerid.xscale
if (playerid.sprite_index == spr_knightpep_attack)
    x = (playerid.x + (8 * playerid.xscale))
else
    x = playerid.x
y = playerid.y
if (playerid.sprite_index != spr_knightpep_attack && playerid.state != (147 << 0) && playerid.state != (6 << 0))
    instance_destroy()
