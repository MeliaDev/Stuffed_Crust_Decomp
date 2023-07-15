if (DEBUG)
{
    with (obj_stairs)
        visible = other.showcollisions
    with (obj_grindrail)
        visible = other.showcollisions
    with (obj_grindrailslope)
        visible = other.showcollisions
    with (obj_supriseenemyarea)
        visible = other.showcollisions
    with (obj_killallcops)
        visible = other.showcollisions
    with (obj_slope)
    {
        if (object_index == obj_slope)
            visible = other.showcollisions
    }
    with (obj_platform)
    {
        if (object_index == obj_platform)
            visible = other.showcollisions
    }
    with (obj_solid)
    {
        if (object_index == obj_solid || object_index == obj_secretbigblock || object_index == obj_secretblock || object_index == obj_secretmetalblock)
            visible = other.showcollisions
    }
}
