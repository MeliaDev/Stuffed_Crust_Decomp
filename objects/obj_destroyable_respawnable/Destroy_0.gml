with (instance_create((x + 30), (y + 30), obj_sausageman_dead))
{
    if (other.object_index == obj_destroyable_respawnable_large)
        sprite_index = spr_bigdoughblockdead
    else
        sprite_index = spr_doughblockdead
}
if (room == custom_lvl_room)
    tile_layer_delete_at(1, x, y)
with (obj_player1)
{
    if (sprite_index == spr_mach1 || sprite_index == spr_mach)
    {
        if (machpunchAnim == 0)
            machpunchAnim = 1
    }
}
scr_sleep(5)
tile_layer_delete_at(1, x, y)
scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
with (instance_create(x, y, obj_destroyable_respawner))
{
    image_xscale = other.image_xscale
    image_yscale = other.image_yscale
    sprite_index = other.sprite_index
    content = other.object_index
    spawn_buffer = 70
}
