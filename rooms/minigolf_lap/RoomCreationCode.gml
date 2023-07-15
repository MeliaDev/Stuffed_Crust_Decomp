pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER ISLAND"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_minigolf_lap_Create_184_gml_Room_minigolf_lap_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_minigolf_lap_Create_265_gml_Room_minigolf_lap_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
}
