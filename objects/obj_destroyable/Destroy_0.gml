if (room == custom_lvl_room)
    tile_layer_delete_at(1, x, y)
if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (sprite_index == spr_solid)
    {
        with (instance_create(x, y, obj_sausageman_dead))
        {
            image_speed = 0
            sprite_index = spr_solid
            image_index = other.image_index
        }
    }
    else if (sprite_index == spr_destroyable)
    {
        with (instance_create((x + 30), (y + 30), obj_sausageman_dead))
            sprite_index = spr_doughblockdead
    }
    else
    {
        repeat (2)
        {
            with (create_debris((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), debrisspr, 1))
            {
                hsp = random_range(-5, 5)
                vsp = random_range(-10, 10)
                image_speed = 0.35
                depth = (obj_player.depth + 10)
            }
        }
    }
    if (sprite_index == spr_towerblocksmall)
    {
        with (instance_create((x + random_range(0, sprite_width)), (y + random_range(0, sprite_height)), obj_parryeffect))
        {
            sprite_index = spr_deadjohnsmoke
            image_speed = 0.35
            depth = (obj_player.depth + 10)
        }
    }
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
    ds_list_add(global.saveroom, id)
    notification_push((45 << 0), [room])
}
