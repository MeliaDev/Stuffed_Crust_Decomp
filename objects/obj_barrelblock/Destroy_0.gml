if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (4)
        create_debris((x + 32), (y + 32), 1510)
    ds_list_add(global.saveroom, id)
}
