scr_getinput()
var op = options_array[selected]
if (key_up2 && selected != 1)
{
    fmod_event_one_shot("event:/sfx/ui/angelmove")
    selected -= (options_array[(selected - 1)][1] != "c" ? 1 : 2)
    scroll2 += 32
}
else if (key_down2 && selected < (array_length(options_array) - 1))
{
    selected += (options_array[(selected + 1)][1] != "c" ? 1 : 2)
    fmod_event_one_shot("event:/sfx/ui/angelmove")
    scroll2 -= 32
}
if (options_array[selected][2] == 1)
    var val = variable_global_get(options_array[selected][1])
if (options_array[selected][1] != "c")
{
    if (options_array[selected][2] != 1)
    {
        if (key_left2 == -1)
        {
            fmod_event_one_shot("event:/sfx/ui/select")
            if (variable_global_get(options_array[selected][1]) == 0)
                variable_global_set(options_array[selected][1], 1)
        }
        if key_right2
        {
            fmod_event_one_shot("event:/sfx/ui/select")
            if (variable_global_get(options_array[selected][1]) == 1)
                variable_global_set(options_array[selected][1], 0)
        }
    }
    if (options_array[selected][2] == 1 && (key_left2 == -1 || key_right2))
    {
        if (key_left2 == -1)
        {
            val--
            fmod_event_one_shot("event:/sfx/ui/select")
            val = clamp(val, 0, options_array[selected][3])
        }
        if key_right2
        {
            val++
            fmod_event_one_shot("event:/sfx/ui/select")
            val = clamp(val, 0, options_array[selected][3])
        }
        variable_global_set(options_array[selected][1], val)
    }
}
key_back = (keyboard_check_pressed(vk_escape) || keyboard_check_pressed(vk_return) || gamepad_button_check_pressed(obj_inputAssigner.player_input_device[0], gp_face2))
if (key_back || key_slap2 || keyboard_check_pressed(vk_escape))
{
    fmod_event_one_shot("event:/sfx/ui/back")
    instance_destroy()
}
scroll = lerp(scroll, scroll2, 0.1)
