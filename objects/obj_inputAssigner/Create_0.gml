player_input_device[0] = -2
player_input_device[1] = -2
device_selected[0] = 0
device_selected[1] = 0
press_start = 0
deactivated = 0
device_to_reconnect = 0
instance_list = ds_list_create()
sound_list = ds_list_create()
prevstate[0] = (18 << 0)
prevstate[1] = (18 << 0)
vibration[0][0] = 0
vibration[0][1] = 0
vibration[0][2] = 0
vibration[1][0] = 0
vibration[1][1] = 0
vibration[1][2] = 0
for (var i = 0; i < gamepad_get_device_count(); i++)
{
    if gamepad_is_connected(i)
    {
        device_selected[0] = 1
        player_input_device[0] = i
        press_start = 0
    }
}
setVibration = function(argument0, argument1, argument2, argument3)
{
    vibration[argument0][0] = argument1
    vibration[argument0][1] = argument2
    if (argument3 != undefined)
        vibration[argument0][2] = argument3
}

function CheckUsedIndex(argument0)
{
    for (var _x = 0; _x < 2; _x++)
    {
        if (player_input_device[_x] == argument0)
            return 1;
    }
    return 0;
}

