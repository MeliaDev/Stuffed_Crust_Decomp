if (visited == 1 || room == forest_G2)
    sprite_index = spr_goldendoorvisited
if ((john && global.panic) || (sprite_index == spr_goldendoorvisited && obj_player1.isgustavo))
{
    if (uparrowID != noone)
    {
        instance_destroy(uparrowID)
        uparrowID = -4
    }
}
if (john && global.panic)
    sprite_index = spr_doorblocked_golden
with (obj_player)
{
    if (state == (95 << 0) && other.doored == 0)
    {
        if ((!instance_exists(obj_doortransition2)) && place_meeting(x, y, other.id))
        {
            other.doored = 1
            instance_create((other.x + (other.sprite_width / 2)), (other.y + (other.sprite_height / 2)), obj_doortransition2)
        }
    }
}
