image_speed = 0
image_index = 1
if (room != tower_entrancehall)
    instance_destroy(obj_pigtotal)
if (room == tower_entrancehall)
    alarm[0] = 2
if (room != rm_editor)
    depth = 50
roomname = room_get_name(room)
global.progress = string_letters(roomname)
drop = 0
drop_y = y
vsp = 0
grav = 0.5
dropstate = (0 << 0)
hand_y = (y - 1000)
handsprite = spr_grabbiehand_idle
handindex = 0
uparrow = 0
uparrowID = -4
snd = 0
