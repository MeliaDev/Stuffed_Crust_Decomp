pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER IN YE OLDE TIME"
if global.panic
{
    var lay = layer_get_id("Backgrounds_H1")
    layer_background_sprite(layer_background_get_id(lay), 2360)
    var lay2 = layer_get_id("Backgrounds_zigzag2")
    layer_background_sprite(layer_background_get_id(lay2), 2369)
}
