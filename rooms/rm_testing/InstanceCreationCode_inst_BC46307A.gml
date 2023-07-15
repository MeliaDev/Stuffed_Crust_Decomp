trigger = 7
function anon_gml_RoomCC_rm_testing_20_Create_23_gml_RoomCC_rm_testing_20_Create(argument0) //anon_gml_RoomCC_rm_testing_20_Create_23_gml_RoomCC_rm_testing_20_Create
{
    if (!active)
    {
        if (following_count(387) >= 3)
        {
            active = 1
            instance_destroy(obj_chickenfollow)
        }
    }
}

