scr_collide()
if (buffer > 0)
    buffer--
if (place_meeting(x, y, obj_destructibles) || place_meeting(x, y, obj_iceblock_breakable))
    depth = 102
else
    depth = 2
