with (other)
{
    if (character == "V")
        scr_hurtplayer(id)
    else if (state != (121 << 0) && (state != (61 << 0) || tauntstoredstate != (121 << 0)) && state != (3 << 0) && state != (89 << 0) && state != (31 << 0) && state != (186 << 0))
    {
        var _pindex = (object_index == obj_player1 ? 0 : 1)
        GamepadSetVibration(_pindex, 1, 1, 0.85)
        state = (9 << 0)
        vsp = -25
        sprite_index = spr_fireass
        image_index = 0
        fmod_event_one_shot_3d("event:/sfx/pep/burn", x, y)
        if (character == "V")
        {
            if (!fmod_event_instance_is_playing("event:/sfx/voice/vigiangry"))
                fmod_event_one_shot_3d("event:/sfx/voice/vigiangry", x, y)
        }
        else if ispeppino
        {
            if (!fmod_event_instance_is_playing(global.snd_fireass))
                fmod_event_instance_play(global.snd_fireass)
        }
        else if (!fmod_event_instance_is_playing("event:/sfx/voice/noisescream"))
            fmod_event_one_shot_3d("event:/sfx/voice/noisescream", x, y)
    }
}
