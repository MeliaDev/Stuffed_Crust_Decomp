sprite_index = spr_achievement_prank
achievement = "pranks1"
index = 0
secretplus = 5
if (!(quick_ini_read_real("", "achievements", achievement, 0)))
    instance_destroy()
