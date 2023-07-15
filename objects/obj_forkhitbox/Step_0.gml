if (!instance_exists(ID))
{
    instance_destroy()
    return;
}
x = ID.x
y = ID.y
image_xscale = ID.image_xscale
image_yscale = ID.image_yscale
with (ID)
{
    if (object_index == obj_coolpineapple || object_index == obj_chilidude || object_index == obj_ghostknight || object_index == obj_forknight || object_index == obj_noisey || object_index == obj_smokingpizzaslice)
    {
        if (state != (134 << 0) && state != (125 << 0))
        {
            hitboxcreate = 0
            instance_destroy(other)
        }
    }
    switch object_index
    {
        case obj_golfdemon:
            if (state != (128 << 0))
                instance_destroy(other)
            break
        case 47:
            if ((state != (80 << 0) && state != (287 << 0)) || (state == (80 << 0) && floor(image_index) >= 38))
                instance_destroy(other)
            break
        case 171:
        case 10:
            if (state != (97 << 0) && (state != (99 << 0) || image_index >= 11))
                instance_destroy(other)
            break
        case 80:
            if (state != (108 << 0))
                instance_destroy(other)
            break
        case 797:
            other.x = (x + (image_xscale * 16))
            if (state != (129 << 0))
                instance_destroy(other)
            break
        case 182:
        case 32:
        case 303:
            other.x = (x + (image_xscale * 20))
            if (state != (128 << 0))
                instance_destroy(other)
            break
        case 445:
            other.x = (x - (image_xscale * 10))
            if (state != (80 << 0))
                instance_destroy(other)
            break
        case 1048:
            other.x = (x + (image_xscale * 32))
            break
        case 657:
            if (state != (104 << 0) && state != (23 << 0) && state != (91 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            else if (state == (23 << 0))
            {
                other.x = (x + (image_xscale * 32))
                if (floor(image_index) == (image_number - 2) || floor(image_index) < 8)
                    instance_destroy(other)
            }
            else if (state == (104 << 0) || state == (91 << 0))
                other.x = (x + (image_xscale * 20))
            break
        case 301:
            other.x = (x + (image_xscale * 24))
            if (state != (125 << 0))
                instance_destroy(other)
            break
        case 687:
            if (state != (134 << 0) && sprite_index != spr_indiancheese_howl)
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
        case 623:
        case 647:
        case 648:
            if (state != (80 << 0))
            {
                instance_destroy(other)
                punchinst = -4
            }
            break
        case 1092:
            if (state != (80 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
        case 651:
            if (state != (125 << 0) && state != (80 << 0))
                instance_destroy(other)
            break
        case 680:
            if (state != (128 << 0) && state != (80 << 0))
                instance_destroy(other)
            if (state == (80 << 0))
            {
                if (image_index > 14)
                    instance_destroy(other)
                other.x = (x + (image_xscale * 24))
            }
            break
        case 819:
            if (!hitwall)
                instance_destroy(other)
            break
        case 1015:
            if (obj_player1.instakillmove || obj_player1.state == (42 << 0))
            {
                instance_destroy(other)
                hitboxcreate = 0
            }
            break
        case 666:
            if (state != (129 << 0))
                instance_destroy(other)
            break
        case 679:
        case 688:
        case 684:
            if (state != (128 << 0) && state != (125 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
        case 654:
            other.y = (y - 22)
            if (state != (128 << 0) && state != (125 << 0))
            {
                hitboxcreate = 0
                instance_destroy(other)
            }
            break
        case 1136:
            other.x = (x - (image_xscale * 20))
            other.y = (y - 8)
            other.image_yscale = 1.25
            other.image_xscale = 0.75
            break
    }

}
