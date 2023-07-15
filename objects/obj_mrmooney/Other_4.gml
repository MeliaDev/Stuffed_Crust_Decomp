ini_open_from_string(obj_savesystem.ini_str)
var w = "w5stick"
var unlocked = ini_read_real(w, "mooneyunlocked", 0)
var stickunlocked = ini_read_real(w, "unlocked", 0)
ini_close()
if ((!unlocked) && stickunlocked)
{
    if ((global.pigtotal - global.pigreduction) >= maxscore)
    {
        with (instance_create(0, 0, obj_mrsticknotification))
            sprite_index = spr_mrmooney_notification
    }
}
else
{
    instance_destroy(uparrowID)
    instance_destroy()
}
