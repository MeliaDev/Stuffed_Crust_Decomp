ini_open_from_string(obj_savesystem.ini_str)
var _destroyed = ini_read_real("Tutorial", "finished", 0)
obj_savesystem.ini_str = ini_close()
if _destroyed
{
    room_goto(Titlescreen)
    with (obj_player)
    {
        targetRoom = Titlescreen
        targetDoor = "A"
        state = (18 << 0)
        sprite_index = spr_player_victory
    }
    instance_create_unique(0, 0, 979)
}
x = -200
y = 402
ystart = y
movespeed = 8
vsp = 0
grav = 0.5
boulder_x = (room_width + 1000)
boulder_y = 402
boulder_index = 0
with (obj_player)
    state = (18 << 0)
fade = 0
whitefade = 0
image_speed = 0.35
depth = -10
fade = 1
state = 1
if (!obj_player.ispeppino)
    sprite_index = spr_playerN_mach
if (obj_player1.character == "N" || (obj_player1.character == "P" && obj_player1.ispeppino == 0))
    state = 4
