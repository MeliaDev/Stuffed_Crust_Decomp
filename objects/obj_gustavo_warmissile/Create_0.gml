baddieID = instance_nearest(x, y, obj_baddie)
direction = 0
speed = 6
image_speed = 0.35
image_angle = direction
depth = -200
alarm[1] = 1
snd = fmod_event_create_instance("event:/sfx/enemies/homing")
