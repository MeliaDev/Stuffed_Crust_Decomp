event_inherited()
active = 1
function anon_gml_Object_obj_soundtest_prev_Create_0_47_gml_Object_obj_soundtest_prev_Create_0() //anon_gml_Object_obj_soundtest_prev_Create_0_47_gml_Object_obj_soundtest_prev_Create_0
{
    with (obj_soundtest)
    {
        other.active = 0
        other.alarm[1] = 10
        music_pos--
        if (music_pos < 0)
            music_pos = (array_length(music_arr) - 1)
        fmod_event_instance_stop(music_event, 1)
        fmod_event_instance_release(music_event)
        music_event = fmod_event_create_instance(music_arr[music_pos][0])
        if play
            fmod_event_instance_play(music_event)
    }
}

