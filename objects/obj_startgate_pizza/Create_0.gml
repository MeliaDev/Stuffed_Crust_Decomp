image_speed = 0.35
state = 0
vsp = 0
grav = 0.5
rank_scale = 0
rank_index = 0
lastcollect = 0
color_array = array_create(999, 0)
for (var i = 0; i < array_length(color_array); i++)
{
    if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
        color_array[i] = (choose(irandom(6)) + 1)
    else
        color_array[i] = choose(irandom(3))
}
