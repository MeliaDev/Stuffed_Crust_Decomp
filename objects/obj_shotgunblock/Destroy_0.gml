scr_destroy_tiles(32, "Tiles_1")
if (ds_list_find_index(global.saveroom, id) == -1)
{
    notification_push((45 << 0), [room])
    with (create_debris((x + 32), (y + 32), 1011))
        image_index = 0
    with (create_debris((x + 32), (y + 32), 1011))
        image_index = 1
    with (create_debris((x + 32), (y + 32), 1011))
        image_index = 2
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}
