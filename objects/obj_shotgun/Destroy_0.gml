if (ds_list_find_index(global.saveroom, id) == -1)
{
    repeat (4)
        create_debris(x, y, 3597)
    with (instance_create(x, y, obj_parryeffect))
        sprite_index = spr_morthookgrabeffect
    ds_list_add(global.saveroom, id)
}
