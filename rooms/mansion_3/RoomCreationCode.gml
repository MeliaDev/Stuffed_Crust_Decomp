pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER IN YE OLDE TIME"
if global.panic
{
    var lay = layer_get_id("Backgrounds_H1")
    layer_background_sprite(layer_background_get_id(lay), 2362)
}
with (obj_music)
{
    if (music != noone)
        fmod_event_instance_set_paused(music.event, 1)
}
with (obj_musicOLD)
    customfade = 0
