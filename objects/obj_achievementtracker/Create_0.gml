if (instance_number(object_index) > 1)
{
    instance_destroy()
    return;
}
global.steam_achievements = ds_map_create()
ds_map_set(global.steam_achievements, "entrance1", "ACH_ENTRANCE_1")
ds_map_set(global.steam_achievements, "entrance2", "ACH_ENTRANCE_2")
ds_map_set(global.steam_achievements, "entrance3", "ACH_ENTRANCE_3")
ds_map_set(global.steam_achievements, "medieval1", "ACH_MEDIEVAL_1")
ds_map_set(global.steam_achievements, "medieval2", "ACH_MEDIEVAL_2")
ds_map_set(global.steam_achievements, "medieval3", "ACH_MEDIEVAL_3")
ds_map_set(global.steam_achievements, "ruin1", "ACH_RUIN_1")
ds_map_set(global.steam_achievements, "ruin2", "ACH_RUIN_2")
ds_map_set(global.steam_achievements, "ruin3", "ACH_RUIN_3")
ds_map_set(global.steam_achievements, "dungeon1", "ACH_DUNGEON_1")
ds_map_set(global.steam_achievements, "dungeon2", "ACH_DUNGEON_2")
ds_map_set(global.steam_achievements, "dungeon3", "ACH_DUNGEON_3")
ds_map_set(global.steam_achievements, "badland1", "ACH_BADLAND_1")
ds_map_set(global.steam_achievements, "badland2", "ACH_BADLAND_2")
ds_map_set(global.steam_achievements, "badland3", "ACH_BADLAND_3")
ds_map_set(global.steam_achievements, "graveyard1", "ACH_GRAVEYARD_1")
ds_map_set(global.steam_achievements, "graveyard2", "ACH_GRAVEYARD_2")
ds_map_set(global.steam_achievements, "graveyard3", "ACH_GRAVEYARD_3")
ds_map_set(global.steam_achievements, "farm1", "ACH_FARM_1")
ds_map_set(global.steam_achievements, "farm2", "ACH_FARM_2")
ds_map_set(global.steam_achievements, "farm3", "ACH_FARM_3")
ds_map_set(global.steam_achievements, "saloon1", "ACH_SALOON_1")
ds_map_set(global.steam_achievements, "saloon2", "ACH_SALOON_2")
ds_map_set(global.steam_achievements, "saloon3", "ACH_SALOON_3")
ds_map_set(global.steam_achievements, "plage1", "ACH_BEACH_1")
ds_map_set(global.steam_achievements, "plage2", "ACH_BEACH_2")
ds_map_set(global.steam_achievements, "plage3", "ACH_BEACH_3")
ds_map_set(global.steam_achievements, "forest1", "ACH_FOREST_1")
ds_map_set(global.steam_achievements, "forest2", "ACH_FOREST_2")
ds_map_set(global.steam_achievements, "forest3", "ACH_FOREST_3")
ds_map_set(global.steam_achievements, "space1", "ACH_SPACE_1")
ds_map_set(global.steam_achievements, "space2", "ACH_SPACE_2")
ds_map_set(global.steam_achievements, "space3", "ACH_SPACE_3")
ds_map_set(global.steam_achievements, "minigolf1", "ACH_GOLF_1")
ds_map_set(global.steam_achievements, "minigolf2", "ACH_GOLF_2")
ds_map_set(global.steam_achievements, "minigolf3", "ACH_GOLF_3")
ds_map_set(global.steam_achievements, "street1", "ACH_STREET_1")
ds_map_set(global.steam_achievements, "street2", "ACH_STREET_2")
ds_map_set(global.steam_achievements, "street3", "ACH_STREET_3")
ds_map_set(global.steam_achievements, "sewer1", "ACH_SEWER_1")
ds_map_set(global.steam_achievements, "sewer2", "ACH_SEWER_2")
ds_map_set(global.steam_achievements, "sewer3", "ACH_SEWER_3")
ds_map_set(global.steam_achievements, "industrial1", "ACH_INDUSTRIAL_1")
ds_map_set(global.steam_achievements, "industrial2", "ACH_INDUSTRIAL_2")
ds_map_set(global.steam_achievements, "industrial3", "ACH_INDUSTRIAL_3")
ds_map_set(global.steam_achievements, "freezer1", "ACH_FREEZER_1")
ds_map_set(global.steam_achievements, "freezer2", "ACH_FREEZER_2")
ds_map_set(global.steam_achievements, "freezer3", "ACH_FREEZER_3")
ds_map_set(global.steam_achievements, "chateau1", "ACH_CHATEAU_1")
ds_map_set(global.steam_achievements, "chateau2", "ACH_CHATEAU_2")
ds_map_set(global.steam_achievements, "chateau3", "ACH_CHATEAU_3")
ds_map_set(global.steam_achievements, "kidsparty1", "ACH_KIDSPARTY_1")
ds_map_set(global.steam_achievements, "kidsparty2", "ACH_KIDSPARTY_2")
ds_map_set(global.steam_achievements, "kidsparty3", "ACH_KIDSPARTY_3")
ds_map_set(global.steam_achievements, "war1", "ACH_WAR_1")
ds_map_set(global.steam_achievements, "war2", "ACH_WAR_2")
ds_map_set(global.steam_achievements, "war3", "ACH_WAR_3")
ds_map_set(global.steam_achievements, "pepperman", "ACH_BOSS_1")
ds_map_set(global.steam_achievements, "vigilante", "ACH_BOSS_2")
ds_map_set(global.steam_achievements, "noise", "ACH_BOSS_3")
ds_map_set(global.steam_achievements, "fakepep", "ACH_BOSS_4")
ds_map_set(global.steam_achievements, "pizzaface", "ACH_BOSS_5")
ds_map_set(global.steam_achievements, "sranks1", "ACH_SRANK_1")
ds_map_set(global.steam_achievements, "sranks2", "ACH_SRANK_2")
ds_map_set(global.steam_achievements, "sranks3", "ACH_SRANK_3")
ds_map_set(global.steam_achievements, "sranks4", "ACH_SRANK_4")
ds_map_set(global.steam_achievements, "sranks5", "ACH_SRANK_5")
ds_map_set(global.steam_achievements, "pranks1", "ACH_PRANK_1")
ds_map_set(global.steam_achievements, "pranks2", "ACH_PRANK_2")
ds_map_set(global.steam_achievements, "pranks3", "ACH_PRANK_3")
ds_map_set(global.steam_achievements, "pranks4", "ACH_PRANK_4")
ds_map_set(global.steam_achievements, "pranks5", "ACH_PRANK_5")
achievements_update = []
achievements_notify = []
notify_queue = ds_queue_create()
unlock_queue = ds_queue_create()
add_rank_achievements(1, "s", 3120, 0, ["entrance", "medieval", "ruin", "dungeon"])
add_rank_achievements(2, "s", 3120, 1, ["badland", "graveyard", "saloon", "farm"])
add_rank_achievements(3, "s", 3120, 2, ["plage", "forest", "space", "minigolf"])
add_rank_achievements(4, "s", 3120, 3, ["street", "sewer", "industrial", "freezer"])
add_rank_achievements(5, "s", 3120, 4, ["chateau", "kidsparty", "war"])
add_rank_achievements(1, "p", 3988, 0, ["entrance", "medieval", "ruin", "dungeon"])
add_rank_achievements(2, "p", 3988, 1, ["badland", "graveyard", "saloon", "farm"])
add_rank_achievements(3, "p", 3988, 2, ["plage", "forest", "space", "minigolf"])
add_rank_achievements(4, "p", 3988, 3, ["street", "sewer", "industrial", "freezer"])
add_rank_achievements(5, "p", 3988, 4, ["chateau", "kidsparty", "war"])
add_boss_achievements("pepperman", 513, 1126, 0)
add_boss_achievements("vigilante", 514, 1126, 1)
add_boss_achievements("noise", 515, 1126, 2)
add_boss_achievements("fakepep", 783, 1126, 3)
add_boss_achievements("pizzaface", 787, 1126, 4)
add_achievement_notify("pal_unfunny", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_6111_gml_Object_obj_achievementtracker_Create_0
{
    var type = argument0[0]
    var arr = argument0[1]
    if (type == (50 << 0) && arr[0] >= 75)
        palette_unlock(name, "unfunny", 3)
}
, 0, "Palettes", "unfunny")
add_achievement_notify("pal_mooney", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_6370_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (57 << 0))
        palette_unlock(name, "mooney", 15)
}
, 0, "Palettes", "mooney")
add_achievement_notify("pal_sage", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_6684_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (5 << 0))
    {
        var _found = 0
        ini_open_from_string(obj_savesystem.ini_str)
        var lvl = ["entrance", "medieval", "ruin", "dungeon"]
        var i = 0
        while (i < array_length(lvl))
        {
            if (ini_read_real("Highscore", lvl[i], 0) == 0)
            {
                _found = 1
                break
            }
            else
            {
                i++
                continue
            }
        }
        ini_close()
        if ((!_found) && global.file_minutes < 60)
            palette_unlock(name, "sage", 5)
    }
}
, 0, "Palettes", "sage")
add_achievement_notify("pal_money", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_7402_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (5 << 0))
    {
        var _money = 0
        ini_open_from_string(obj_savesystem.ini_str)
        lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon"]
        for (i = 0; i < array_length(lvl); i++)
        {
            for (var j = 0; j < 5; j++)
            {
                if (ini_read_real("Toppin", concat(lvl[i], (j + 1)), 0) == 1)
                    _money += 10
            }
        }
        _money -= ini_read_real("w1stick", "reduction", 0)
        _money -= ini_read_real("w2stick", "reduction", 0)
        ini_close()
        if (_money >= 300)
            palette_unlock(name, "money", 4)
    }
}
, 0, "Palettes", "money")
add_achievement_notify("pal_blood", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_8247_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (5 << 0))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        var _count = ini_read_real("Game", "enemies", 0)
        ini_close()
        if (_count >= 1000)
            palette_unlock(name, "blood", 6)
    }
}
, 0, "Palettes", "blood")
add_achievement_notify("pal_tv", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_8656_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (5 << 0))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        _found = 0
        lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"]
        var map = ds_map_create()
        ds_map_set(map, "p", 5)
        ds_map_set(map, "s", 4)
        ds_map_set(map, "a", 3)
        ds_map_set(map, "b", 2)
        ds_map_set(map, "c", 1)
        ds_map_set(map, "d", 0)
        for (i = 0; i < array_length(lvl); i++)
        {
            var rank = ini_read_string("Ranks", lvl[i], "d")
            if (ds_map_find_value(map, rank) < ds_map_find_value(map, "p"))
                _found = 1
        }
        ds_map_destroy(map)
        ini_close()
        if (!_found)
            palette_unlock(name, "tv", 7)
    }
}
, 0, "Palettes", "tv")
add_achievement_notify("pal_dark", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_9685_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (51 << 0) && (arr[0] == "pepperman" || arr[0] == "vigilante" || arr[0] == "noise" || arr[0] == "fakepep" || arr[0] == "pizzaface"))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        _found = 0
        var ach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface"]
        for (i = 0; i < array_length(ach); i++)
        {
            if (ini_read_real("achievements", ach[i], 0) == 0)
                _found = 1
        }
        ini_close()
        if (!_found)
            palette_unlock(name, "dark", 8)
    }
}
, 0, "Palettes", "dark")
add_achievement_notify("pal_shitty", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_10507_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (52 << 0))
        palette_unlock(name, "shitty", 9)
}
, 0, "Palettes", "shitty")
add_achievement_notify("pal_golden", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_10793_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (5 << 0))
    {
        ini_open_from_string(obj_savesystem.ini_str)
        _found = 0
        lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"]
        map = ds_map_create()
        ds_map_set(map, "p", 5)
        ds_map_set(map, "s", 4)
        ds_map_set(map, "a", 3)
        ds_map_set(map, "b", 2)
        ds_map_set(map, "c", 1)
        ds_map_set(map, "d", 0)
        for (i = 0; i < array_length(lvl); i++)
        {
            rank = ini_read_string("Ranks", lvl[i], "d")
            if (ds_map_find_value(map, rank) < ds_map_find_value(map, "s"))
                _found = 1
        }
        ds_map_destroy(map)
        ini_close()
        if (!_found)
            palette_unlock(name, "golden", 10)
    }
}
, 0, "Palettes", "golden")
add_achievement_notify("pal_garish", function() //anon_gml_Object_obj_achievementtracker_Create_0_11819_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("garish_count", 0, 1, 0)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_11897_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (54 << 0))
    {
        achievement_get_variable("garish_count").value = (achievement_get_variable("garish_count").value + 1)
        if (achievement_get_variable("garish_count").value >= 50)
            palette_unlock(name, "garish", 11)
    }
}
, 0, "Palettes", "garish")
add_achievement_notify("pal_funny", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_12318_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (50 << 0) && arr[0] >= 70 && arr[0] < 75)
        palette_unlock(name, "funny", 12, 4019)
}
, 0, "Palettes", "funny")
add_achievement_notify("pal_itchy", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_12669_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "street" && type == (7 << 0) && arr[2] == 690)
        palette_unlock(name, "itchy", 12, 474)
}
, 0, "Palettes", "itchy")
add_achievement_notify("pal_pizza", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_13034_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (53 << 0))
        palette_unlock(name, "pizza", 12, 2897)
}
, 0, "Palettes", "pizza")
add_achievement_notify("pal_stripes", function() //anon_gml_Object_obj_achievementtracker_Create_0_13311_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("stripes_count", 0, 1, 0)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_13390_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (35 << 0))
    {
        achievement_get_variable("stripes_count").value = (achievement_get_variable("stripes_count").value + 1)
        if (achievement_get_variable("stripes_count").value >= 30)
            palette_unlock(name, "stripes", 12, 1678)
    }
}
, 0, "Palettes", "stripes")
add_achievement_notify("pal_goldemanne", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_13827_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (51 << 0))
    {
        lvl = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "space", "minigolf", "street", "sewer", "industrial", "freezer", "chateau", "kidsparty", "war"]
        ach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface", "sranks1", "sranks2", "sranks3", "sranks4", "sranks5"]
        for (i = 0; i < array_length(lvl); i++)
        {
            var b = lvl[i]
            for (j = 0; j < 3; j++)
                array_push(ach, concat(b, (j + 1)))
        }
        _found = 0
        ini_open_from_string(obj_savesystem.ini_str)
        i = 0
        while (i < array_length(ach))
        {
            if (ini_read_real("achievements", ach[i], 0) == 0)
            {
                _found = 1
                break
            }
            else
            {
                i++
                continue
            }
        }
        ini_close()
        if (!_found)
            palette_unlock(name, "goldemanne", 12, 3723)
    }
}
, 0, "Palettes", "goldemanne")
add_achievement_notify("pal_badbones", function() //anon_gml_Object_obj_achievementtracker_Create_0_15025_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("badbones_count", 0, 1, 0)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_15105_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (7 << 0))
    {
        achievement_get_variable("badbones_count").value = (achievement_get_variable("badbones_count").value + 1)
        if (achievement_get_variable("badbones_count").value >= 50)
            palette_unlock(name, "bones", 12, 3951)
    }
}
, 0, "Palettes", "bones")
add_achievement_notify("pal_pp", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_15501_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (53 << 0))
    {
        ini_open_from_string(obj_savesystem.ini_str_options)
        var n = ini_read_real("Game", "beaten", 0)
        n++
        ini_write_real("Game", "beaten", n)
        gamesave_async_save_options()
        obj_savesystem.ini_str_options = ini_close()
        if (n >= obj_bosskeynoise)
            palette_unlock(name, "pp", 12, 3925)
    }
}
, 0, "Palettes", "pp")
add_achievement_notify("pal_war", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_16043_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (5 << 0) && arr[0] == "war")
    {
        ini_open_from_string(obj_savesystem.ini_str)
        n = ini_read_real("Attempts", "war", 0)
        ini_close()
        if (n <= obj_hardmode)
            palette_unlock(name, "war", 12, 845)
    }
}
, 0, "Palettes", "war")
add_achievement_notify("pal_john", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_16542_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (55 << 0) && global.file_minutes < 135)
        palette_unlock(name, "john", 12, 3945)
}
, 0, "Palettes", "john")
add_achievement_notify("entrance1", function() //anon_gml_Object_obj_achievementtracker_Create_0_16885_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("entr1count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_16961_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (14 << 0) && global.leveltosave == "entrance" && arr[0] == 63)
    {
        achievement_get_variable("entr1count").value = (achievement_get_variable("entr1count").value + 1)
        if (achievement_get_variable("entr1count").value >= 16)
            achievement_unlock(name, "John Gutted", 3602, 0)
    }
}
)
add_achievement_notify("entrance2", function() //anon_gml_Object_obj_achievementtracker_Create_0_17437_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_17458_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (5 << 0) && arr[0] == "entrance" && (arr[2] < 2 || (arr[2] == 2 && arr[3] <= 0)))
        achievement_unlock(name, "Let's Make This Quick", 3602, 1)
}
)
add_achievement_notify("entrance3", function() //anon_gml_Object_obj_achievementtracker_Create_0_17829_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("entr3count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_17905_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if ((type == (50 << 0) && arr[0] >= 99 && global.leveltosave == "entrance") || (type == (2 << 0) && global.combo >= 99 && global.leveltosave == "entrance"))
        achievement_unlock(name, "Primate Rage", 3602, 2)
}
)
add_achievement_notify("medieval1", function() //anon_gml_Object_obj_achievementtracker_Create_0_18406_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("med1count", 0, 0, 1)
    achievement_add_variable("med1hurt", 0, 0, 1)
    achievement_add_variable("med1start", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_18602_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "medieval")
    {
        if (type == (56 << 0))
            achievement_get_variable("med1start").value = 1
        else if (type == (32 << 0))
            achievement_get_variable("med1hurt").value = 1
        else if (type == (25 << 0))
        {
            if (achievement_get_variable("med1start").value == 1 && achievement_get_variable("med1hurt").value == 0)
                achievement_get_variable("med1count").value = (achievement_get_variable("med1count").value + 1)
            if (achievement_get_variable("med1count").value >= 5)
                achievement_unlock(name, "Shining Armor", 3483, 0)
            achievement_get_variable("med1hurt").value = 0
        }
    }
}
)
add_achievement_notify("medieval2", function() //anon_gml_Object_obj_achievementtracker_Create_0_19430_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("med2count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_19505_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (4 << 0) && global.leveltosave == "medieval" && arr[1] == 681)
    {
        achievement_get_variable("med2count").value = (achievement_get_variable("med2count").value + 1)
        if (achievement_get_variable("med2count").value >= 10)
            achievement_unlock(name, "Spoonknight", 3483, 1)
    }
}
)
add_achievement_notify("medieval3", function() //anon_gml_Object_obj_achievementtracker_Create_0_19970_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_19991_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (2 << 0) && global.leveltosave == "medieval" && (obj_player1.state == (5 << 0) || (obj_player1.tauntstoredstate == (5 << 0) && obj_player1.state == (61 << 0))) && (obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend || obj_player1.sprite_index == obj_player1.spr_tumble))
        achievement_unlock(name, "Spherical", 3483, 2)
}
)
add_achievement_notify("ruin1", function() //anon_gml_Object_obj_achievementtracker_Create_0_20620_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ruin1hurt", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_20699_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (7 << 0) && global.leveltosave == "ruin" && arr[2] == 586)
        achievement_get_variable("ruin1hurt").value = 1
    else if (type == (5 << 0) && arr[0] == "ruin" && achievement_get_variable("ruin1hurt").value == 0)
        achievement_unlock(name, "Thrill Seeker", 1786, 0)
}
)
add_achievement_notify("ruin2", function() //anon_gml_Object_obj_achievementtracker_Create_0_21248_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_21269_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (34 << 0) && global.leveltosave == "ruin")
        achievement_unlock(name, "Volleybomb", 1786, 1)
}
)
add_achievement_notify("ruin3", function() //anon_gml_Object_obj_achievementtracker_Create_0_21605_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ruin3count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_21681_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (33 << 0) && global.leveltosave == "ruin")
    {
        achievement_get_variable("ruin3count").value = (achievement_get_variable("ruin3count").value + 1)
        if (achievement_get_variable("ruin3count").value >= 350)
            achievement_unlock(name, "Delicacy", 1786, 2)
    }
}
)
add_achievement_notify("dungeon1", function() //anon_gml_Object_obj_achievementtracker_Create_0_22160_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("dun1hurt", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_22238_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (37 << 0) && global.leveltosave == "dungeon")
        achievement_get_variable("dun1hurt").value = 1
    else if (type == (5 << 0) && arr[0] == "dungeon" && achievement_get_variable("dun1hurt").value == 0)
        achievement_unlock(name, "Very Very Hot Sauce", 2450, 0)
}
)
add_achievement_notify("dungeon2", function() //anon_gml_Object_obj_achievementtracker_Create_0_22792_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_22813_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.panic && type == (42 << 0) && global.leveltosave == "dungeon" && arr[0] >= 120)
        achievement_unlock(name, "Eruption Man", 2450, 1)
}
)
add_achievement_notify("dungeon3", function() //anon_gml_Object_obj_achievementtracker_Create_0_23189_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("dun3hurt", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_23267_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (7 << 0) && global.leveltosave == "dungeon" && arr[2] == 810)
        achievement_get_variable("dun3hurt").value = 1
    else if (type == (5 << 0) && arr[0] == "dungeon" && achievement_get_variable("dun3hurt").value == 0)
        achievement_unlock(name, "Unsliced Pizzaman", 2450, 2)
}
)
add_achievement_notify("badland1", function() //anon_gml_Object_obj_achievementtracker_Create_0_23829_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_23850_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (48 << 0) && global.leveltosave == "badland")
        achievement_unlock(name, "Peppino's Rain Dance", 4186, 0)
}
)
add_achievement_notify("badland2", function() //anon_gml_Object_obj_achievementtracker_Create_0_24180_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("bad2count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_24255_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (2 << 0) && global.leveltosave == "badland" && arr[2] == 401)
    {
        achievement_get_variable("bad2count").value = (achievement_get_variable("bad2count").value + 1)
        if (achievement_get_variable("bad2count").value >= 5)
            achievement_unlock(name, "Unnecessary Violence", 4186, 1)
    }
}
)
add_achievement_notify("badland3", function() //anon_gml_Object_obj_achievementtracker_Create_0_24731_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("bad3hurt", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_24809_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (38 << 0) && global.leveltosave == "badland")
        achievement_get_variable("bad3hurt").value = 1
    else if (type == (5 << 0) && arr[0] == "badland" && achievement_get_variable("bad3hurt").value == 0)
        achievement_unlock(name, "Alien Cow", 4186, 2)
}
)
add_achievement_notify("graveyard1", function() //anon_gml_Object_obj_achievementtracker_Create_0_25336_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("grav1hurt", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_25415_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (40 << 0) && global.leveltosave == "graveyard")
        achievement_get_variable("grav1hurt").value = 1
    else if (type == (5 << 0) && arr[0] == "graveyard" && achievement_get_variable("grav1hurt").value == 0)
        achievement_unlock(name, "Ghosted", 3774, 0)
}
)
add_achievement_notify("graveyard2", function() //anon_gml_Object_obj_achievementtracker_Create_0_25992_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("grav2count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_26135_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "graveyard")
    {
        if (type == (2 << 0) && (obj_player1.state == (16 << 0) || (obj_player1.state == (61 << 0) && obj_player1.tauntstoredstate == (16 << 0))))
        {
            achievement_get_variable("grav2count").value = (achievement_get_variable("grav2count").value + 1)
            if (achievement_get_variable("grav2count").value >= 20)
                achievement_unlock(name, "Pretend Ghost", 3774, 1)
        }
    }
}
)
add_achievement_notify("graveyard3", function() //anon_gml_Object_obj_achievementtracker_Create_0_27077_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("grav3count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_27153_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (39 << 0) && global.leveltosave == "graveyard")
    {
        achievement_get_variable("grav3count").value = (achievement_get_variable("grav3count").value + 1)
        if (achievement_get_variable("grav3count").value >= 10)
            achievement_unlock(name, "Alive and Well", 3774, 2)
    }
}
)
add_achievement_notify("farm1", function() //anon_gml_Object_obj_achievementtracker_Create_0_27614_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("f1_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_27688_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (3 << 0))
    {
        n = achievement_get_variable("f1_count")
        var r = room_get_name(arr[1])
        if (obj_player.state == (84 << 0) && (string_letters(r) == "farm" || string_letters(r) == "farmb"))
        {
            n.value++
            if (n.value >= 3)
                achievement_unlock(name, "No one is safe", 3086, 2)
        }
    }
}
)
add_achievement_notify("farm2", -4, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_28234_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (6 << 0))
        achievement_unlock(name, "Cube Menace", 3086, 1)
}
)
add_achievement_notify("farm3", function() //anon_gml_Object_obj_achievementtracker_Create_0_28489_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("f3_hurted", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_28568_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if ((type == (7 << 0) || type == (8 << 0)) && (arr[1] == (11 << 0) || arr[1] == (14 << 0) || arr[1] == (13 << 0) || arr[1] == (12 << 0)))
        achievement_get_variable("f3_hurted").value = 1
    if (type == (5 << 0) && arr[0] == "farm" && (!achievement_get_variable("f3_hurted").value))
        achievement_unlock(name, "Good Egg", 3086, 0)
}
)
add_achievement_notify("saloon1", function() //anon_gml_Object_obj_achievementtracker_Create_0_29200_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("s1_beer", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_29273_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (9 << 0) && global.leveltosave == "saloon")
    {
        achievement_get_variable("s1_beer").value = (achievement_get_variable("s1_beer").value + 1)
        if (achievement_get_variable("s1_beer").value >= 58)
            achievement_unlock(name, "Non-Alcoholic", 3950, 0)
    }
}
)
add_achievement_notify("saloon2", function() //anon_gml_Object_obj_achievementtracker_Create_0_29719_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("s2_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_29793_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (10 << 0) && global.leveltosave == "saloon")
        achievement_get_variable("s2_count").value = (achievement_get_variable("s2_count").value + 1)
    else if (type == (5 << 0))
    {
        arr = argument0[1]
        if (arr[0] == "saloon" && achievement_get_variable("s2_count").value == 9)
            achievement_unlock(name, "Already Pressed", 3950, 1)
    }
}
)
add_achievement_notify("saloon3", function() //anon_gml_Object_obj_achievementtracker_Create_0_30298_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("s3_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_30372_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (11 << 0) && global.leveltosave == "saloon")
    {
        achievement_get_variable("s3_count").value = (achievement_get_variable("s3_count").value + 1)
        if (achievement_get_variable("s3_count").value >= 8)
            achievement_unlock(name, "Royal Flush", 3950, 2)
    }
}
)
add_achievement_notify("plage1", function() //anon_gml_Object_obj_achievementtracker_Create_0_30779_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_30800_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (12 << 0) && global.leveltosave == "plage" && arr[1] == 661 && arr[3] == 527)
        achievement_unlock(name, "Blowback", 3359, 0)
}
)
add_achievement_notify("plage2", function() //anon_gml_Object_obj_achievementtracker_Create_0_31155_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("b2_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_31229_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (13 << 0) && global.leveltosave == "plage" && arr[1] == 649)
    {
        achievement_get_variable("b2_count").value = (achievement_get_variable("b2_count").value + 1)
        if (achievement_get_variable("b2_count").value >= 7)
            achievement_unlock(name, "X Marks The Spot", 3359, 1)
    }
}
)
add_achievement_notify("plage3", function() //anon_gml_Object_obj_achievementtracker_Create_0_31710_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("b3_hurt", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_31787_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (7 << 0) && global.leveltosave == "plage" && arr[2] == 586)
        achievement_get_variable("b3_hurt").value = 1
    else if (type == (5 << 0) && arr[0] == "plage" && achievement_get_variable("b3_hurt").value == 0)
        achievement_unlock(name, "Demolition Expert", 3359, 2)
}
)
add_achievement_update("forest1", 5, -4, function() //anon_gml_Object_obj_achievementtracker_Create_0_32326_gml_Object_obj_achievementtracker_Create_0
{
    if (global.leveltosave == "forest")
    {
        b = 0
        with (obj_player)
        {
            if ((!b) && state == (84 << 0) && distance_to_object(obj_beedeco) < 300)
                b = 1
        }
        if b
            achievement_unlock(name, "Bee Nice", 3991, 0)
    }
}
)
add_achievement_notify("forest2", function() //anon_gml_Object_obj_achievementtracker_Create_0_32721_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fo2_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_32796_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (14 << 0) && global.leveltosave == "forest" && (arr[0] == 461 || arr[0] == 482))
    {
        achievement_get_variable("fo2_count").value = (achievement_get_variable("fo2_count").value + 1)
        if (achievement_get_variable("fo2_count").value >= 183)
            achievement_unlock(name, "Lumberjack", 3991, 1)
    }
}
)
add_achievement_notify("forest3", function() //anon_gml_Object_obj_achievementtracker_Create_0_33466_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_33487_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (12 << 0) && global.leveltosave == "forest" && arr[1] == 660 && arr[3] == 639)
        achievement_unlock(name, "Bullseye", 3991, 2)
}
)
add_achievement_update("space1", 1, function() //anon_gml_Object_obj_achievementtracker_Create_0_33912_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sp1_hit", 0, 0, 1)
}
, function() //anon_gml_Object_obj_achievementtracker_Create_0_33989_gml_Object_obj_achievementtracker_Create_0
{
    if (room == space_10)
    {
        if instance_exists(obj_fadeout)
        {
            if (obj_player1.targetDoor == "B")
                achievement_get_variable("sp1_hit").value = 0
        }
        b = 0
        with (obj_antigravbubble)
        {
            if (sprite_index == spr_antigrav_bubblesquish)
                b = 1
        }
        if b
            achievement_get_variable("sp1_hit").value = 1
        var _q = 0
        with (obj_player1)
        {
            if (y < 608)
                _q = 1
        }
        if (_q && achievement_get_variable("sp1_hit").value == 0)
            achievement_unlock(name, "Turbo Tunnel", 477, 0)
    }
}
)
add_achievement_notify("space2", function() //anon_gml_Object_obj_achievementtracker_Create_0_34685_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sp2_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_34760_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (14 << 0) && global.leveltosave == "space" && arr[0] == 505)
    {
        achievement_get_variable("sp2_count").value = (achievement_get_variable("sp2_count").value + 1)
        if (achievement_get_variable("sp2_count").value >= 18)
            achievement_unlock(name, "Blast Em Asteroids", 477, 2)
    }
}
)
add_achievement_notify("space3", function() //anon_gml_Object_obj_achievementtracker_Create_0_35309_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("space3count", 0, 0, 1)
    achievement_add_variable("space3start", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_35449_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "space")
    {
        if (type == (0 << 0))
            achievement_get_variable("space3start").value = 1
        else if (achievement_get_variable("space3start").value == 1 && type == (2 << 0) && arr[2] == 686)
        {
            achievement_get_variable("space3count").value = (achievement_get_variable("space3count").value + 1)
            trace("Meteor Man Count: ", achievement_get_variable("space3count").value)
            if (achievement_get_variable("space3count").value >= 5)
                achievement_unlock(name, "Man Meteor", 477, 1)
        }
        else if (type == (1 << 0))
        {
            achievement_get_variable("space3start").value = 0
            achievement_get_variable("space3count").value = 0
        }
    }
}
)
add_achievement_notify("minigolf1", function() //anon_gml_Object_obj_achievementtracker_Create_0_36366_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("g1_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_36440_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (18 << 0) && arr[0] == 3749)
    {
        achievement_get_variable("g1_count").value = (achievement_get_variable("g1_count").value + 1)
        if (achievement_get_variable("g1_count").value >= 9)
            achievement_unlock(name, "Primo Golfer", 1659, 0)
    }
}
)
add_achievement_notify("minigolf2", function() //anon_gml_Object_obj_achievementtracker_Create_0_36868_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("g2_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_36942_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (16 << 0) && (arr[0] == 530 || arr[0] == 530))
        achievement_get_variable("g2_count").value = 0
    else if (type == (17 << 0))
    {
        achievement_get_variable("g2_count").value = (achievement_get_variable("g2_count").value + 1)
        if (achievement_get_variable("g2_count").value >= 3)
            achievement_unlock(name, "Nice Shot", 1659, 1)
    }
}
)
add_achievement_notify("minigolf3", function() //anon_gml_Object_obj_achievementtracker_Create_0_37497_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("g3_hit", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_37573_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (16 << 0))
    {
        if (arr[0] == 1054)
            achievement_get_variable("g3_hit").value = 1
        else
            achievement_get_variable("g3_hit").value = 0
    }
    else if (type == (18 << 0) && achievement_get_variable("g3_hit").value == 1)
        achievement_unlock(name, "Helpful Burger", 1659, 2)
}
)
add_achievement_update("street1", 60, -4, function() //anon_gml_Object_obj_achievementtracker_Create_0_38099_gml_Object_obj_achievementtracker_Create_0
{
    if (room == street_bacon)
        achievement_unlock(name, "Pan Fried", 1795, 0)
}
)
add_achievement_notify("street2", function() //anon_gml_Object_obj_achievementtracker_Create_0_38313_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("st2_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_38388_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (global.leveltosave == "street")
    {
        if (type == (19 << 0))
            achievement_get_variable("st2_count").value = 0
        else if (type == (21 << 0))
        {
            achievement_get_variable("st2_count").value = (achievement_get_variable("st2_count").value + 1)
            if (achievement_get_variable("st2_count").value >= 3)
                achievement_unlock(name, "Strike!", 1795, 1)
        }
    }
}
)
add_achievement_notify("street3", function() //anon_gml_Object_obj_achievementtracker_Create_0_38906_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("st3_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_38981_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (22 << 0))
    {
        achievement_get_variable("st3_count").value = (achievement_get_variable("st3_count").value + 1)
        if (achievement_get_variable("st3_count").value >= 14)
            achievement_unlock(name, "Say Oink!", 1795, 2)
    }
}
)
add_achievement_notify("sewer1", function() //anon_gml_Object_obj_achievementtracker_Create_0_39374_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sw1_killed", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_39454_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (23 << 0))
        achievement_get_variable("sw1_killed").value = 1
    else if (type == (5 << 0) && arr[0] == "sewer" && achievement_get_variable("sw1_killed").value == 0)
        achievement_unlock(name, "Can't Fool Me", 3680, 0)
}
)
add_achievement_notify("sewer2", function() //anon_gml_Object_obj_achievementtracker_Create_0_39906_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sw2_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_39981_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "sewer" && type == (4 << 0) && arr[1] == 680)
    {
        achievement_get_variable("sw2_count").value = (achievement_get_variable("sw2_count").value + 1)
        if (achievement_get_variable("sw2_count").value >= 10)
            achievement_unlock(name, "Food Clan", 3680, 1)
    }
}
)
add_achievement_notify("sewer3", function() //anon_gml_Object_obj_achievementtracker_Create_0_40456_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("sw3_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_40531_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "sewer" && global.panic && type == (24 << 0))
        achievement_get_variable("sw3_count").value = (achievement_get_variable("sw3_count").value + 1)
    else if (type == (5 << 0) && arr[0] == "sewer" && achievement_get_variable("sw3_count").value <= 0)
        achievement_unlock(name, "Penny Pincher", 3680, 2)
}
)
add_achievement_notify("industrial1", function() //anon_gml_Object_obj_achievementtracker_Create_0_41109_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("i1_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_41183_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "industrial" && type == (25 << 0) && (arr[2] == (33 << 0) || arr[2] == (35 << 0) || arr[2] == (34 << 0)))
    {
        achievement_get_variable("i1_count").value = (achievement_get_variable("i1_count").value + 1)
        if (achievement_get_variable("i1_count").value >= 4)
            achievement_unlock(name, "Unflattenning", 1412, 0)
    }
}
)
add_achievement_notify("industrial2", function() //anon_gml_Object_obj_achievementtracker_Create_0_41744_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("i2_count", 0, 0, 1)
    achievement_add_variable("i2_hurt", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_41877_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (room == industrial_secret1)
    {
        if (type == (2 << 0) && arr[2] == 217)
            achievement_get_variable("i2_count").value = (achievement_get_variable("i2_count").value + 1)
        else if (type == (7 << 0))
            achievement_get_variable("i2_hurt").value = 1
    }
    if (type == (27 << 0) && arr[0] == 678 && achievement_get_variable("i2_hurt").value == 0 && achievement_get_variable("i2_count").value >= 11)
        achievement_unlock(name, "Whoop This", 1412, 1)
}
)
add_achievement_notify("industrial3", function() //anon_gml_Object_obj_achievementtracker_Create_0_42589_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("i3_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_42663_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "industrial" && type == (2 << 0) && arr[2] == 657)
    {
        achievement_get_variable("i3_count").value = (achievement_get_variable("i3_count").value + 1)
        if (achievement_get_variable("i3_count").value >= 31)
            achievement_unlock(name, "There Can Be Only One", 1412, 2)
    }
}
)
add_achievement_notify("freezer1", function() //anon_gml_Object_obj_achievementtracker_Create_0_43148_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fr1_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_43223_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (global.leveltosave == "freezer" && type == (28 << 0))
    {
        achievement_get_variable("fr1_count").value = (achievement_get_variable("fr1_count").value + 1)
        if (achievement_get_variable("fr1_count").value >= 13)
            achievement_unlock(name, "Frozen Nuggets", 4177, 0)
    }
}
)
add_achievement_notify("freezer2", function() //anon_gml_Object_obj_achievementtracker_Create_0_43651_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fr2_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_43726_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "freezer" && type == (2 << 0) && arr[2] == 907)
    {
        achievement_get_variable("fr2_count").value = (achievement_get_variable("fr2_count").value + 1)
        if (achievement_get_variable("fr2_count").value >= 5)
            achievement_unlock(name, "Frozen Nuggets", 4177, 1)
    }
}
)
add_achievement_notify("freezer3", function() //anon_gml_Object_obj_achievementtracker_Create_0_44206_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("fr3_fall", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_44284_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (8 << 0) && global.leveltosave == "freezer")
        achievement_get_variable("fr3_fall").value = 1
    else if (type == (5 << 0) && arr[0] == "freezer" && achievement_get_variable("fr3_fall").value == 0)
        achievement_unlock(name, "Ice Climber", 4177, 2)
}
)
add_achievement_notify("chateau1", function() //anon_gml_Object_obj_achievementtracker_Create_0_44790_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ch1_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_44865_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "chateau" && type == (2 << 0) && arr[2] == 259)
    {
        achievement_get_variable("ch1_count").value = (achievement_get_variable("ch1_count").value + 1)
        if (achievement_get_variable("ch1_count").value >= 30)
            achievement_unlock(name, "Cross To Bare", 2353, 0)
    }
}
)
add_achievement_notify("chateau2", function() //anon_gml_Object_obj_achievementtracker_Create_0_45344_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ch2_hurt", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_45422_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (7 << 0) && (arr[2] == 556 || arr[2] == 302))
        achievement_get_variable("ch2_hurt").value = 1
    if (type == (5 << 0) && arr[0] == "chateau" && (!achievement_get_variable("ch2_hurt").value))
        achievement_unlock(name, "Haunted Playground", 2353, 1)
}
)
add_achievement_notify("chateau3", function() //anon_gml_Object_obj_achievementtracker_Create_0_45942_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("ch3_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_46017_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (15 << 0) && global.leveltosave == "chateau")
    {
        achievement_get_variable("ch3_count").value = (achievement_get_variable("ch3_count").value + 1)
        if (achievement_get_variable("ch3_count").value >= 10)
            achievement_unlock(name, "Skullsplitter", 2353, 2)
    }
}
)
add_achievement_notify("kidsparty1", function() //anon_gml_Object_obj_achievementtracker_Create_0_46491_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("kp1_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_46566_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    if (type == (29 << 0) && global.leveltosave == "kidsparty" && global.panic && room != kidsparty_secret1)
    {
        achievement_get_variable("kp1_count").value = (achievement_get_variable("kp1_count").value + 1)
        if (achievement_get_variable("kp1_count").value >= 9)
            achievement_unlock(name, "And This... Is My Gun-On-A-Stick!", 3582, 0)
    }
}
)
add_achievement_notify("kidsparty2", function() //anon_gml_Object_obj_achievementtracker_Create_0_47081_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("kp2_count", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_47156_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (30 << 0) && global.leveltosave == "kidsparty" && (!global.panic))
        achievement_get_variable("kp2_count").value = (achievement_get_variable("kp2_count").value + 1)
    else if (type == (20 << 0) && arr[0] == 609)
    {
        if (achievement_get_variable("kp2_count").value <= 6)
            achievement_unlock(name, "Let Them Sleep", 3582, 1)
    }
}
)
add_achievement_notify("kidsparty3", function() //anon_gml_Object_obj_achievementtracker_Create_0_47705_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("kp3_hurted", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_47785_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (31 << 0) && global.leveltosave == "kidsparty")
        achievement_get_variable("kp3_hurted").value = 1
    else if (type == (5 << 0) && arr[0] == "kidsparty")
    {
        if (achievement_get_variable("kp3_hurted").value == 0)
            achievement_unlock(name, "Jumpspared", 3582, 2)
    }
}
)
add_achievement_notify("war1", function() //anon_gml_Object_obj_achievementtracker_Create_0_48296_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("war1hurt", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_48370_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (7 << 0) && global.leveltosave == "war")
        achievement_get_variable("war1hurt").value = (achievement_get_variable("war1hurt").value + 1)
    else if (type == (5 << 0) && arr[0] == "war" && achievement_get_variable("war1hurt").value <= 3)
        achievement_unlock(name, "Decorated Veteran", 738, 0)
}
)
add_achievement_notify("war2", function() //anon_gml_Object_obj_achievementtracker_Create_0_48912_gml_Object_obj_achievementtracker_Create_0
{
    achievement_add_variable("war2_missed", 0, 0, 1)
    achievement_add_variable("war2_hit", 0, 0, 1)
    achievement_add_variable("war2_start", 0, 0, 1)
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_49111_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (global.leveltosave == "war")
    {
        if (type == (43 << 0))
        {
            achievement_get_variable("war2_hit").value = 0
            achievement_get_variable("war2_start").value = 1
        }
        else if ((type == (2 << 0) || type == (3 << 0) || type == (45 << 0) || type == (46 << 0)) && achievement_get_variable("war2_start").value == 1)
            achievement_get_variable("war2_hit").value = 1
        else if (type == (44 << 0))
        {
            var val = achievement_get_variable("war2_hit").value
            achievement_get_variable("war2_start").value = 0
            if (!val)
            {
                achievement_get_variable("war2_missed").value = (achievement_get_variable("war2_missed").value + 1)
                trace("Shot missed!")
            }
        }
    }
    if (type == (5 << 0) && arr[0] == "war" && achievement_get_variable("war2_missed").value <= 3)
        achievement_unlock(name, "Sharpshooter", 738, 1)
}
)
add_achievement_notify("war3", function() //anon_gml_Object_obj_achievementtracker_Create_0_50413_gml_Object_obj_achievementtracker_Create_0
{
}
, function(argument0) //anon_gml_Object_obj_achievementtracker_Create_0_50434_gml_Object_obj_achievementtracker_Create_0
{
    type = argument0[0]
    arr = argument0[1]
    if (type == (47 << 0) && arr[0] >= 1)
        achievement_unlock(name, "Trip to the Warzone", 738, 2)
}
)
