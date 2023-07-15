state = 0
snd = fmod_event_create_instance("event:/sfx/ending/towercollapse")
credits = [[-4, lang_get_value_newline("credits_game")], [-4, string_replace_all(lang_get_value_newline("credits_music"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline("credits_sfx"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline("credits_mort"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline("credits_playtester1"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline("credits_playtester2"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline("credits_playtester3"), "%", "\"")], [-4, string_replace_all(lang_get_value_newline("credits_playtester4"), "%", "\"")], [0, -4], [1, -4], [2, -4], [3, -4], [4, -4], [5, -4], [6, -4], [7, -4], [9, -4], [10, -4], [11, -4], [12, -4], [-4, lang_get_value_newline("credits_fmod")]]
var i = 0
while (i < array_length(credits))
{
    if (credits[i][0] == 7)
    {
        if (!global.johnresurrection)
            credits[i][0] = 8
        break
    }
    else
    {
        i++
        continue
    }
}
bgalpha = 3
credits_pos = 0
draw_set_font(lang_get_font("creditsfont"))
draw_set_halign(fa_left)
draw_set_valign(fa_top)
skiptext = scr_compile_icon_text(lang_get_value("menu_skip"))
showtext = 0
fade = 0
whitefade = 0
image_speed = 0.35
puffbuffer = 0
introbuffer = 0
spawn_arr = [217, 199, 299, 314, 162, 3979, 467, 549, 329, 171, 293, 225, 388, 2658, 125, 353, 1576, 1131, 908, 1940, 416, 3776, 395, 478, 523, 2347, 1171, 512, 2951, 429, 378, 293, 137, 1162, 2393, 4157, 446, 570, 539]
with (instance_create(0, 0, obj_introprop))
{
    sprite_index = spr_towerending_bg
    depth = -3
}
with (instance_create(0, 0, obj_introprop))
{
    sprite_index = spr_towerending
    depth = -7
}
with (instance_create(0, 0, obj_introprop))
{
    sprite_index = spr_towerending_bosses
    depth = -8
}
with (instance_create(145, 345, obj_introprop))
{
    sprite_index = spr_towerending_mrstick
    depth = -8
}
with (instance_create(369, 409, obj_introprop))
{
    sprite_index = spr_towerending_gustavo
    depth = -8
}
with (instance_create(484, 386, obj_introprop))
{
    sprite_index = spr_towerending_brick
    depth = -8
}
with (instance_create(288, 408, obj_introprop))
{
    sprite_index = spr_towerending_peppino
    depth = -9
}
towerID = instance_create(468, 188, obj_introprop)
with (towerID)
{
    hitY = (y - 100)
    depth = -5
    sprite_index = spr_towerending_tower
}
with (obj_player)
    state = (18 << 0)
depth = -10
