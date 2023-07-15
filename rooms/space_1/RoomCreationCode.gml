pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER IN SPACE"
global.gameframe_caption_text = "Way beyond the Pizza Tower"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_space_1_Create_315_gml_Room_space_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_space_1_Create_412_gml_Room_space_1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_space_1_Create_542_gml_Room_space_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
