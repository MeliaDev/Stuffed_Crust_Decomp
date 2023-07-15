if (john && global.panic)
{
    if (room == saloon_4)
        sprite_index = spr_doorblockedsaloon
    else if (room == forest_G1 || room == forest_G2)
        sprite_index = spr_doorblocked_golden
    else
        sprite_index = spr_doorblocked
    if (uparrowID != noone)
    {
        instance_destroy(uparrowID)
        uparrowID = -4
    }
}
if ((room == tower_5 && targetRoom == tower_pizzafacehall) || room == tower_pizzafacehall)
    sprite_index = spr_pizzafacedoor
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
