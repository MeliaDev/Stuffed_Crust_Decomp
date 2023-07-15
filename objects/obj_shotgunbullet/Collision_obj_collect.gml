with (other)
{
    if (image_alpha == 1)
    {
        if (object_index != obj_escapecollect)
            scr_sound_multiple("event:/sfx/misc/collect", x, y)
        else
            scr_sound_multiple("event:/sfx/misc/bellcollect", x, y)
        if (obj_player1.character == "V")
            global.playerhealth_threshold += 10
        global.heattime += 10
        global.heattime = clamp(global.heattime, 0, 60)
        global.combotime += 10
        global.combotime = clamp(global.combotime, 0, 60)
        var theroomname = room_get_name(room)
        if (string_pos("secret", theroomname) != 0)
            global.style += (1 + (global.combo / 20))
        with (obj_camera)
            healthshaketime = 30
        var val = heat_calculate(10)
        global.collect += val
        create_collect(x, y, sprite_index, val)
        with (instance_create((x + 16), y, obj_smallnumber))
            number = string(val)
        instance_destroy()
    }
}
