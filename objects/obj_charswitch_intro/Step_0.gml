switch state
{
    case (8 << 0):
        if (floor(image_index) == (image_number - 1))
        {
            state = (0 << 0)
            introbuffer = 50
        }
        break
    case (0 << 0):
        if (introbuffer > 0)
            introbuffer--
        else
        {
            image_speed = 0
            image_index = (image_number - 1)
            state = (135 << 0)
            with (obj_camera)
            {
                smoothcam = 0
                lock = 0
            }
            with (obj_player1)
            {
                if (other.spr == spr_backtopeppino || other.spr == spr_backtonoise)
                {
                    x = obj_peppinoswitch.x
                    y = obj_peppinoswitch.y
                }
                else
                {
                    x = obj_gustavoswitch.x
                    y = obj_gustavoswitch.y
                }
            }
            with (obj_followcharacter)
            {
                ds_queue_clear(followqueue)
                x = obj_player1.x
                y = obj_player1.y
            }
        }
        break
    case (135 << 0):
        image_index -= 0.35
        if (image_index <= 0)
        {
            fmod_event_one_shot("event:/sfx/ui/tvswitchback")
            with (obj_collect)
            {
                gus = 1
                resetmode = 1
            }
            with (obj_bigcollect)
            {
                gus = 1
                resetmode = 1
            }
            instance_destroy()
        }
        break
}

shakey = random_range(-1, 1)
