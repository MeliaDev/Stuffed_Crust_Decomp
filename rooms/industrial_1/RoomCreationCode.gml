pal_swap_init_system(8)
global.roommessage = "WELCOME TO PIZZA TOWER"
global.gameframe_caption_text = "Mass-produced Pizza Tower"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_industrial_1_Create_248_gml_Room_industrial_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_industrial_1_Create_336_gml_Room_industrial_1_Create
    {
        secret_open_portal(1)
    }
)
}
