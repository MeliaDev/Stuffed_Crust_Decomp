pal_swap_init_system(8)
instance_destroy(obj_pigtotal)
global.gameframe_caption_text = "Select your Pizza Tower"
with (instance_create(0, 0, obj_loadingscreen))
{
    group_arr = ["hudgroup", "baddiegroup", "levelstructuregroup", "menugroup"]
    offload_arr = ["introgroup"]
}
with (obj_player)
    state = (18 << 0)
global.leveltorestart = -4
global.leveltosave = -4
global.startgate = 0
global.exitrank = 0
