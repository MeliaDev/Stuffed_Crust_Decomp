function cutscene_desert_end() //cutscene_desert_end
{
    with (obj_player)
    {
        state = (0 << 0)
        x = backtohubstartx
        y = backtohubstarty
    }
    global.levelcomplete = 0
    global.desertcutscene = 1
    quick_ini_write_real(get_savefile_ini(), "cutscene", "desert", 1)
    cutscene_end_action()
}

