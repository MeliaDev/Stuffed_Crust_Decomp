with (other)
{
    if shotgunAnim
    {
        shotgunAnim = 0
        fmod_event_one_shot_3d("event:/sfx/misc/detransfo", x, y)
        with (instance_create(x, y, obj_sausageman_dead))
            sprite_index = spr_shotgunback
        with (obj_shotgunback)
            instance_destroy()
    }
}
