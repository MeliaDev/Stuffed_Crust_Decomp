if (other.inv_timer <= 0 && (other.state == (0 << 0) || other.state == (126 << 0) || other.state == (141 << 0)))
{
    with (other)
    {
        inv_timer = 120
        state = (107 << 0)
        hitX = x
        hitY = y
        hp--
        if (hp <= 0)
            instance_destroy()
    }
    disappear = 1
}
