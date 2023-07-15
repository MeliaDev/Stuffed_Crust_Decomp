pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER ISLAND"
global.gameframe_caption_text = "A forest in the Pizza Tower"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_forest_1_Create_258_gml_Room_forest_1_Create
    {
        if secret_check_trigger(0)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_forest_1_Create_386_gml_Room_forest_1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_forest_1_Create_510_gml_Room_forest_1_Create
    {
        secret_open_portal(2)
    }
)
}
