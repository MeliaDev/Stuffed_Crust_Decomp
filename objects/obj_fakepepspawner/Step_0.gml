if (state == 0)
{
    if (spawnbuffer > 0)
    {
        spawnbuffer--
        if (spawn == attack.emptyspot)
            spawn++
    }
    else if (spawn <= attack.size)
    {
        var xx = (attack.x1 + (xplus * spawn))
        if (attack.direction == -1)
            xx = (attack.x2 - (xplus * spawn))
        var yy = attack.y
        with (instance_create(xx, yy, obj_fakepepclone))
        {
            attack = other.attack
            spawnerID = other.id
            other.spawn++
            other.spawnbuffer = attack.timer
        }
    }
    else
    {
        var b = 1
        with (obj_fakepepclone)
        {
            if (spawnerID == other.id && state != (99 << 0))
                b = 0
        }
        if b
        {
            with (obj_fakepepclone)
            {
                if (spawnerID == other.id)
                    image_speed = 0.35
            }
            state++
        }
    }
}
else
{
    b = 0
    with (obj_fakepepclone)
    {
        if (spawnerID == other.id)
            b = 1
    }
    if (!b)
        instance_destroy()
}
