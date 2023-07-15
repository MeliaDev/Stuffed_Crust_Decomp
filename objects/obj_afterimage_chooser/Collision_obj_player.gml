if other.key_up2
{
    global.blueeffects += 1
    if (global.blueeffects > 4)
        global.blueeffects = 0
    with (other)
        machreset = 1
    ini_open_from_string(obj_savesystem.ini_str)
    ini_write_real("AfterImage", "Type", global.blueeffects)
    obj_savesystem.ini_str = ini_close()
    create_transformation_tip(lang_get_value("afterimage_toggle"))
    if instance_exists(obj_afterimage_chooser_example)
    {
        alarm[4] = 60
        destroystuff = 1
    }
    else
        alarm[4] = 10
}
