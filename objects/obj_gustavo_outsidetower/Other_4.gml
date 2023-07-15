ini_open_from_string(obj_savesystem.ini_str)
var _destroyed = ini_read_real("Tutorial", "finished", 0)
ini_close()
if _destroyed
    instance_destroy()
