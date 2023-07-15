pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER ISLAND"
global.gameframe_caption_text = "Getting drunk in the Pizza Tower"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_saloon_1_Create_253_gml_Room_saloon_1_Create
    {
        touchedtriggers = 0
    }
, function() //anon_gml_Room_saloon_1_Create_294_gml_Room_saloon_1_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_saloon_1_Create_410_gml_Room_saloon_1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
}
