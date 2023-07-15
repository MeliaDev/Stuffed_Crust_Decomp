depth = -2
playerid = 530
if (current_month == 12)
{
    var lay = layer_get_id("Backgrounds_3")
    layer_background_sprite(layer_background_get_id(lay), 2877)
    with (obj_treasureshadow)
        sprite_index = spr_xmastreasureshadow
}
