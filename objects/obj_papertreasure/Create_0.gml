event_inherited()
function anon_gml_Object_obj_papertreasure_Create_0_33_gml_Object_obj_papertreasure_Create_0() //anon_gml_Object_obj_papertreasure_Create_0_33_gml_Object_obj_papertreasure_Create_0
{
    if (global.papercutscene == -4 || (!global.papercutscene))
    {
        global.papercutscene = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "paper", 1)
    }
}

if (global.papercutscene == -4)
    global.papercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "paper", 0)
if global.papercutscene
    instance_destroy()
