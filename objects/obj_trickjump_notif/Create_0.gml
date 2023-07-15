title_index = 0
title = 0
vsp = 0
alpha = 3
depth = -10
alarm[0] = 3
image_speed = 0
ramp_points = (obj_player1.ramp_points - 1)
if (ramp_points > 6)
{
    sprite_index = spr_resulttextOMG
    if (irandom(100) >= 75)
        sprite_index = choose(spr_resulttextSICK, spr_resulttextNUTS)
}
