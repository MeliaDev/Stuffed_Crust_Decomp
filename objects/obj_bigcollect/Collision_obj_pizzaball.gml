if (obj_player1.character == "V")
    global.playerhealth_threshold += 100
global.heattime = 60
with (obj_camera)
    healthshaketime = 60
if ((obj_player.character == "P" && obj_player.ispeppino == 0) || obj_player.character == "N")
    fmod_event_one_shot("event:/sfx/voice/noisepositive")
else
    fmod_event_one_shot("event:/sfx/misc/collectpizza")
instance_destroy()
global.combotime = 60
var val = heat_calculate(value)
global.collect += val
global.style += (5 + (global.combo / 10))
create_collect(x, y, sprite_index, val)
with (instance_create((x + 16), y, obj_smallnumber))
    number = string(val)
if (obj_player1.character == "V")
    tv_do_expression(3189)
else if (obj_player1.character == "N" || (!obj_player1.ispeppino))
    tv_do_expression(4250)
else
    tv_do_expression(971)
