function add_secrets_achievement(argument0, argument1) //add_secrets_achievement
{
    var b = add_achievement_notify(concat("secrets", argument0), -4, function(argument0) //anon_add_secrets_achievement_gml_GlobalScript_scr_achievementcommon_135_add_secrets_achievement_gml_GlobalScript_scr_achievementcommon
    {
        var type = argument0[0]
        if (type == (5 << 0))
        {
            var n = levelarray
            var _unfinished = 0
            ini_open_from_string(obj_savesystem.ini_str)
            for (var i = 0; i < array_length(n); i++)
            {
                b = n[i]
                var s = ini_read_real("Secret", b, 0)
                if (s < 3)
                    _unfinished = 1
            }
            ini_close()
            if (!_unfinished)
                achievement_unlock(name, -4, 3086, 0)
        }
    }
)
    b.levelarray = argument1
}

function add_rank_achievements(argument0, argument1, argument2, argument3, argument4) //add_rank_achievements
{
    b = add_achievement_notify(concat(argument1, "ranks", argument0), -4, function(argument0) //anon_add_rank_achievements_gml_GlobalScript_scr_achievementcommon_875_add_rank_achievements_gml_GlobalScript_scr_achievementcommon
    {
        type = argument0[0]
        if (type == (5 << 0))
        {
            n = levelarray
            var _finished = 1
            ini_open_from_string(obj_savesystem.ini_str)
            var map = ds_map_create()
            ds_map_set(map, "d", 0)
            ds_map_set(map, "c", 1)
            ds_map_set(map, "b", 2)
            ds_map_set(map, "a", 3)
            ds_map_set(map, "s", 4)
            ds_map_set(map, "p", 5)
            for (i = 0; i < array_length(n); i++)
            {
                b = n[i]
                s = ini_read_string("Ranks", b, "d")
                if (ds_map_find_value(map, s) < ds_map_find_value(map, rank))
                    _finished = 0
            }
            ds_map_destroy(map)
            ini_close()
            if _finished
                achievement_unlock(name, "", sprite, index)
        }
    }
)
    b.rank = argument1
    b.levelarray = argument4
    b.sprite = argument2
    b.index = argument3
}

function add_boss_achievements(argument0, argument1, argument2, argument3) //add_boss_achievements
{
    b = add_achievement_notify(argument0, -4, function(argument0) //anon_add_boss_achievements_gml_GlobalScript_scr_achievementcommon_1812_add_boss_achievements_gml_GlobalScript_scr_achievementcommon
    {
        type = argument0[0]
        var arr = argument0[1]
        if (type == (49 << 0) && arr[0] == bossroom && (!global.bossplayerhurt))
            achievement_unlock(name, "", sprite, index)
    }
)
    b.sprite = argument2
    b.index = argument3
    b.bossroom = argument1
}

function scr_custom_notification_destructibles() //scr_custom_notification_destructibles
{
    active = 0
    function anon_scr_custom_notification_destructibles_gml_GlobalScript_scr_achievementcommon_2191_scr_custom_notification_destructibles_gml_GlobalScript_scr_achievementcommon() //anon_scr_custom_notification_destructibles_gml_GlobalScript_scr_achievementcommon_2191_scr_custom_notification_destructibles_gml_GlobalScript_scr_achievementcommon
    {
        if (!active)
        {
            if (!(place_meeting(x, y, obj_destructibles)))
            {
                active = 1
                notification_push((15 << 0), [room])
            }
        }
    }

}

