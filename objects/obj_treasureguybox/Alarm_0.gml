if (current_arr > (array_length(content_arr) - 1))
    return;
scr_sound_multiple("event:/sfx/misc/collect", x, y)
global.heattime += 10
global.heattime = clamp(global.heattime, 0, 60)
global.combotime += 10
global.combotime = clamp(global.combotime, 0, 60)
with (obj_camera)
    healthshaketime = 30
var val = heat_calculate(10)
global.collect += val
if (current_month == 12)
    create_collect(x, y, choose(2864, 2866, 2868, 2870, 2872), val)
else if (current_month == 10)
    create_collect(x, y, choose(2750, 2752, 2756, 2757, 2758), val)
else if obj_player1.isgustavo
    create_collect(x, y, choose(2092, 3232, 2567, 4429, 3887, 2094), val)
else if (obj_player1.character == "S")
    create_collect(x, y, 62, val)
else if (obj_player1.character == "P" && obj_player1.ispeppino)
    create_collect(x, y, choose(2089, 2091, 2092, 2094, 2090), val)
else if (obj_player1.character == "N" || (obj_player1.character == "P" && (!obj_player1.ispeppino)))
    create_collect(x, y, choose(2750, 2752, 2756, 2757, 2758, 2864, 2866, 2868, 2870, 2872), val)
with (instance_create((x + 16), y, obj_smallnumber))
    number = string(val)
if (current_arr <= ((count * 2) + 2))
    alarm[0] = count
current_arr++
