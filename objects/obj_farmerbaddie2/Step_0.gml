if (idle && state == (134 << 0) && bombreset <= 0)
{
    var targetplayer = instance_nearest(x, y, obj_player)
    if (abs((targetplayer.x - x)) <= 250 && targetplayer.y > y && targetplayer.y < (y + 300))
    {
        state = (129 << 0)
        sprite_index = spr_farmer2_throw
        image_index = 0
    }
}
event_inherited()
if (idle && sprite_index == idlespr)
    sprite_index = spr_farmer2_throwstart
