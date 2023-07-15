if (room == rm_editor)
{
}
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    if (sprite_index == spr_bigbreakable)
    {
        scr_sleep(5)
        with (instance_create((x + 32), (y + 32), obj_parryeffect))
        {
            sprite_index = spr_bigpizzablockdead
            depth = (obj_player.depth + 10)
        }
    }
    else if (sprite_index == spr_halloweenbigblockescape || sprite_index == spr_xmasbigblockescape)
    {
        repeat (6)
        {
            with (create_debris((x + 32), (y + 32), sprite_index))
            {
                sprite_index = spr_towerblockdebris
                depth = (obj_player.depth + 10)
            }
        }
    }
    else if (sprite_index == spr_halloweenbigblock)
    {
        repeat (6)
        {
            with (create_debris((x + 32), (y + 32), sprite_index))
            {
                sprite_index = spr_halloweendebris
                depth = (obj_player.depth + 10)
            }
        }
    }
    else
    {
        repeat (6)
        {
            with (create_debris((x + 32), (y + 32), sprite_index))
            {
                sprite_index = spr_debris
                depth = (obj_player.depth + 10)
            }
        }
    }
    global.heattime += 10
    global.heattime = clamp(global.heattime, 0, 60)
    global.combotime += 50
    global.combotime = clamp(global.combotime, 0, 60)
    var val = heat_calculate(100)
    global.collect += val
    var theroomname = room_get_name(room)
    if (string_pos("secret", theroomname) != 0)
        global.style += (10 + (global.combo / 10))
    scr_sound_multiple("event:/sfx/misc/collect", x, y)
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    if (content != obj_null)
        instance_create((x + 32), y, content)
    stickygib = irandom(7)
    if (stickygib == 7)
    {
        repeat ceil((stickygib / 2))
            create_baddiegibsticks((x + 32), (y + 32))
    }
    with (obj_player1)
    {
        if (sprite_index == spr_mach1 || sprite_index == spr_mach)
        {
            if (machpunchAnim == 0)
                machpunchAnim = 1
        }
    }
    notification_push((45 << 0), [room])
    tile_layer_delete_at(1, x, y)
    tile_layer_delete_at(1, (x + 32), y)
    tile_layer_delete_at(1, (x + 32), (y + 32))
    tile_layer_delete_at(1, x, (y + 32))
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}
