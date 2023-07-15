pal_swap_init_system(8)
global.roommessage = "WELCOME TO PIZZA TOWER"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_factory_1_Create_189_gml_Room_factory_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_factory_1_Create_277_gml_Room_factory_1_Create
    {
        secret_open_portal(1)
    }
)
}
