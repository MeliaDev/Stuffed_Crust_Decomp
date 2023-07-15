pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER ISLAND"
ini_open_from_string(obj_savesystem.ini_str)
ini_write_real("RatmountTut", "HasDone", 1)
obj_savesystem.ini_str = ini_close()
