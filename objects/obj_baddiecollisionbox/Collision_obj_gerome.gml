if (instance_exists(baddieID) && other.thrown == 1)
{
    if baddieID.destroyable
    {
        instance_destroy()
        with (baddieID)
        {
            elitehit = 0
            instance_destroy()
        }
    }
}
