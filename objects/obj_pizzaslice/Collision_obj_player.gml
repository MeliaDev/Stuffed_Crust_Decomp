if (obj_player1.character == "V")
{
    if (global.playerhealth > 8)
        global.playerhealth += 1
    else
        global.playerhealth = 8
}
var val = heat_calculate(10)
if (other.object_index == obj_player1)
    global.collect += val
else
    global.collectN += val
global.heattime += 25
global.heattime = clamp(global.heattime, 0, 60)
with (obj_camera)
    healthshaketime = 40
create_collect(x, y, sprite_index, val)
with (instance_create((x + 16), y, obj_smallnumber))
    number = string(val)
scr_sound_multiple("event:/sfx/misc/collect", x, y)
instance_destroy()
