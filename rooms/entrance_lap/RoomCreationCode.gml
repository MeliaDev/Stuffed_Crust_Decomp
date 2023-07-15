pal_swap_init_system(8)
global.roommessage = "WELCOME TO PIZZA TOWER"
if (!obj_secretmanager.init)
{
    trace("secret init")
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_entrance_lap_Create_271_gml_Room_entrance_lap_Create
    {
        touchedtriggers = 0
    }
, function() //anon_gml_Room_entrance_lap_Create_312_gml_Room_entrance_lap_Create
    {
        if (touchedtriggers >= 4)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_entrance_lap_Create_431_gml_Room_entrance_lap_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_entrance_lap_Create_522_gml_Room_entrance_lap_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
