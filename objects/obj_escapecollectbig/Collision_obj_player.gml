if (room == rm_editor)
{
}
if (image_alpha == 1)
{
    if (other.state != (186 << 0))
    {
        if (obj_player1.character == "V")
            global.playerhealth_threshold += 10
        global.heattime = 60
        with (obj_camera)
            healthshaketime = 60
        if (sprite_index == spr_escapecollectbig)
            fmod_event_one_shot_3d("event:/sfx/misc/bellcollectbig", x, y)
        fmod_event_one_shot_3d("event:/sfx/misc/collectpizza", x, y)
        instance_destroy()
        global.combotime = 60
        global.style += 5
        var val = heat_calculate(value)
        if (other.object_index == obj_player1)
            global.collect += val
        else
            global.collectN += val
        if visible
            create_collect(x, y, sprite_index, val)
        with (instance_create((x + 16), y, obj_smallnumber))
            number = string(val)
        if (obj_player1.character == "V")
            tv_do_expression(3189)
        else if (obj_player1.character == "N" || (!obj_player1.ispeppino))
            tv_do_expression(4250)
        else
            tv_do_expression(971)
    }
}
