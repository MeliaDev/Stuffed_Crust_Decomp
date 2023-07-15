if (room == rm_editor)
{
}
if (ds_list_find_index(global.saveroom, id) == -1 && global.snickchallenge == 0)
{
    repeat irandom_range(4, 6)
    {
        with (create_debris((x + 16), y, sprite_index))
        {
            if (other.sprite_index == spr_secretblock_smallpoints)
                sprite_index = spr_eyedebris
            else if (other.sprite_index == spr_destroyable2)
                sprite_index = spr_debris
            else if (other.sprite_index == spr_halloweensmallblockescape || other.sprite_index == spr_xmasblockescape)
                sprite_index = spr_towerblockdebris
            else if (other.sprite_index == spr_secretblock_small)
                sprite_index = spr_secretdebris
            else
                sprite_index = spr_halloweendebris
            depth = (obj_player.depth + 10)
        }
    }
    if (sprite_index == spr_destroyable2)
    {
        with (instance_create((x + 16), (y + 16), obj_parryeffect))
            sprite_index = spr_pizzablockdead
        depth = (obj_player.depth + 10)
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
    stickygib = irandom(7)
    if (stickygib == 7)
        create_baddiegibsticks((x + 16), (y + 16))
    scr_sound_multiple("event:/sfx/misc/collect", x, y)
    global.heattime += 10
    global.heattime = clamp(global.heattime, 0, 60)
    global.combotime += 10
    global.combotime = clamp(global.combotime, 0, 60)
    var theroomname = room_get_name(room)
    if (string_pos("secret", theroomname) != 0)
        global.style += (5 + (global.combo / 10))
    var val = heat_calculate(10)
    global.collect += val
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    tile_layer_delete_at(1, x, y)
    notification_push((45 << 0), [room])
    scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
    ds_list_add(global.saveroom, id)
}
