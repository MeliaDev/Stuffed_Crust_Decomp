if (state != (152 << 0))
    return;
if (!instance_exists(obj_fadeout))
{
    fmod_event_one_shot("event:/sfx/misc/door")
    with (instance_create(x, y, obj_fadeout))
        roomreset = 1
}
