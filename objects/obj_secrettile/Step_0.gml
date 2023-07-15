if place_meeting(x, y, obj_player)
    active = 1
if active
{
    var b = 1
    with (obj_player1)
    {
        if (!(place_meeting(x, y, obj_secrettile)))
        {
            other.active = 0
            b = 0
        }
    }
    if b
    {
        with (instance_place((x + 1), y, obj_secrettile))
            active = 1
        with (instance_place((x - 1), y, obj_secrettile))
            active = 1
        with (instance_place(x, (y + 1), obj_secrettile))
            active = 1
        with (instance_place(x, (y - 1), obj_secrettile))
            active = 1
    }
    depth = -8
    if (depth < desireddepth)
        depth = desireddepth
    alpha = Approach(alpha, 0, 0.05)
}
else
{
    depth = desireddepth
    alpha = Approach(alpha, 1, 0.05)
}
if place_meeting(x, y, obj_baddie)
    depth = -30
