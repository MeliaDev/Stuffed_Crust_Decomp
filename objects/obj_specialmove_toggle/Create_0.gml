depth = 100
scr_create_uparrowhitbox()
paletteselect = 0
showtext = 0
alpha = 0
active = 1
movestyle = global.shootkeyattack
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
    image_speed = 0.25
}
if (global.shootkeyattack == 2)
{
    sprite_index = spr_player_slapup
    image_speed = 0.25
}
if (global.shootkeyattack == 3)
{
    sprite_index = spr_player_breakdance
    image_speed = 0.25
}
if (global.shootkeyattack == 4)
{
    sprite_index = spr_player_chainsaw
    image_speed = 0.25
}
mask_index = spr_player_mask
savenow = 0
