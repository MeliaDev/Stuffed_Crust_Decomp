with (other)
{
    if (obj_player1.character == "V")
    {
        if (global.playerhealth > 6)
            global.playerhealth += 1
    }
    global.heattime = 60
    with (obj_camera)
        healthshaketime = 120
    fmod_event_one_shot("event:/sfx/misc/collectgiantpizza")
    var val = heat_calculate(500)
    global.combotime = 60
    var theroomname = room_get_name(room)
    if (string_pos("secret", theroomname) != 0)
        global.style += (15 + (global.combo / 10))
    if (obj_player1.character == "N" || (!obj_player1.ispeppino))
        tv_do_expression(4250)
    else
        tv_do_expression(971)
    global.collect += val
    var _x = (x - 48)
    var _y = (y - 48)
    var _xstart = _x
    for (var yy = 0; yy < 4; yy++)
    {
        for (var xx = 0; xx < 4; xx++)
        {
            create_collect(_x, _y, (obj_player1.ispeppino ? choose(2094, 2089, 3854, 2091) : choose(2750, 2752, 2756, 2757, 2758, 2864, 2866, 2868, 2870, 2872)))
            _x += 16
        }
        _x = _xstart
        _y += 16
    }
    with (instance_create((x + 16), y, obj_smallnumber))
        number = string(val)
    instance_destroy()
}
