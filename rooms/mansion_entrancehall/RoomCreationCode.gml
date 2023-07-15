pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER IN YE OLDE TIME"
global.door_sprite = spr_pepperdoor
with (obj_music)
{
    if (music != -4)
        fmod_set_parameter("pillarfade", 1, 0)
}
with (obj_musicOLD)
    customfade = 1
