event_inherited()
dir = -1
spr_left = spr_railhleft
spr_right = spr_railhright
if global.panic
{
    if (room == industrial_3)
    {
        var lay = layer_get_id("Backgrounds_1")
        layer_background_sprite(layer_background_get_id(lay), 2307)
    }
    if (room == industrial_4)
    {
        lay = layer_get_id("Backgrounds_1")
        layer_background_sprite(layer_background_get_id(lay), 2300)
    }
}
