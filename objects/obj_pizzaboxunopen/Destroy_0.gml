if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (!(place_meeting(x, y, obj_gnomecustomer)))
    {
        with (create_debris(x, (y - 32), 1479, 0))
            image_index = 0
        with (create_debris(x, (y + 32), 1479, 0))
            image_index = 1
        with (create_debris((x - 10), y, 1479, 0))
            image_index = 2
        with (create_debris(x, y, 1479, 0))
            image_index = 3
        with (create_debris((x + 10), y, 1479, 0))
            image_index = 4
        fmod_event_one_shot_3d("event:/misc/breakblock", x, y)
    }
    ds_list_add(global.saveroom, id)
}
if (snd != -4)
{
    fmod_event_instance_stop(snd, 1)
    fmod_event_instance_release(snd)
}
