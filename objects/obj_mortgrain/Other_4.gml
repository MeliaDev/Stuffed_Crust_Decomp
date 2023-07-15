if (ds_list_find_index(global.saveroom, id) != -1)
{
    if (global.lap == 0)
    {
        eaten = 1
        if instance_exists(obj_well)
        {
            with (obj_well)
                eaten = 1
        }
    }
}
