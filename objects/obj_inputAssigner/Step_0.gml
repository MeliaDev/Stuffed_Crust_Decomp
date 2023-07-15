if (!deactivated)
{
    for (var i = 0; i < gamepad_get_device_count(); i++)
    {
        var _index = scr_anybutton_pressed(i)
        if (_index > -2)
        {
            device_selected[0] = 1
            if (player_input_device[0] != _index)
            {
                for (var j = 0; j < gamepad_get_device_count(); j++)
                {
                    if gamepad_is_connected(j)
                        gamepad_set_vibration(j, 0, 0)
                }
            }
            player_input_device[0] = _index
            press_start = 0
        }
    }
    i = 0
    while (i < 2)
    {
        if (player_input_device[i] >= 0)
        {
            if (!gamepad_is_connected(player_input_device[i]))
            {
                deactivated = 1
                device_selected[i] = 0
                player_input_device[i] = -2
                device_to_reconnect = i
                scr_pause_deactivate_objects(0)
                break
            }
            else
            {
                i++
                continue
            }
        }
        else
        {
            i++
            continue
        }
    }
}
else
{
    for (i = 0; i < 8; i++)
    {
        _index = scr_button_pressed(i)
        if (_index != -2)
        {
            if ((!self.CheckUsedIndex(_index)) || (device_to_reconnect == 1 && _index == -1 && (keyboard_check_pressed(global.key_jumpN) || keyboard_check_pressed(global.key_startN))))
            {
                device_selected[device_to_reconnect] = 1
                player_input_device[device_to_reconnect] = _index
                deactivated = 0
                scr_pause_activate_objects(0)
                alarm[0] = 1
            }
            else if (device_to_reconnect == 1 && global.coop)
            {
                global.coop = 0
                instance_destroy(obj_coopplayerfollow)
                device_selected[device_to_reconnect] = 0
                player_input_device[device_to_reconnect] = -2
                deactivated = 0
                scr_pause_activate_objects(0)
                alarm[0] = 1
            }
        }
    }
}
