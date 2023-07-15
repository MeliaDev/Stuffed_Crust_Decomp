if other.key_up2
{
    fmod_event_one_shot_3d("event:/sfx/firemouth/dash", x, y)
    fmod_event_one_shot_3d("event:/sfx/firemouth/jump", x, y)
    repeat irandom_range(2, 8)
    {
        with (instance_create(x, (y - 20), obj_firemouthflame))
            depth = (other.depth - 1)
    }
    global.heatmeter ^= 1
    ini_open_from_string(obj_savesystem.ini_str)
    ini_write_real("HeatMeter", "IsOn", global.heatmeter)
    obj_savesystem.ini_str = ini_close()
    if (global.heatmeter == 1)
    {
        alarm[4] = irandom_range(35, 80)
        create_transformation_tip(lang_get_value("heatmeter_on"))
    }
    else
        create_transformation_tip(lang_get_value("heatmeter_off"))
}
