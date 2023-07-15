if use_collision
    scr_collide()
if place_meeting(x, y, obj_destructibles)
    image_alpha = 0
else if place_meeting(x, y, obj_iceblock_breakable)
    image_alpha = 0.5
else
    image_alpha = 1
