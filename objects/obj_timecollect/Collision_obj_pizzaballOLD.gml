if (obj_player1.character == "V")
    global.playerhealth_threshold += 10
global.heattime = 60
with (obj_camera)
    healthshaketime = 60
instance_destroy()
global.collect += 100
create_collect(x, y, sprite_index, val)
with (instance_create((x + 16), y, obj_smallnumber))
    number = "100"
