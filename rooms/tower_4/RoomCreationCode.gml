pal_swap_init_system(8)
global.roommessage = lang_get_value("room_tower4")
if (global.panic == 0)
    global.gameframe_caption_text = "The filthy floor of the Pizza Tower"
if global.panic
{
    with (obj_door)
        instance_create((x + 50), (y + 96), obj_rubble)
    with (obj_bossdoor)
        instance_create((x + 50), (y + 96), obj_rubble)
    instance_destroy(obj_door)
    instance_destroy(obj_bossdoor)
}
global.door_sprite = spr_door
global.door_index = 3
scr_random_granny()
