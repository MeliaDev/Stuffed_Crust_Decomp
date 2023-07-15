pal_swap_init_system(8)
notification_push((49 << 0), [787])
global.gameframe_caption_text = "Defeated an idiot at the top of the Pizza Tower"
ini_open_from_string(obj_savesystem.ini_str)
ini_write_real("w5stick", "bosskey", 1)
obj_savesystem.ini_str = ini_close()
gamesave_async_save()
with (obj_player1)
{
    tauntstoredstate = (0 << 0)
    landAnim = 1
    state = (293 << 0)
    buffer = 100
    sprite_index = spr_slipbanan2
    image_index = (sprite_get_number(spr_slipbanan2) - 1)
    image_speed = 0.35
}
global.roommessage = "PIZZA TOWER ISLAND"
global.leveltorestart = 739
