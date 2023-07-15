sprite_index = spr_achievement_bosses
hidden = 1
ini_open_from_string(obj_savesystem.ini_str)
if ini_read_real("w4stick", "bosskey", 0)
    hidden = 0
ini_close()
achievement = "fakepep"
index = 3
secretplus = 5
