function anon_gml_RoomCC_rm_testing_13_Create_7_gml_RoomCC_rm_testing_13_Create(argument0) //anon_gml_RoomCC_rm_testing_13_Create_7_gml_RoomCC_rm_testing_13_Create
{
    if ((!active) && argument0.state == (84 << 0))
    {
        active = 1
        obj_secretmanager.totems++
    }
}

function anon_gml_RoomCC_rm_testing_13_Create_151_gml_RoomCC_rm_testing_13_Create() //anon_gml_RoomCC_rm_testing_13_Create_151_gml_RoomCC_rm_testing_13_Create
{
    if active
    {
        with (instance_place(x, y, obj_totem))
            sprite_index = spr_totemcheese_pep
    }
}

visible = false
