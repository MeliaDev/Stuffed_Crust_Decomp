function scr_sound() //scr_sound
{
    var snd = argument[irandom((argument_count - 1))]
    global.music = audio_play_sound(snd, 10, true)
    audio_sound_gain(global.music, ((0.8 * global.option_sfx_volume) * global.option_master_volume), 0)
}

function scr_music(argument0, argument1, argument2) //scr_music
{
    if (argument1 == undefined)
        argument1 = true
    if (argument2 == undefined)
        argument2 = 0.8
    var m = audio_play_sound(argument0, 10, argument1)
    audio_sound_gain(m, (((audio_sound_get_gain(argument0) * argument2) * global.option_music_volume) * global.option_master_volume), 0)
    return m;
}

function set_master_gain(argument0) //set_master_gain
{
    var num = audio_get_listener_count()
    for (var i = 0; i < num; i++)
    {
        var info = audio_get_listener_info(i)
        audio_set_master_gain(ds_map_find_value(info, "index"), argument0)
        ds_map_destroy(info)
    }
}

