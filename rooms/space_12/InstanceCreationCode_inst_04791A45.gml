piledriver = 1
active = 0
function anon_gml_RoomCC_space_12_17_Create_46_gml_RoomCC_space_12_17_Create() //anon_gml_RoomCC_space_12_17_Create_46_gml_RoomCC_space_12_17_Create
{
    with (obj_player)
    {
        if (place_meeting(x, y, other) && state != (76 << 0) && state != (61 << 0))
            other.piledriver = 0
    }
    if (piledriver && (!active) && (!(place_meeting(x, y, obj_secretbigblock))))
    {
        notification_push((15 << 0), [room])
        active = 1
    }
}

