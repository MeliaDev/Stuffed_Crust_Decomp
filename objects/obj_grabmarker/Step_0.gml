if instance_exists(ID)
{
    switch ID.object_index
    {
        case obj_swordstone:
            y = (ID.y - 20)
            break
        case 169:
            if (ID.state == (4 << 0))
                instance_destroy()
            x = ID.x
            y = (ID.y - 32)
            break
        case 10:
            if (ID.state != (134 << 0))
                visible = false
            else
                visible = true
            x = (ID.x - 12)
            y = (ID.y - 55)
            break
    }

}
else if (ID != noone)
    instance_destroy()
