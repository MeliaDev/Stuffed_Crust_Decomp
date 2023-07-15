pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER ISLAND"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_street_john_Create_193_gml_Room_street_john_Create
    {
        touchedtriggers = 0
    }
, function() //anon_gml_Room_street_john_Create_234_gml_Room_street_john_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_street_john_Create_356_gml_Room_street_john_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_street_john_Create_445_gml_Room_street_john_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
