if destroy
{
    trace("self: ", baddie)
    with (instance_create(x, y, obj_canonexplosion))
    {
        rat = other.grabbable
        baddie = other.baddie
        trace("canonexplosion create: ", baddie)
    }
}
fmod_event_instance_stop(snd, 1)
fmod_event_instance_release(snd)
