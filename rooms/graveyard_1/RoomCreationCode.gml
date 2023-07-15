pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER WITH THE DEAD"
global.gameframe_caption_text = "Smells like death in the Pizza Tower"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_graveyard_1_Create_274_gml_Room_graveyard_1_Create
    {
        if secret_check_trigger(0)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_graveyard_1_Create_407_gml_Room_graveyard_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_graveyard_1_Create_490_gml_Room_graveyard_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
