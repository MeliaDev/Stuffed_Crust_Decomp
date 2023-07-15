pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER OF THE WEST"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_badland_8b_Create_245_gml_Room_badland_8b_Create
    {
        touchedtriggers = 0
    }
, function() //anon_gml_Room_badland_8b_Create_286_gml_Room_badland_8b_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_badland_8b_Create_401_gml_Room_badland_8b_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_badland_8b_Create_484_gml_Room_badland_8b_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
