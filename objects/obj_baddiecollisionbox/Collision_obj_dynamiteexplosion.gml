if (instance_exists(baddieID) && baddieID.instantkillable && baddieID.destroyable)
{
    with (baddieID)
    {
        elitehit = 0
        instance_destroy()
    }
    instance_destroy()
}
