function scr_enemy_ratgrabbed() //scr_enemy_ratgrabbed
{
    var p = (object_index == obj_junk || object_get_parent(object_index) == 593)
    if (((!p) && state == (205 << 0)) || (p && ratgrabbed))
    {
        visible = false
        x = ratplayerid.x
        y = ratplayerid.y
        if (!p)
            sprite_index = stunfallspr
        if ((!p) && state != (138 << 0))
            state = (205 << 0)
        if (p && (!ratgrabbed))
            ratgrabbed = 1
        if (ratplayerid.state == (194 << 0) && ratplayerid.image_index >= 5)
        {
            hsp = (ratplayerid.xscale * 22)
            vsp = -2
            image_xscale = (-ratplayerid.xscale)
            y = (ratplayerid.y - 5)
            thrown = 1
            visible = true
            if (!p)
            {
                grounded = 0
                hp = -1
                alarm[1] = 5
                state = (138 << 0)
                stunned = 200
                hithsp = hsp
                hitvsp = vsp
                linethrown = 1
            }
            else
            {
                grounded = 0
                ratgrabbed = 0
            }
        }
    }
}

