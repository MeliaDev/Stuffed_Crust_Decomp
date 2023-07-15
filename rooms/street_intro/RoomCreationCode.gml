pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER ISLAND"
global.gameframe_caption_text = "The mean Pizza Tower streets"
with (obj_secretbigblock)
    particlespr = spr_streetdebris
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(function() //anon_gml_Room_street_intro_Create_311_gml_Room_street_intro_Create
    {
        touchedtriggers = 0
    }
, function() //anon_gml_Room_street_intro_Create_352_gml_Room_street_intro_Create
    {
        if (touchedtriggers >= 6)
            secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_street_intro_Create_474_gml_Room_street_intro_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_street_intro_Create_563_gml_Room_street_intro_Create
    {
        if secret_check_trigger(2)
            secret_open_portal(2)
    }
)
}
