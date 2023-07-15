sprite_index = spr_pepperman_idle
pm_dialog[0] = [dialog_create("Seems you don't have either a bottle or a piece of paper.")]
pm_dialog[1] = [dialog_create("Beach     boat")]
pm_scene_info = [[cutscene_do_dialog, [dialog_create("Here you go")]], [cutscene_waitfor_dialog], [cutscene_set_player_actor], [cutscene_set_object_pos, 151062, 1696, 576], [cutscene_do_dialog, [dialog_create("Go ahead", -4, function() //anon_gml_RoomCC_hub_island_5_Create_442_gml_RoomCC_hub_island_5_Create
{
}
)]]]
function anon_gml_RoomCC_hub_island_5_Create_490_gml_RoomCC_hub_island_5_Create() //anon_gml_RoomCC_hub_island_5_Create_490_gml_RoomCC_hub_island_5_Create
{
    if ((!global.bottlecutscene) || (!global.papercutscene))
        do_dialog(pm_dialog[0])
    else if (global.beachboatcutscene == -4 || (!global.beachboatcutscene))
    {
        do_dialog_cutscene(pm_scene_info)
        global.beachboatcutscene = 1
        quick_ini_write_real(get_savefile_ini(), "cutscene", "beachboat", 1)
    }
    else
        do_dialog(pm_dialog[1])
}

if (global.bottlecutscene == -4)
    global.bottlecutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "bottle", 0)
if (global.papercutscene == -4)
    global.papercutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "paper", 0)
if (global.beachboatcutscene == -4)
    global.beachboatcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "beachboat", 0)
if (global.beachcutscene == -4)
    global.beachcutscene = quick_ini_read_real(get_savefile_ini(), "cutscene", "beach", 0)
if global.beachcutscene
    instance_destroy()
