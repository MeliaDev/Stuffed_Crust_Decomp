function scr_heatdown() //scr_heatdown
{
    global.baddiespeed -= 1
    if (global.stylethreshold != 4)
        global.baddiepowerup = 0
    if (global.stylethreshold < 3)
    {
        global.baddierage = 0
        obj_heatafterimage.visible = false
    }
    if (global.stylethreshold > 0)
    {
        fmod_event_one_shot_3d("event:/sfx/misc/timerend", obj_player1.x, obj_player1.y)
        if (!instance_exists(obj_heatmultiply_notif))
            instance_create(obj_player1.x, (obj_player1.y - 20), obj_heatmultiply_notif)
    }
    if instance_exists(obj_baddie)
    {
        with (obj_tv)
        {
            message = "HEAT DOWN..."
            alarm[0] = 200
            showtext = 1
        }
    }
    obj_stylebar.toggle = 1
    obj_stylebar.alarm[0] = 5
}

