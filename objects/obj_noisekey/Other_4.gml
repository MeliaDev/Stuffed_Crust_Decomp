ini_open_from_string(obj_savesystem.ini_str)
var save = "w3stick"
if (ini_read_real(save, "bosskey", 0) == 0 || ini_read_real(save, "noisekey", 0))
    instance_destroy()
ini_close()
