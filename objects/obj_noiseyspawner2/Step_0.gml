var b = 1
with (obj_bosscontroller)
{
    if (state == (144 << 0))
        b = 0
}
with (obj_noisey)
    b = 0
with (obj_noiseboss)
{
    if (state == (144 << 0) || state == (138 << 0) || phase == 1)
        b = 0
}
if b
{
    if (spawnbuffer > 0)
        spawnbuffer--
    else
    {
        spawnbuffer = spawnmax
        with (instance_create(x, y, obj_noisey))
        {
            instance_create(x, y, obj_genericpoofeffect)
            important = 1
            state = (138 << 0)
            bounce = 1
            stunned = 10
            image_xscale = other.image_xscale
        }
        if (x == xstart)
            x = 832
        else
            x = xstart
        image_xscale *= -1
    }
}
