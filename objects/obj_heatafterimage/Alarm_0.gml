x = obj_player1.x
y = obj_player1.y
if (global.stylethreshold < 3)
    visible = false
else
    visible = obj_player1.visible
if (room == rank_room)
    visible = false
if (global.stylethreshold == 2)
    alpha = 0.25
if (global.stylethreshold == 3)
    alpha = 0.5
if (room == rank_room)
    visible = false
if instance_exists(obj_pizzaface_thunderdark)
    alpha = 0.2
Vspeed = random_range(-1, 1)
Hspeed = random_range(-1, 1)
alarm[0] = 10
