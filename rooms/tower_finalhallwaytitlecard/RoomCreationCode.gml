pal_swap_init_system(8)
global.roommessage = "PIZZA TOWER ISLAND"
global.leveltosave = "exit"
global.exitrank = 0
with (obj_player)
{
    state = (18 << 0)
    targetRoom = tower_finalhallway
    targetDoor = "C"
}
with (instance_create(x, y, obj_titlecard))
{
    titlecard_sprite = spr_titlecards
    titlecard_index = 15
    title_sprite = spr_titlecards_title2
    title_index = 5
    title_music = -4
    music = 1
    fadealpha = 1
}
