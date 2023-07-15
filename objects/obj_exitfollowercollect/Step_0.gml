if (global.panic && (!global.exitrank) && distance_to_object(obj_player1) <= 300 && ds_list_find_index(global.saveroom, id) == -1)
{
    ds_list_add(global.saveroom, id)
    fmod_event_one_shot("event:/sfx/misc/collecttoppin")
    with (instance_create(x, y, obj_exitfollower))
    {
        walkspr = other.walkspr
        idlespr = other.idlespr
        if (other.object_index == obj_gustavofollower)
            fmod_event_one_shot_3d("event:/sfx/voice/gusok", x, y)
        if (other.object_index == obj_stickfollower)
            fmod_event_one_shot_3d("event:/sfx/voice/mrstick", x, y)
        if (other.object_index == obj_snottyexit)
            fmod_event_one_shot_3d("event:/sfx/voice/enemyrarescream", x, y)
        if (other.object_index == obj_fakepepfollower)
            fmod_event_one_shot_3d("event:/sfx/voice/fakepeppositive", x, y)
        if (other.object_index == obj_noisefollower)
        {
            if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
                fmod_event_one_shot_3d("event:/sfx/voice/myea", x, y)
            else
                fmod_event_one_shot_3d("event:/sfx/voice/noisepositive", x, y)
        }
        if (other.object_index == obj_vigilantefollower)
            fmod_event_one_shot_3d("event:/sfx/voice/vigiintro", x, y)
        if (other.object_index == obj_mortfollowerexit)
            fmod_event_one_shot_3d("event:/sfx/mort/mortpickup", x, y)
        if (other.object_index == obj_peppermanfollower)
            fmod_event_one_shot_3d("event:/sfx/voice/peppermansnicker", x, y)
        if (other.object_index == obj_geromeexit)
            fmod_event_one_shot_3d("event:/sfx/voice/geromegot", x, y)
        if (other.object_index == obj_peppermanfollower)
            yoffset = 5
        else if (other.object_index != obj_stickfollower)
            yoffset = 0
        if (other.object_index == obj_snottyexit)
            snotty = 1
        else if (other.object_index == obj_gustavofollower || other.object_index == obj_fakepepfollower)
            isgustavo = 1
    }
    instance_destroy()
}
if global.exitrank
    instance_destroy()
image_speed = obj_player1.image_speed
