piledriver = 1
touched = 0
active = 0
function anon_gml_RoomCC_space_7_10_Create_64_gml_RoomCC_space_7_10_Create() //anon_gml_RoomCC_space_7_10_Create_64_gml_RoomCC_space_7_10_Create
{
    if (!touched)
    {
        with (obj_player)
        {
            if place_meeting(x, y, other)
                other.touched = 1
        }
    }
    if touched
    {
        with (obj_player)
        {
            if (place_meeting(x, y, other) && state != (76 << 0) && state != (61 << 0))
                other.piledriver = 0
            else if (!(place_meeting(x, y, other)))
            {
                with (other)
                {
                    if (piledriver && (!active) && (!(place_meeting(x, y, obj_baddie))))
                    {
                        notification_push((15 << 0), [room])
                        active = 1
                    }
                }
            }
        }
    }
}

