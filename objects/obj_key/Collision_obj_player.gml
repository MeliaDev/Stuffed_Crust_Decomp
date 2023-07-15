if (room == rm_editor)
    return;
if global.key_inv
    return;
with (other)
{
    if (state != (51 << 0) && state != (186 << 0) && state != (16 << 0) && state != (47 << 0) && state != (21 << 0) && state != (33 << 0) && state != (24 << 0) && state != (48 << 0) && state != (38 << 0) && state != (107 << 0) && state != (49 << 0))
    {
        if (!obj_tv.panicmode)
        {
            if (obj_player1.character == "V")
                tv_do_expression(3189)
            else if (obj_player1.character == "N" || (!obj_player1.ispeppino))
                tv_do_expression(4250)
            else
                tv_do_expression(971)
        }
        instance_destroy(other)
        global.key_inv = 1
        key_particles = 1
        alarm[7] = 30
        fmod_event_one_shot("event:/sfx/misc/collecttoppin")
        state = (90 << 0)
        image_index = 0
        keysound = 0
        global.combotime = 60
    }
}
