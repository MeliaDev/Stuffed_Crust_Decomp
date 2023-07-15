if ((!horseyfinish) && start)
{
    with (obj_horsey)
    {
        spd = 0
        hsp = 0
        vsp = 0
        if (state != (89 << 0))
        {
            fmod_event_one_shot_3d("event:/sfx/misc/winrace", other.x, other.y)
            ds_list_add(global.saveroom, id)
        }
        state = (89 << 0)
        with (obj_objecticontracker)
        {
            if (objectID == other.id)
                instance_destroy()
        }
    }
    with (obj_horseyright)
        used = 1
    with (obj_racestart)
        ds_list_add(global.saveroom, id)
    global.horse = 0
    instance_destroy(obj_horseyblock)
}
