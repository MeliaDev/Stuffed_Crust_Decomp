function anon_gml_RoomCC_rm_testing_6_Create_11_gml_RoomCC_rm_testing_6_Create(argument0) //anon_gml_RoomCC_rm_testing_6_Create_11_gml_RoomCC_rm_testing_6_Create
{
    if ((!active) && argument0.state == (42 << 0))
    {
        active = 1
        obj_secretmanager.hittriggers++
        with (argument0)
            scr_pummel()
    }
}

