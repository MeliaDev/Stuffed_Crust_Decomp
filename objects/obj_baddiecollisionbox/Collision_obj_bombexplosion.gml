if (instance_exists(baddieID) && baddieID.object_index != obj_pizzagoblin && baddieID.object_index != obj_canongoblin && baddieID.object_index != obj_tank && baddieID.destroyable)
{
    with (baddieID)
    {
        elitehit = 0
        instance_destroy()
    }
    instance_destroy()
}
