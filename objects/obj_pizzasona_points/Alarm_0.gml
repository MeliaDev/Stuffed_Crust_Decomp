collect -= 10
global.collect += 10
scr_sound_multiple("event:/sfx/misc/collect", x, y)
if (current_month == 10)
    create_collect((x + irandom_range(-40, 40)), (y + irandom_range(-40, 40)), choose(2750, 2752, 2756, 2757, 2758))
else if (current_month == 12)
    create_collect((x + irandom_range(-40, 40)), (y + irandom_range(-40, 40)), choose(2864, 2866, 2868, 2870, 2872))
else if (obj_player.character == "P" && obj_player.ispeppino)
    create_collect((x + irandom_range(-40, 40)), (y + irandom_range(-40, 40)), choose(2089, 2091, 2092, 2094, 2090))
else if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
    create_collect((x + irandom_range(-40, 40)), (y + irandom_range(-40, 40)), choose(2750, 2752, 2756, 2757, 2758, 2864, 2866, 2868, 2870, 2872))
else
    create_collect((x + irandom_range(-40, 40)), (y + irandom_range(-40, 40)), choose(2089, 2091, 2092, 2094, 2090))
if (collect > 0)
    alarm[0] = 5
else
    instance_destroy()
