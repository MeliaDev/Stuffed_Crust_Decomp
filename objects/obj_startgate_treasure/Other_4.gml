if (level != -4)
{
    ini_open_from_string(obj_savesystem.ini_str)
    collect = ini_read_real("Treasure", level, 0)
    ini_close()
}
