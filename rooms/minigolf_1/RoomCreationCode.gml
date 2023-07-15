pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER ISLAND"
global.gameframe_caption_text = "The most devilish Pizza Tower course"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_minigolf_1_Create_264_gml_Room_minigolf_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_minigolf_1_Create_352_gml_Room_minigolf_1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
}
