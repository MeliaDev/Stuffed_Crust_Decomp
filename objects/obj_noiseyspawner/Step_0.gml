var b = 0
with (obj_bosscontroller)
{
    if (state == (144 << 0))
        b = 0
}
with (obj_noisey)
    b = 0
with (obj_noiseboss)
{
    if (state == (144 << 0) || state == (138 << 0) || wastedhits >= 6)
        b = 0
}
if b
{
    if (spawnbuffer > 0)
        spawnbuffer--
    else
    {
        spawnbuffer = spawnmax
        with (instance_create(disx1, -64, obj_noisey))
        {
            important = 1
            x_to = other.disx2
            y_to = irandom_range(other.disy1, other.disy2)
            state = (149 << 0)
            bounce = 1
            stunned = 10
        }
    }
}
