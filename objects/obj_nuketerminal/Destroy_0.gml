if (ds_list_find_index(global.saveroom, id) == -1)
{
    instance_create_unique(0, 0, 422)
    fmod_event_one_shot("event:/sfx/ui/wartimerup")
    with (obj_wartimer)
    {
        addseconds += other.seconds
        while (other.minutes > 0)
        {
            other.minutes--
            addseconds += 60
        }
        alarm[0] = -1
        alarm[2] = 1
    }
    for (var i = 0; i < sprite_get_number(spr_warterminal_debris); i++)
    {
        with (create_debris(x, y, 2960))
            image_index = i
    }
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
    notification_push((45 << 0), [room])
}
