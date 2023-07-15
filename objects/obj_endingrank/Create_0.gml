rank_spr = spr_rank_holyshit
music = fmod_event_create_instance("event:/music/finalrank")
fmod_event_instance_play(music)
bg_index = 0
bg_x = 0
bg_y = 0
sprite_index = spr_finaljudgement
image_speed = 0.35
fade = 1
state = 0
introbuffer = 300
brown = 0
brownfade = 0
depth = -601
alarm[0] = 1
with (obj_music)
{
    if (music != noone)
        fmod_event_instance_stop(music.event, 1)
}
var mins = global.file_minutes
var hours = 0
while (mins > 59)
{
    hours++
    mins -= 60
}
if (hours < 10)
    hours = concat("0", hours)
else
    hours = concat(hours)
if (mins < 10)
    mins = concat("0", mins)
else
    mins = concat(mins)
var secs = global.file_seconds
if (secs < 10)
    secs = concat("0", secs)
else
    secs = concat(secs)
var levels = ["entrance", "medieval", "ruin", "dungeon", "badland", "graveyard", "farm", "saloon", "plage", "forest", "minigolf", "space", "sewer", "industrial", "street", "freezer", "chateau", "war", "kidsparty", "exit", "w1stick", "w2stick", "w3stick", "w4stick", "w5stick"]
ini_open_from_string(obj_savesystem.ini_str)
var damage = ini_read_real("Game", "damage", 0)
var _score = 0
var _enemies = ini_read_real("Game", "enemies", 0)
for (var i = 0; i < array_length(levels); i++)
    _score += ini_read_real("Highscore", levels[i], 0)
var _perc = get_percentage()
if (_perc >= 95)
    rank_spr = spr_rank_wow
else if (_perc >= 83)
    rank_spr = spr_rank_notbad
else if (_perc >= 72)
    rank_spr = spr_rank_nojudgement
else if (_perc >= 61)
    rank_spr = spr_rank_officer
else if (_perc >= 50)
    rank_spr = spr_rank_confused
else
    rank_spr = spr_rank_yousuck
if (ini_read_string("Game", "finalrank", "none") == "none")
{
    if (global.file_minutes < 240 && _perc >= 95)
        rank_spr = spr_rank_holyshit
    else if (global.file_minutes < 120)
        rank_spr = spr_rank_quick
}
if (ini_read_string("Game", "finalrank", "none") == "holyshit")
    rank_spr = spr_rank_holyshit
var r = "yousuck"
switch rank_spr
{
    case 2314:
        r = "wow"
        break
    case 2097:
        r = "notbad"
        break
    case 3279:
        r = "nojudgement"
        break
    case 4092:
        r = "confused"
        break
    case 3367:
        r = "holyshit"
        break
    case 1743:
        r = "quick"
        break
    case 2994:
        r = "officer"
        break
}

switch rank_spr
{
    case 2913:
        bg_index = 0
        break
    case 2314:
        bg_index = 6
        break
    case 2097:
        bg_index = 5
        break
    case 3279:
        bg_index = 4
        break
    case 4092:
        bg_index = 1
        break
    case 3367:
        bg_index = 7
        break
    case 1743:
        bg_index = 2
        break
    case 2994:
        bg_index = 3
        break
}

ini_write_string("Game", "finalrank", r)
if (ini_read_real("Game", "snotty", 0) == 0)
    ini_write_real("Game", "finalsnotty", 1)
obj_savesystem.ini_str = ini_close()
gamesave_async_save()
percentage = _perc
percvisual = 0
text = [[0, concat(lang_get_value("rank_totaltime"), hours, ":", mins, ":", secs)], [0, concat(lang_get_value("rank_totaldamage"), damage)], [0, concat(lang_get_value("rank_totalscore"), _score)], [0, concat(lang_get_value("rank_totalenemies"), _enemies)]]
text_pos = 0
