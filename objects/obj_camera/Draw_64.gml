draw_set_alpha(1)
if (is_bossroom() || room == tower_options || room == tower_noisemech || room == editor_room || room == Titlescreen || instance_exists(obj_tutorialbook))
    return;
if global.kungfu
{
    if (global.hp == 8)
        draw_sprite(spr_pizzahealthbar, 0, 190, 70)
    else if (global.hp == 7)
        draw_sprite(spr_pizzahealthbar, 1, 190, 70)
    else if (global.hp == 6)
        draw_sprite(spr_pizzahealthbar, 2, 190, 70)
    else if (global.hp == 5)
        draw_sprite(spr_pizzahealthbar, 3, 190, 70)
    else if (global.hp == 4)
        draw_sprite(spr_pizzahealthbar, 4, 190, 70)
    else if (global.hp == 3)
        draw_sprite(spr_pizzahealthbar, 5, 190, 70)
    else if (global.hp == 2)
        draw_sprite(spr_pizzahealthbar, 6, 190, 70)
    else if (global.hp == 1)
        draw_sprite(spr_pizzahealthbar, 7, 190, 70)
    else if (global.hp == 0)
        draw_sprite(spr_pizzahealthbar, 8, 190, 70)
}
if (obj_player.state != (89 << 0))
{
    if (obj_player.x < 250 && obj_player.y < 169)
        hud_posY = Approach(hud_posY, -300, 15)
    else
        hud_posY = Approach(hud_posY, 0, 15)
    var sw = sprite_get_width(spr_heatmeter_fill)
    var sh = sprite_get_height(spr_heatmeter_fill)
    var b = global.stylemultiplier
    var cmb = image_speed
    if (!global.heatmeter)
    {
        if (global.collect >= global.srank)
        {
            if scr_is_p_rank()
                cmb = 0.4
            else
                cmb = 0.35
        }
        else if (global.collect >= global.arank)
            cmb = 0.3
        else if (global.collect >= global.brank)
            cmb = 0.2
        else if (global.collect >= global.crank)
            cmb = 0.15
        else
            cmb = 0.1
    }
    else
        cmb = ((global.stylethreshold / 10) + 0.1)
    if global.panic
    {
        cmb += 0.1
        if (global.fill < 1)
            cmb += 0.05
        if (global.lap != 0)
            cmb += (global.laps / 2)
    }
    pizzascore_index += cmb
    if (pizzascore_index == (pizzascore_number - 1))
        pizzascore_index = 0
    hud_xx = (118 + irandom_range((-collect_shake), collect_shake))
    hud_yy = ((62 + irandom_range((-collect_shake), collect_shake)) + hud_posY)
    if global.heatmeter
    {
        draw_sprite_part(spr_heatmeter_fill, pizzascore_index, 0, 0, (sw * b), sh, (hud_xx - 95), (hud_yy + 24))
        shader_set(global.Pal_Shader)
        pal_swap_set(138, global.stylethreshold, 0)
        draw_sprite_ext(spr_heatmeter, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
        reset_shader_fix()
    }
    draw_sprite_ext(pizzascore_sprite, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
    var _score = global.collect
    if global.coop
        _score += global.collectN
    if (_score >= global.crank)
        draw_sprite_ext(pizzascore_topping1, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
    if (_score >= global.brank)
        draw_sprite_ext(pizzascore_topping2, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
    if (_score >= global.arank)
        draw_sprite_ext(pizzascore_topping3, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
    if (_score >= global.srank)
        draw_sprite_ext(pizzascore_topping4, pizzascore_index, hud_xx, hud_yy, 1, 1, 0, c_white, alpha)
    var rx = (hud_xx + 142)
    var ry = (hud_yy - 14)
    var rank_ix = 0
    if (_score >= global.srank && scr_is_p_rank())
        rank_ix = 5
    else if (_score >= global.srank)
        rank_ix = 4
    else if (_score >= global.arank)
        rank_ix = 3
    else if (_score >= global.brank)
        rank_ix = 2
    else if (_score >= global.crank)
        rank_ix = 1
    rank_scale = Approach(rank_scale, 1, 0.2)
    var spr_w = sprite_get_width(previoushudsprite)
    var spr_h = sprite_get_height(previoushudsprite)
    var spr_xo = sprite_get_xoffset(previoushudsprite)
    var spr_yo = sprite_get_yoffset(previoushudsprite)
    var perc = 0
    if (previousrank != rank_ix)
    {
        var _snd = global.snd_rankup
        previousrank = rank_ix
        if (rank_ix < previousrank)
            _snd = global.snd_rankdown
        fmod_event_instance_play(_snd)
        fmod_event_instance_set_parameter(_snd, "state", (rank_ix - 1), 1)
        rank_scale = 3
    }
    if (previoushudsprite != ranksprite)
    {
        previoushudsprite = ranksprite
        fmod_event_instance_play(global.snd_rankup)
        fmod_event_instance_set_parameter(global.snd_rankup, "state", (rank_ix - 1), 1)
        rank_scale = 3
    }
    draw_sprite_ext(ranksprite, rank_ix, rx, ry, rank_scale, rank_scale, 0, c_white, 1)
    switch rank_ix
    {
        case 4:
            perc = 1
            break
        case 3:
            perc = ((_score - global.arank) / (global.srank - global.arank))
            break
        case 2:
            perc = ((_score - global.brank) / (global.arank - global.brank))
            break
        case 1:
            perc = ((_score - global.crank) / (global.brank - global.crank))
            break
        default:
            perc = (_score / global.crank)
    }

    var t = (spr_h * perc)
    var top = (spr_h - t)
    draw_sprite_part_ext(hudfillsprite, rank_ix, 0, top, spr_w, (spr_h - top), (rx - (spr_xo * rank_scale)), ((ry - spr_yo) + top), rank_scale, rank_scale, c_white, 1)
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)
    draw_set_font(global.collectfont)
    var text_y = 0
    switch floor(pizzascore_index)
    {
        case 1:
        case 2:
        case 3:
            text_y = 1
            break
        case 5:
        case 10:
            text_y = -1
            break
        case 6:
        case 9:
            text_y = -2
            break
        case 7:
            text_y = -3
            break
        case 8:
            text_y = -5
            break
    }

    var cs = 0
    with (obj_comboend)
        cs += comboscore
    with (obj_particlesystem)
    {
        for (var i = 0; i < ds_list_size(global.collect_list); i++)
            cs += ds_list_find_value(global.collect_list, i).value
    }
    var sc = ((_score - global.comboscore) - cs)
    if (sc < 0)
        sc = 0
    var str = string(sc)
    var num = string_length(str)
    var w = string_width(str)
    var xx = (hud_xx - (w / 2))
    if (lastcollect != sc)
    {
        color_array = array_create(num, 0)
        for (i = 0; i < array_length(color_array); i++)
        {
            if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
                color_array[i] = (choose(irandom(6)) + 1)
            else
                color_array[i] = choose(irandom(3))
        }
        lastcollect = sc
    }
    draw_set_alpha(alpha)
    for (i = 0; i < num; i++)
    {
        var yy = (((i + 1) % 2) == 0 ? -5 : 0)
        var c = color_array[i]
        shader_set(global.Pal_Shader)
        pal_swap_set(fontpalettespr, c, 0)
        draw_text(floor(xx), floor((((hud_yy - 56) + text_y) + yy)), string_char_at(str, (i + 1)))
        shader_reset()
        xx += (w / num)
    }
    draw_set_alpha(1)
    reset_shader_fix()
    draw_set_font(lang_get_font("bigfont"))
    draw_set_halign(fa_center)
    draw_set_color(c_white)
}
if (obj_player.movespeed < 2.4 || (!((obj_player.state == (103 << 0) || obj_player.state == (104 << 0) || obj_player.state == (121 << 0) || obj_player.state == (115 << 0) || obj_player.state == (105 << 0) || obj_player.state == (65 << 0) || obj_player.state == (42 << 0)))) || obj_player.sprite_index == obj_player.spr_bodyslamstart)
{
    spr_speedbarHUD = spr_speedbar
    if (spr_speedbar_index > 0)
        spr_speedbar_index -= 1
    else
        spr_speedbar_index = bg_chateauscrolldeco
}
else if ((obj_player.movespeed >= 2.4 && obj_player.movespeed < 4.8 && (obj_player.state == (103 << 0) || obj_player.state == (104 << 0) || obj_player.state == (121 << 0) || obj_player.state == (37 << 0) || obj_player.state == (105 << 0) || obj_player.state == (65 << 0) || obj_player.state == (42 << 0))) || obj_player.sprite_index == obj_player.spr_bodyslamstart || obj_player.sprite_index == obj_player.spr_bodyslamfall)
{
    spr_speedbarHUD = spr_speedbar
    if (spr_speedbar_index < 1)
        spr_speedbar_index += 1
    else if (spr_speedbar_index > 1)
        spr_speedbar_index -= 1
    else
        spr_speedbar_index = spr_plug
}
else if ((obj_player.movespeed >= 4.8 && obj_player.movespeed < 7.2 && (obj_player.state == (103 << 0) || obj_player.state == (104 << 0) || obj_player.state == (121 << 0) || obj_player.state == (37 << 0) || obj_player.state == (105 << 0) || obj_player.state == (65 << 0) || obj_player.state == (42 << 0))) || obj_player.sprite_index == obj_player.spr_bodyslamstart || obj_player.sprite_index == obj_player.spr_bodyslamfall)
{
    spr_speedbarHUD = spr_speedbar
    if (spr_speedbar_index < 2)
        spr_speedbar_index += 1
    else if (spr_speedbar_index > 2)
        spr_speedbar_index -= 1
    else
        spr_speedbar_index = spr_cheeseblob
}
else if ((obj_player.movespeed >= 7.2 && obj_player.movespeed < 9.6 && (obj_player.state == (103 << 0) || obj_player.state == (104 << 0) || obj_player.state == (121 << 0) || obj_player.state == (37 << 0) || obj_player.state == (105 << 0) || obj_player.state == (65 << 0) || obj_player.state == (42 << 0))) || obj_player.sprite_index == obj_player.spr_bodyslamstart || obj_player.sprite_index == obj_player.spr_bodyslamfall)
{
    spr_speedbarHUD = spr_speedbar
    if (spr_speedbar_index < 3)
        spr_speedbar_index += 1
    else if (spr_speedbar_index > 4)
        spr_speedbar_index -= 1
    else
        spr_speedbar_index = spr_entrancepillarsecret
}
else if ((obj_player.movespeed >= 9.6 && obj_player.movespeed < 12 && (obj_player.state == (103 << 0) || obj_player.state == (104 << 0) || obj_player.state == (121 << 0) || obj_player.state == (37 << 0) || obj_player.state == (105 << 0) || obj_player.state == (65 << 0) || obj_player.state == (42 << 0))) || obj_player.sprite_index == obj_player.spr_bodyslamstart || obj_player.sprite_index == obj_player.spr_bodyslamfall)
{
    spr_speedbarHUD = spr_speedbar
    if (spr_speedbar_index < 4)
        spr_speedbar_index += 1
    else if (spr_speedbar_index > 4)
        spr_speedbar_index -= 1
    else
        spr_speedbar_index = spr_introasset2
}
else if ((obj_player.movespeed >= 12 && (obj_player.state == (103 << 0) || obj_player.state == (104 << 0) || obj_player.state == (121 << 0) || obj_player.state == (37 << 0) || obj_player.state == (105 << 0) || obj_player.state == (65 << 0) || obj_player.state == (97 << 0) || obj_player.state == (42 << 0))) || obj_player.sprite_index == obj_player.spr_bodyslamstart || obj_player.sprite_index == obj_player.spr_bodyslamfall)
{
    if (obj_player.movespeed >= 16 || obj_player.vsp > 12)
    {
        spr_speedbarHUD = spr_speedbarmax
        spr_speedbar_index += 0.3
    }
    else
    {
        spr_speedbarHUD = spr_speedbar
        if (spr_speedbar_index < 5)
            spr_speedbar_index += 1
        else
            spr_speedbar_index = spr_animeshot2
    }
}
else
    spr_speedbarHUD = spr_speedbar
if (spr_speedbarHUD != -4)
    draw_sprite_ext(spr_speedbarHUD, spr_speedbar_index, 125, ((28 + (global.heatmeter * 35)) + hud_yy), 1, 1, 1, c_white, alpha)
var theroomname = room_get_name(room)
if (string_pos("tutorial", theroomname) != 0 || string_pos("title", theroomname) != 0)
    visible = false
