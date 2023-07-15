if (room == forest_G2)
    targetRoom = forest_G1
if (room == forest_G1)
    targetRoom = forest_G2
targetDoor = "F"
john = 1
ini_open_from_string(obj_savesystem.ini_str)
if (ini_read_string("RatmountTut", "HasDone", 0) == 0)
    instance_destroy()
ini_close()
