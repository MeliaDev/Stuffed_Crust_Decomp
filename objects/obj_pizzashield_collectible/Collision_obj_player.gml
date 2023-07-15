if (other.state != (186 << 0))
{
    scr_sound_multiple("event:/sfx/misc/collect", x, y)
    with (other)
        pizzashield = 1
    instance_destroy()
}
