if (ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id)
    repeat (4)
        create_debris(x, y, 2037)
    notification_push((6 << 0), [room])
    fmod_event_one_shot("event:/sfx/mort/cube")
}
