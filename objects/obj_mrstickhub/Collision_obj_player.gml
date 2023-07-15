var total = (global.pigtotal - global.pigreduction)
if (other.key_up2 && total >= maxscore && (!unlocked))
{
    unlocked = 1
    ini_open_from_string(obj_savesystem.ini_str)
    ini_write_real(save, "unlocked", 1)
    ini_write_real(save, "reduction", maxscore)
    global.pigreduction += maxscore
    obj_savesystem.ini_str = ini_close()
    state = (8 << 0)
    gamesave_async_save()
}
