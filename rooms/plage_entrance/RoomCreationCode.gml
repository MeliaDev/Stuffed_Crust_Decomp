pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER ISLAND"
global.gameframe_caption_text = "Party time in the Pizza Tower"
with (obj_music)
{
    if (!global.panic)
        fmod_set_parameter("musicmuffle", 1, 0)
}
