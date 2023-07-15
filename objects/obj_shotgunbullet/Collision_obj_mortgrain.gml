if (sprite_index == spr_mortprojectile)
{
    with (other)
    {
        if (!eaten)
            eaten = 1
        fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y)
        fmod_event_one_shot_3d("event:/sfx/misc/detransfo", x, y)
    }
}
