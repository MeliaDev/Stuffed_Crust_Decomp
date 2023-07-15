if (instance_exists(baddieID) && other.thrown == 1 && (!baddieID.instantkillable))
{
    instance_destroy(other)
    instance_destroy()
    with (baddieID)
    {
        elitehit = 0
        instance_destroy()
    }
}
