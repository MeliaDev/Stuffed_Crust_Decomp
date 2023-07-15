switch state
{
    case (126 << 0):
        if selected
        {
            state = (8 << 0)
            sprite_index = transspr
            image_index = 0
        }
        break
    case (8 << 0):
        if (floor(image_index) == (image_number - 1))
        {
            if selected
            {
                if fmod_event_instance_is_playing(staticsnd)
                    fmod_event_instance_stop(staticsnd, 1)
                state = (0 << 0)
                sprite_index = selectedspr
                if (!global.game_started[trigger])
                {
                    sprite_index = transspr
                    image_index = (sprite_get_number(sprite_index) - 2)
                }
            }
            else
            {
                state = (126 << 0)
                sprite_index = idlespr
            }
        }
        break
    case (0 << 0):
        if (sprite_index == transspr && floor(image_index) == (image_number - 1))
            image_index = (image_number - 3)
        if (!selected)
        {
            sprite_index = transspr
            image_index = 2
            state = (8 << 0)
        }
        break
}

if (sprite_index == transspr && (!instance_exists(obj_option)))
{
    if (!fmod_event_instance_is_playing(staticsnd))
        fmod_event_instance_play(staticsnd)
}
else
    fmod_event_instance_stop(staticsnd, 1)
x = ((obj_screensizer.actual_width / 2) - (480 - xstart))
