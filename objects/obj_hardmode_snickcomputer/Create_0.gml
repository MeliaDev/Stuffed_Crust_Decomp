active = 0
switchmode = 0
var _found = 0
ini_open_from_string(obj_savesystem.ini_str)
if (ini_read_string("Game", "finalrank", "none") != "none")
    _found = 1
ini_close()
if _found
    active = 1
else
{
    active = 0
    image_speed = 0.25
}
depth = 100
scr_create_uparrowhitbox()
paletteselect = 0
showtext = 0
alpha = 0
if global.panic
    instance_destroy()
