if (press >= pressamt && drop == 0)
{
    obj_player.image_index = 0
    obj_player.alarm[8] = 60
    obj_player.state = (107 << 0)
    with (obj_press)
        instance_destroy()
    drop = 1
    closed = 0
    with (instance_create(x, y, obj_sausageman_dead))
    {
        sprite_index = other.sprite_index
        image_index = 0
        image_alpha = 1
    }
    instance_destroy()
}
if (closed == 1)
    y = obj_player.y
if (drop == 1)
{
    if place_meeting(x, (y + floor(vsp)), obj_solid)
    {
        y = floor(y)
        while (!(place_meeting(x, (y + sign(vsp)), obj_solid)))
            y += sign(vsp)
        vsp = 0
    }
    y += floor(vsp)
    if (vsp < 20)
        vsp += grav
    if (vsp == 0)
    {
        grav = 0
        drop = 0
    }
}
