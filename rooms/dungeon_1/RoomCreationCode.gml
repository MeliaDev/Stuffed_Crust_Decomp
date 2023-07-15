pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER OF HELL!"
global.gameframe_caption_text = "Welcome to the Hell in the Pizza Tower"
if (!obj_secretmanager.init)
{
    obj_secretmanager.init = 1
    secret_add(-4, function() //anon_gml_Room_dungeon_1_Create_349_gml_Room_dungeon_1_Create
    {
        secret_open_portal(0)
    }
)
    secret_add(-4, function() //anon_gml_Room_dungeon_1_Create_440_gml_Room_dungeon_1_Create
    {
        secret_open_portal(1)
    }
)
    secret_add(-4, function() //anon_gml_Room_dungeon_1_Create_533_gml_Room_dungeon_1_Create
    {
        secret_open_portal(2)
    }
)
}
