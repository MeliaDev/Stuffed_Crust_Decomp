pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER ISLAND"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_beach_1_Create_252_gml_Room_beach_1_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
        else
            secret_close_portal(1)
    }
)
    secret_add(function() //anon_gml_Room_beach_1_Create_420_gml_Room_beach_1_Create
    {
        touchedtriggers = 0
    }
, function() //anon_gml_Room_beach_1_Create_464_gml_Room_beach_1_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
}
