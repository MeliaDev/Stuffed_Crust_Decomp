pal_swap_init_system(8)
global.roommessage = lang_get_value("room_towermansion")
with (obj_music)
    add_music(room, "event:/music/hub", "event:/music/pillarmusic", 0, hub_state)
if global.panic
{
    with (obj_door)
        instance_create((x + 50), (y + 96), obj_rubble)
    with (obj_bossdoor)
        instance_create((x + 50), (y + 96), obj_rubble)
    instance_destroy(obj_door)
    instance_destroy(obj_bossdoor)
}
