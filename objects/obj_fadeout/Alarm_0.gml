if instance_exists(obj_player)
{
    if (custom_level == 0)
    {
        if (room != obj_player1.targetRoom || roomreset)
        {
            scr_room_goto(obj_player1.targetRoom)
            with (obj_player)
            {
                if (state == (7 << 0) || state == (152 << 0))
                {
                    visible = true
                    state = (0 << 0)
                }
            }
        }
        if (global.coop == 1)
        {
            if (room != obj_player2.targetRoom || roomreset)
                scr_room_goto(obj_player1.targetRoom)
            with (obj_player)
            {
                if (state == (7 << 0))
                    state = (0 << 0)
            }
            with (obj_player2)
            {
                if instance_exists(obj_coopplayerfollow)
                    state = (186 << 0)
            }
        }
    }
}
