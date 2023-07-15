function scr_soundtest_secret() //scr_soundtest_secret
{
    targetRoom = tower_soundtest
    soundtest = 1
    var found = 0
    ini_open_from_string(obj_savesystem.ini_str)
    var lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"]
    var i = 0
    while (i < array_length(lvl))
    {
        var b = lvl[i]
        if (ini_read_real("Secret", b, 0) < 3)
        {
            found = 1
            break
        }
        else
        {
            i++
            continue
        }
    }
    if (ini_read_string("Game", "finalrank", "none") == "none")
        found = 1
    ini_close()
    if found
        instance_destroy()
    if global.panic
        instance_destroy()
}

