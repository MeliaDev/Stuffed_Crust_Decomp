text = lang_get_value("tutorial_lap")
lapgran = 1
if (global.lap != 0 || (!instance_exists(obj_lapportal)))
{
    instance_destroy()
    return;
}
