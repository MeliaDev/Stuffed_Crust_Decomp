if (ds_list_find_index(global.saveroom, id) == -1)
{
    with (instance_create((x + 32), (y + 32), obj_sausageman_dead))
        sprite_index = other.spr_dead
    scr_sleep(5)
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    fmod_event_one_shot_3d("event:/sfx/misc/breakblock", x, y)
    fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
    ds_list_add(global.saveroom, id)
}
