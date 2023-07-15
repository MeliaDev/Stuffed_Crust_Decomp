if (ds_list_find_index(global.saveroom, id) == -1)
{
    if (sprite_index == sprite387)
    {
        with (instance_create((x + 32), (y + 32), obj_sausageman_dead))
            sprite_index = spr_bigdoughblockdead
    }
    else
    {
        repeat (8)
        {
            with (create_debris((x + random_range(0, 64)), (y + random_range(0, 64)), debris, 1))
            {
                hsp = random_range(-5, 5)
                vsp = random_range(-10, 10)
                image_speed = 0.35
                depth = (obj_player.depth + 10)
            }
        }
        repeat (3)
        {
            with (instance_create((x + random_range(0, 64)), (y + random_range(0, obj_pizzahead_cog)), obj_parryeffect))
            {
                sprite_index = spr_deadjohnsmoke
                image_speed = 0.35
                depth = (obj_player.depth + 10)
            }
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
    if (global.shootkeyattack == 4)
    {
        if (global.fuel < 5)
        {
            if (irandom(100) == 7 || irandom(100) == 77)
            {
                with (instance_create((x + 32), (y + 32), obj_ammocollect))
                    sprite_index = spr_fuelHUD
            }
        }
    }
    if (content != obj_null)
    {
        with (instance_create((x + 32), y, content))
        {
            secretjumped = 0
            savedsecretinvincible = invincible
            state = (266 << 0)
        }
    }
    scr_sleep(5)
    notification_push((45 << 0), [room])
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}
