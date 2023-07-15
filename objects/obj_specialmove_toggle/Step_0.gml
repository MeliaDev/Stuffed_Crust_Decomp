if instance_exists(obj_player)
    showtext = place_meeting(x, y, obj_player)
if instance_exists(obj_transfotip)
    showtext = 0
if showtext
    alpha = Approach(alpha, 1, 0.1)
else
    alpha = Approach(alpha, 0, 0.1)
if global.panic
    instance_destroy()
if (global.shootkeyattack == 0)
{
    sprite_index = spr_file2
    image_speed = 0.25
}
if (global.shootkeyattack == 1)
{
    sprite_index = spr_player_buffpep_idle
    image_speed = 0.15
}
if (global.shootkeyattack == 2)
{
    sprite_index = spr_player_slapup
    image_speed = 0.25
}
if (global.shootkeyattack == 3)
{
    sprite_index = spr_player_breakdance
    image_speed = 0.35
}
if (global.shootkeyattack == 4)
{
    sprite_index = spr_player_chainsaw
    image_speed = 0.3
}
mask_index = spr_player_mask
if savenow
{
    ini_open_from_string(obj_savesystem.ini_str)
    ini_write_real("SpecialMove", "Type", global.shootkeyattack)
    obj_savesystem.ini_str = ini_close()
    savenow = 0
}
movestyle = global.shootkeyattack
if (movestyle == 0)
    movetext = lang_get_value("specialmove_toggle_0")
if (movestyle == 1)
    movetext = lang_get_value("specialmove_toggle_1")
if (movestyle == 2)
    movetext = lang_get_value("specialmove_toggle_2")
if (movestyle == 3)
    movetext = lang_get_value("specialmove_toggle_3")
if (movestyle == 4)
    movetext = lang_get_value("specialmove_toggle_4")
