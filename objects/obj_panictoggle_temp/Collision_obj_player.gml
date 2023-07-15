if other.key_up2
{
    global.panicbg ^= 1
    ini_open_from_string(obj_savesystem.ini_str)
    ini_write_real("PanicBG", "IsOn", global.panicbg)
    obj_savesystem.ini_str = ini_close()
    if (global.panicbg == 1)
        create_transformation_tip("yes panic bg")
    else
        create_transformation_tip("no panic bg")
}
