if (state == 0)
{
    if dirty
    {
        if savegame
        {
            savegame = 0
            state = 1
            with (obj_achievementtracker)
            {
                achievement_save_variables(achievements_update)
                achievement_save_variables(achievements_notify)
            }
            showicon = 1
            icon_alpha = 3
            buffer_async_group_begin("saves")
            savebuff = buffer_create(1, buffer_grow, 1)
            ini_open_from_string(ini_str)
            ini_write_real("Game", "percent", get_percentage())
            ini_write_real("Game", "minutes", global.file_minutes)
            ini_write_real("Game", "seconds", global.file_seconds)
            var closestring = ini_close()
            buffer_write(savebuff, buffer_string, closestring)
            buffer_save_async(savebuff, get_savefile_ini(), 0, buffer_get_size(savebuff))
            saveid = buffer_async_group_end()
        }
        else if saveoptions
        {
            saveoptions = 0
            state = 3
            buffer_async_group_begin("")
            savebuff = buffer_create(1, buffer_grow, 1)
            showicon = 1
            icon_alpha = 3
            buffer_write(savebuff, buffer_string, ini_str_options)
            buffer_save_async(savebuff, "saveData.ini", 0, buffer_get_size(savebuff))
            saveid = buffer_async_group_end()
        }
        else
            dirty = 0
    }
}
