if instance_exists(obj_keyconfig)
    return;
reset_blendmode()
reset_shader_fix()
if (fade > 0)
{
    draw_set_color(c_white)
    if pause
    {
        draw_set_alpha(1)
        scr_draw_pause_image()
    }
    draw_set_alpha((fade - 0.5))
    draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_white, c_white, c_white, c_white, 0)
    draw_set_alpha(fade)
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_set_font(lang_get_font("bigfont"))
    var h = string_height("A")
    var pad = 16
    var len = array_length(pause_menu)
    var wh = ((h * len) + (pad * (len - 1)))
    var yy = ((obj_screensizer.actual_height / 2) - (wh / 2))
    for (var i = 0; i < len; i++)
    {
        var b = pause_menu[i]
        var c = c_gray
        var t = lang_get_value(b)
        if (selected == i)
        {
            var cx = (((obj_screensizer.actual_width / 2) - (string_width(t) / 2)) - 60)
            if update_cursor
            {
                cursor_x = ((cursor_actualx + cursor_x) - cx)
                cursor_y = ((cursor_actualy + cursor_y) - yy)
                update_cursor = 0
            }
            cursor_actualx = cx
            cursor_actualy = yy
            draw_sprite(spr_pizzaangel, cursor_index, (cx + cursor_x), (yy + cursor_y))
            c = c_white
        }
        if (b == "pause_restart" && global.leveltorestart == -4)
            c = 4210752
        draw_text_color((obj_screensizer.actual_width / 2), yy, t, c, c, c, c, fade)
        scr_pauseicon_draw(i, (((obj_screensizer.actual_width / 2) + (string_width(t) / 2)) + 50), yy)
        yy += (h + pad)
    }
}
draw_set_alpha(1)
draw_sprite_ext(spr_pause_border, 0, border1_x, border1_y, -1, 1, 0, c_white, 1)
draw_sprite_ext(spr_pause_border, 0, border2_x, border2_y, 1, 1, 0, c_white, 1)
draw_sprite_ext(spr_pause_vine, 0, (obj_screensizer.actual_width / 2), vine_y, 1, 1, 0, c_white, 1)
var lvlsave = global.leveltosave
if (fade > 0 && lvlsave != -4 && lvlsave != "tutorial" && lvlsave != "towerentrance" && lvlsave != "exit" && room != boss_fakepep && room != boss_fakepephallway && room != boss_fakepepkey && room != boss_vigilante && room != boss_noise && room != boss_pepperman && room != boss_pizzaface && room != Endingroom && room != Johnresurrectionroom && room != Creditsroom && string_copy(room_get_name(room), 1, 5) != "tower")
{
    draw_set_alpha((fade - treasurealpha))
    draw_sprite(spr_treasurefound_pause, (!treasurefound), 80, (obj_screensizer.actual_height - 60))
    draw_set_alpha((fade - secretalpha))
    draw_sprite(spr_secretportal_idle, 0, (obj_screensizer.actual_width - 132), (obj_screensizer.actual_height - 124))
    draw_set_font(global.combofont)
    draw_set_halign(fa_right)
    draw_set_valign(fa_middle)
    draw_set_color(c_white)
    draw_text(((obj_screensizer.actual_width - 132) - 60), ((obj_screensizer.actual_height - 124) - 8), concat(secretcount, "/3"))
    draw_set_alpha(1)
}
if (transfotext != -4)
{
    draw_set_alpha(fade)
    draw_set_font(lang_get_font("creditsfont"))
    draw_set_halign(fa_left)
    draw_set_valign(fa_top)
    draw_set_color(c_white)
    var xx = (obj_screensizer.actual_width / 2)
    yy = (obj_screensizer.actual_height - 50)
    var s = transfotext_size
    xx -= (s[0] / 2)
    yy -= s[1]
    xx = floor(xx)
    yy = floor(yy)
    scr_draw_text_arr(xx, yy, transfotext, c_white, fade)
    draw_set_alpha(1)
}
pause_draw_priests()
