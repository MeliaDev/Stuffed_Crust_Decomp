pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER WITH THE DEAD"
global.pepanimatronic = 1
global.gameframe_caption_text = "Shhh... Pizza Tower..."
if (global.panic == 1)
{
    var lay = layer_get_id("Backgrounds_still1")
    layer_background_sprite(layer_background_get_id(lay), 1860)
}
