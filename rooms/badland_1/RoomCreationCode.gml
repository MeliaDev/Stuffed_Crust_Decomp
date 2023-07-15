pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER OF THE WEST"
global.gameframe_caption_text = "The weird Pizza Tower west"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_badland_1_Create_305_gml_Room_badland_1_Create
    {
        touchedtriggers = 0
    }
, function() //anon_gml_Room_badland_1_Create_346_gml_Room_badland_1_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_badland_1_Create_461_gml_Room_badland_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_badland_1_Create_544_gml_Room_badland_1_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
