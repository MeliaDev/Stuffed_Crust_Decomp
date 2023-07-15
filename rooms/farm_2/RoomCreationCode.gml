pal_swap_init_system(8)
global.roommessage = "COW STACK"
global.gameframe_caption_text = "Why did the chicken cross the Pizza Tower?"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_farm_2_Create_323_gml_Room_farm_2_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_farm_2_Create_417_gml_Room_farm_2_Create
    {
        if secret_check_trigger(1)
            secret_open_portal(1)
    }
)
}
