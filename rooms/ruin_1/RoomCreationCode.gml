pal_swap_init_system(8)
global.roommessage = "RUINS OF THE PIZZA TOWER"
global.gameframe_caption_text = "A bit cheesy, like Pizza Tower"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_ruin_1_Create_261_gml_Room_ruin_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_ruin_1_Create_349_gml_Room_ruin_1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_ruin_1_Create_476_gml_Room_ruin_1_Create
    {
        secret_open_portal(2)
    }
)
}
