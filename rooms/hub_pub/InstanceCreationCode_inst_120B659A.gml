if (global.levelcomplete && (!global.pinballcutscene))
{
    currentroom = room
    scene_info = [[function() //anon_gml_RoomCC_hub_pub_2_Create_100_gml_RoomCC_hub_pub_2_Create
    {
        with (obj_player)
        {
            state = (0 << 0)
            x = backtohubstartx
            y = backtohubstarty
        }
        global.levelcomplete = 0
        global.pinballcutscene = 1
        global.levelcompletename = -4
        quick_ini_write_real(get_savefile_ini(), "cutscene", "pinball", 1)
        cutscene_end_action()
    }
], [cutscene_save_game]]
}
else if global.levelcomplete
{
    global.levelcomplete = 0
    scene_info = [[cutscene_save_game]]
}
else
    scene_info = [[cutscene_wait, 20]]
