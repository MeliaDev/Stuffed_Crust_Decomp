if fadein
{
    fadealpha = Approach(fadealpha, 1, 0.03)
    if (fadealpha >= 1)
    {
        if (!instance_exists(obj_player1))
            instance_activate_object(obj_player1)
        else
        {
            fadein = 0
            pos_player = 0
            obj_player1.targetRoom = obj_player1.backtohubroom
            obj_player2.targetRoom = obj_player1.backtohubroom
            room_goto(obj_player1.backtohubroom)
        }
    }
}
else
{
    if (!pos_player)
    {
        if (!instance_exists(obj_player1))
            instance_activate_object(obj_player1)
        else
        {
            pos_player = 1
            with (obj_player1)
            {
                x = backtohubstartx
                y = (backtohubstarty - (obj_screensizer.actual_height * 2))
                state = (290 << 0)
                sprite_index = spr_slipbanan1
                image_index = 10
            }
        }
    }
    fadealpha = Approach(fadealpha, 0, 0.03)
    if (fadealpha <= 0)
        instance_destroy()
}
