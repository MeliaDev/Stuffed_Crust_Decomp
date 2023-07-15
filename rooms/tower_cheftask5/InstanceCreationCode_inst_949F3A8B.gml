sprite_index = spr_achievement_bosses
hidden = 1
ini_open_from_string(obj_savesystem.ini_str)
if (ini_read_real("Highscore", "exit", 0) > 0)
    hidden = 0
ini_close()
achievement = "pizzaface"
index = 4
secretplus = 5
