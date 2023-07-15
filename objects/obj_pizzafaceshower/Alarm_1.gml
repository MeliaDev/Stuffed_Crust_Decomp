start = 1
if (obj_player1.x > x)
    instance_destroy()
ini_open_from_string(obj_savesystem.ini_str)
if ini_read_real("Game", "shower", 0)
    instance_destroy()
ini_close()
