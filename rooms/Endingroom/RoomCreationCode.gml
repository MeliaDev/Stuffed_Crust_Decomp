pal_swap_init_system(8)
global.gameframe_caption_text = "The Pizza Tower is collapsing!"
ini_open_from_string(obj_savesystem.ini_str)
if (ini_read_string("Game", "finalrank", "none") == "none")
    notification_push((53 << 0), [room])
ini_close()
