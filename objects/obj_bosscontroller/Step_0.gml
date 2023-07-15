switch state
{
    case (144 << 0):
        scr_bosscontroller_intro()
        break
    case (0 << 0):
        scr_bosscontroller_normal()
        break
    case (98 << 0):
        scr_bosscontroller_victory()
        break
}

if (!round_timer_init)
{
    round_timer = round_timermax
    round_timer_init = 1
}
player_index += 0.35
boss_index += 0.35
player_index = wrap(player_index, 0, sprite_get_number(player_hpsprite))
boss_index = wrap(boss_index, 0, sprite_get_number(boss_hpsprite))
if (room == boss_vigilante)
{
    if ((instance_exists(obj_vigilanteboss) && obj_vigilanteboss.state == (274 << 0)) || instance_exists(obj_vigilante_duelintro))
        image_alpha = 0
    else
        image_alpha = Approach(image_alpha, 1, 0.1)
    with (obj_targetguy)
        image_alpha = other.image_alpha
    with (obj_hppickup)
        image_alpha = other.image_alpha
}
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    playerspr = spr_vsnoise
    playerspr_xscale = -1
    if (bossspr == spr_vsnoise)
        bossspr = spr_vsdoise
    player_hpsprite = spr_bossfight_noiseHP
    if (vstitle == 1880)
        vstitle = 4234
    if (vstitle == 3203)
        vstitle = 4233
    if (vstitle == 2479)
        vstitle = 4232
    if (vstitle == 1886)
        vstitle = 4236
    if (vstitle == 1405)
        vstitle = 4237
    if (vstitle == 230)
        vstitle = 4235
}
