function scr_heatup() //scr_heatup
{
    global.baddiespeed += 1
    if (global.stylethreshold == 4)
        global.baddiepowerup = 1
    else
        global.baddiepowerup = 0
    if (global.stylethreshold >= 3)
    {
        global.baddierage = 1
        if (!instance_exists(obj_heatafterimage))
            instance_create(obj_player1.x, obj_player1.y, obj_heatafterimage)
        obj_heatafterimage.visible = true
    }
    else
        global.baddierage = 0
    if (global.stylethreshold > 1)
    {
        fmod_event_one_shot_3d("event:/sfx/pep/burn", obj_player1.x, obj_player1.y)
        if (!instance_exists(obj_heatmultiply_notif))
            instance_create(obj_player1.x, (obj_player1.y - 20), obj_heatmultiply_notif)
    }
    with (obj_tv)
    {
        message = "HEAT UP!!"
        alarm[0] = 200
        showtext = 1
    }
    obj_stylebar.toggle = 1
    obj_stylebar.alarm[0] = 5
}

