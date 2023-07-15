if (state != (89 << 0))
{
    captain_y = obj_screensizer.actual_height
    canon_y = obj_screensizer.actual_height
}
switch state
{
    case (0 << 0):
        break
    case (8 << 0):
        if (floor(canon_index) == (sprite_get_number(canon_sprite) - 1))
        {
            canon_sprite = spr_captaingoblin_canon
            state = (0 << 0)
            fmod_event_instance_play(global.snd_captaingoblinshoot)
            GamepadSetVibration(0, 1, 1, 0.8)
            with (instance_create(crosshair_x, (camera_get_view_y(view_camera[0]) - 32), obj_frontcanonbomb))
                y_to = other.crosshair_y
        }
        break
    case (89 << 0):
        if (!destroyed)
        {
            if (destroybuffer > 0)
                destroybuffer--
            else
                destroyed = 1
        }
        else
        {
            var cy = (obj_screensizer.actual_height + sprite_get_height(captain_sprite))
            captain_y = Approach(captain_y, cy, 2)
            canon_y = Approach(canon_y, cy, 1.8)
            if (captain_y >= cy)
                instance_destroy()
        }
        break
    default:

}

