if (other.id != baddieID && other.state != (5 << 0) && other.state != (138 << 0))
{
    with (other)
    {
        image_xscale = (-image_xscale)
        other.image_xscale = (-other.image_xscale)
        stuntimer = stunmax
        state = (5 << 0)
        if (other.movespeed > 7)
            tumblespeed = other.movespeed
        vsp = -6
    }
}
