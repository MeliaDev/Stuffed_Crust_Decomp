if other.key_up2
{
    global.panictilt ^= 1
    ini_open_from_string(obj_savesystem.ini_str)
    ini_write_real("PanicTilt", "IsOn", global.panictilt)
    obj_savesystem.ini_str = ini_close()
    if (global.panictilt == 1)
        create_transformation_tip("yes panic tilt")
    else
        create_transformation_tip("no panic tilt")
}
