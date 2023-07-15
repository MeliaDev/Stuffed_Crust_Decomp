function scr_destroy_destructibles(argument0, argument1) //scr_destroy_destructibles
{
    if (!(place_meeting((x + argument0), (y + argument1), obj_destructibles)))
        return;
    var _num = instance_place_list((x + argument0), (y + argument1), 538, global.instancelist, 0)
    if (_num > 0)
    {
        for (var i = 0; i < ds_list_size(global.instancelist); i++)
            instance_destroy(ds_list_find_value(global.instancelist, i))
        ds_list_clear(global.instancelist)
    }
}

