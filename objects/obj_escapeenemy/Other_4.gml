if (ds_list_find_index(global.baddieroom, id) != -1)
    instance_destroy()
else if (global.panic == 1)
    alarm[0] = 5
