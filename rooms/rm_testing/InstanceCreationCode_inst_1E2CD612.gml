trigger = 6
function anon_gml_RoomCC_rm_testing_18_Create_23_gml_RoomCC_rm_testing_18_Create(argument0) //anon_gml_RoomCC_rm_testing_18_Create_23_gml_RoomCC_rm_testing_18_Create
{
    if (!active)
    {
        if following_has_follower(1029)
        {
            active = 1
            instance_destroy(obj_alienfollow)
        }
    }
}

