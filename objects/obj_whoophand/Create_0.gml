event_inherited()
direction = point_direction(x, y, obj_player1.x, obj_player1.y)
image_angle = direction
speed = 2
hurtbuffer = 10
dir = 1
alarm[0] = 80
stop = 0
alarm[1] = 1
fmod_event_one_shot_3d("event:/sfx/enemies/minijohnpunch", x, y)
