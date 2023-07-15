if (!instance_exists(obj_titlecard))
{
    alarm[1] = (8 + irandom(5))
    fmod_event_one_shot_3d("event:/sfx/hub/gusbrickfightball", x, y)
    with (create_debris(x, y, 1531))
        vsp = (-(irandom_range(5, 10)))
    with (create_debris(x, y, 1525))
        vsp = (-(irandom_range(5, 10)))
}
