if (instance_exists(baddieID) && (!baddieID.instantkillable) && baddieID.destroyable)
{
    instance_destroy()
    with (baddieID)
    {
        elitehit = 0
        instance_destroy()
    }
}
