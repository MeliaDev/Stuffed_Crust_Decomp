pal_swap_init_system(8)
global.roommessage = "WELCOME TO PIZZA TOWER"
global.gameframe_caption_text = "A John graveyard... in the Pizza Tower"
if (!obj_secretmanager.init)
{
    trace("secret init")
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_entrance_1_Create_356_gml_Room_entrance_1_Create
    {
        touchedtriggers = 0
    }
, function() //anon_gml_Room_entrance_1_Create_400_gml_Room_entrance_1_Create
    {
        if (touchedtriggers >= 4)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_entrance_1_Create_527_gml_Room_entrance_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_entrance_1_Create_627_gml_Room_entrance_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
