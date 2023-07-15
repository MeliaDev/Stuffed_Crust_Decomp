pal_swap_init_system(8)
global.roommessage = "PICK A PIZZA GUY"
global.gameframe_caption_text = "Picking your Poison Somewhere Outside the Pizza Tower"
ini_open_from_string(obj_savesystem.ini_str_options)
var n = ini_read_real("Game", "beaten", 0)
obj_savesystem.ini_str_options = ini_close()
if (n < 1)
    room_goto(Finalintro)
