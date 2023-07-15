switch state
{
    case (0 << 0):
        break
    case (8 << 0):
        if (floor(image_index) == (image_number - 1))
        {
            instance_activate_object(bossdoorID)
            with (bossdoorID)
            {
                vsp = -5
                state = (92 << 0)
                event_perform(ev_other, ev_room_start)
            }
            state = (92 << 0)
        }
        break
    case (92 << 0):
        sprite_index = spr_mrstick_helicopterhat
        y -= 10
        if (y < -100)
            instance_destroy()
        break
    default:

}

