if (is_bossroom() || room == tower_options || room == tower_noisemech || room == editor_room || room == Titlescreen || instance_exists(obj_tutorialbook))
    return;
draw_set_font(lang_get_font("bigfont"))
draw_set_halign(fa_center)
draw_set_color(c_white)
draw_set_alpha(1)
if ((obj_player1.state == (187 << 0) || obj_player1.state == (203 << 0)) && obj_player1.ramp)
    draw_text((obj_player1.x - camera_get_view_x(view_camera[0])), ((obj_player1.y - 100) - camera_get_view_y(view_camera[0])), concat("X", obj_player1.ramp_points, " TRICKS", "\nTAUNT"))
var collect_x = irandom_range((-collect_shake), collect_shake)
var collect_y = irandom_range((-collect_shake), collect_shake)
var _cx = (tv_x + combo_posX)
var _cy = (((tv_y + 120) + hud_posY) + combo_posY)
var _perc = (global.combotime / 60)
var _minX = (_cx - 64)
var _maxX = (_cx + 59)
combofill_x = lerp(combofill_x, (_minX + ((_maxX - _minX) * _perc)), 0.5)
combofill_y = _cy
draw_sprite(spr_tv_combobubblefill, combofill_index, combofill_x, combofill_y)
draw_sprite(spr_tv_combobubble, -1, _cx, _cy)
draw_set_font(global.combofont2)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var _tx = (_cx - 59)
var _ty = (_cy - 12)
var _str = string(visualcombo)
var num = string_length(_str)
for (var i = num; i > 0; i--)
{
    var char = string_char_at(_str, i)
    draw_text(_tx, _ty, char)
    _tx -= 23
    _ty -= 5
}
if (room != strongcold_endscreen)
{
    if (!vigimode)
    {
        draw_sprite_ext(tv_bg_sprite, tv_bg_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
        if global.tvbackground
        {
            draw_sprite_ext(spr_tv_bgfinal_shadow, 0, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, 0.25)
            scr_hub_bg_draw((tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 862, 1, 0)
        }
        else
            draw_sprite_ext(tv_bg_shadow, tv_bg_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), 1, 1, 0, c_white, alpha)
    }
    else
    {
        if (global.playerhealth <= 8)
            pizzahealth = global.playerhealth
        draw_sprite(spr_pizzahealthbar, pizzahealth, ((tv_x - 70) + obj_camera.healthshake), ((tv_y - 6) + obj_camera.healthshake))
    }
    shader_set(global.Pal_Shader)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
    pal_swap_set(spr_palette, obj_player1.paletteselect, 0)
    draw_sprite_ext(sprite_index, image_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), tvxscale, 1, 0, c_white, alpha)
    if global.noisejetpack
    {
        pal_swap_set(spr_palette, 2, 0)
        draw_sprite_ext(sprite_index, image_index, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY), tvxscale, 1, 0, c_white, alpha)
    }
    pattern_reset()
    reset_shader_fix()
    if (state == (250 << 0) && (!vigimode))
        draw_sprite(spr_tv_whitenoise, tv_trans, (tv_x + collect_x), ((tv_y + collect_y) + hud_posY))
}
if (bubblespr != -4)
    draw_sprite_ext(bubblespr, bubbleindex, (obj_screensizer.actual_width - 448), 53, 1, 1, 1, c_white, alpha)
if (!surface_exists(promptsurface))
    promptsurface = surface_create(290, 102)
