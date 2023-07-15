if other.key_up2
{
    if active
    {
        alarm[4] = 10
        active = 0
        sprite_index = spr_snickchallengecomputer_static
        image_index = 0
        image_speed = 0.25
        switchmode = 1
        fmod_event_one_shot_3d("event:/sfx/ui/tvswitch", x, y)
        global.hardmode ^= 1
        ini_open_from_string(obj_savesystem.ini_str)
        ini_write_real("HardMode", "IsActive", global.hardmode)
        obj_savesystem.ini_str = ini_close()
        if (global.hardmode == 1)
            create_transformation_tip(lang_get_value("hardmode_on"))
        else
            create_transformation_tip(lang_get_value("hardmode_off"))
    }
    else if (switchmode == 0)
        create_transformation_tip(lang_get_value("hardmode_infotip"))
}