surface_set_target(promptsurface)
draw_clear_alpha(c_black, 0)
draw_set_font(font1)
draw_set_halign(fa_left)
draw_set_valign(fa_middle)
if (bubblespr == spr_tv_bubble)
{
    promptx -= promptspd
    if (bubblespr != 579 && promptx < (350 - string_width(prompt)))
    {
        bubblespr = spr_tv_bubbleclose
        bubbleindex = 0
    }
    draw_text_color((promptx - 350), 50, prompt, c_black, c_black, c_black, c_black, 1)
}
draw_set_halign(fa_left)
surface_reset_target()
draw_surface(promptsurface, (obj_screensizer.actual_width - 610), 0)
draw_set_font(global.smallnumber_fnt)
draw_set_halign(fa_center)
var theroomname = room_get_name(room)
if (string_pos("tutorial", theroomname) == 0)
{
    if global.panic
    {
        var _fill = global.fill
        var _currentbarpos = (chunkmax - _fill)
        _perc = (_currentbarpos / chunkmax)
        var _max_x = 299
        var _barpos = (_max_x * _perc)
        if (!surface_exists(bar_surface))
            bar_surface = surface_create(298, 30)
        var _barfillpos = (floor(_barpos) + 13)
        if (_barfillpos > 0)
        {
            surface_resize(bar_surface, _barfillpos, 30)
            surface_set_target(bar_surface)
            draw_clear_alpha(c_black, 0)
            var clip_x = (timer_x + 3)
            var clip_y = (timer_y + 5)
            for (i = 0; i < 3; i++)
                draw_sprite(spr_timer_barfill, 0, (barfill_x + (i * 173)), 0)
            surface_reset_target()
            draw_surface(bar_surface, clip_x, clip_y)
        }
        draw_sprite(spr_timer_bar, -1, timer_x, timer_y)
        draw_sprite(johnface_sprite, johnface_index, ((timer_x + 13) + _barpos), (timer_y + 20))
        if global.timeattack
            draw_sprite(hand_sprite, hand_index, (timer_x - 110), (timer_y + 40))
        var timerspr = pizzaface_sprite
        if timer_tower
            timerspr = spr_timer_tower
        draw_sprite(timerspr, pizzaface_index, (timer_x + 320), (timer_y + 10))
        var minutes = 0
        for (var seconds = ceil((global.fill / 12)); seconds > 59; seconds -= 60)
            minutes++
        if (seconds < 10)
            seconds = concat("0", seconds)
        else
            seconds = string(seconds)
        draw_set_halign(fa_center)
        draw_set_valign(fa_middle)
        draw_set_font(global.bigfont)
        draw_text((timer_x + 153), (timer_y + 18), concat(minutes, ":", seconds))
    }
    else if surface_exists(bar_surface)
        surface_free(bar_surface)
}
else
    visible = false
draw_set_halign(fa_left)
draw_set_valign(fa_top)
var hud_xx = 90
var hud_yy = 480
var bx = (hud_xx - 63)
var bx2 = (hud_xx - 63)
var by = (hud_yy + 24)
var bpad = 25
var bspr = spr_peppinobullet_collectible
if (global.shootkeyattack == 4)
{
    bpad = 37
    bspr = spr_fuelHUD
}
if (global.shootkeyattack == 5)
{
    bpad = 25
    bspr = spr_peppinobullet_collectible
}
if (!obj_player1.ispeppino)
{
    bx = (hud_xx - 69)
    by = (hud_yy + 78)
    bspr = spr_playerN_noisebomb
}
bx += (bpad * global.fuel)
bx2 += (bpad * 5)
if (obj_player1.ispeppino && obj_player1.character == "P" && (!obj_player1.isgustavo))
{
    if (global.shootkeyattack == 4 || global.shootkeyattack == 5)
    {
        for (i = 0; i < 5; i++)
        {
            bx2 -= bpad
            draw_sprite_ext(bspr, -4, bx2, by, 1, 1, 0, c_black, alpha)
        }
        for (i = 0; i < global.fuel; i++)
        {
            bx -= bpad
            draw_sprite_ext(bspr, -4, bx, by, 1, 1, 0, c_white, alpha)
        }
    }
}
if (!obj_player1.ispeppino)
    character = "THE NOISE"
if obj_player1.ispeppino
    character = "PEPPINO"
if obj_player1.isgustavo
    character = "GUSTAVO"
