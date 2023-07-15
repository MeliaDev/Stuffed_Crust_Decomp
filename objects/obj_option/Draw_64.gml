draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_black, c_black, c_black, c_black, 0)
for (var i = 0; i < array_length(bg_alpha); i++)
    draw_sprite_tiled_ext(spr_optionsBG, i, bg_x, bg_y, 1, 1, c_white, bg_alpha[i])
if (room != Mainmenu)
{
    with (obj_keyconfig)
        event_perform(ev_draw, ev_gui)
}
if (instance_exists(obj_keyconfig) || instance_exists(obj_screenconfirm))
{
}
draw_set_font(lang_get_font("bigfont"))
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
var _os = optionselected
var m = menus[menu]
var options = m.options
var len = array_length(options)
var size = ((string_height("A") * len) + (len * m.ypad))
var xx = (obj_screensizer.actual_width / 2)
var yy = ((obj_screensizer.actual_height / 2) - (size / 4))
switch m.anchor
{
    case (0 << 0):
        draw_set_halign(fa_center)
        draw_set_valign(fa_top)
        var c = c_white
        var a = 1
        for (i = 0; i < len; i++)
        {
            var o = options[i]
            c = c_gray
            if (i == _os)
                c = c_white
            var t = lang_get_value(o.name)
            draw_text_color(xx, (yy + (m.ypad * i)), t, c, c, c, c, a)
            if (menu == (0 << 0))
                scr_pauseicon_draw(i, ((xx + (string_width(t) / 2)) + 50), (yy + (m.ypad * i)))
        }
        break
    case (1 << 0):
        draw_set_halign(fa_left)
        draw_set_valign(fa_top)
        xx = m.xpad
        c = c_white
        a = 1
        for (i = 0; i < len; i++)
        {
            draw_set_halign(fa_left)
            o = options[i]
            c = c_gray
            if (i == _os)
                c = c_white
            if (o.type == (2 << 0) && (!o.localization))
                var txt = o.name
            else
                txt = lang_get_value(o.name)
            draw_text_color(xx, (yy + (m.ypad * i)), txt, c, c, c, c, a)
            draw_set_halign(fa_right)
            switch o.type
            {
                case (0 << 0):
                    draw_text_color((obj_screensizer.actual_width - m.xpad), (yy + (m.ypad * i)), (o.value ? lang_get_value("option_on") : lang_get_value("option_off")), c, c, c, c, a)
                    break
                case (3 << 0):
                    var w = 200
                    var h = 5
                    var aw = (w * (o.value / 100))
                    var x1 = ((obj_screensizer.actual_width - m.xpad) - w)
                    var y1 = (yy + (m.ypad * i))
                    var x2 = (x1 + aw)
                    var y2 = (y1 + h)
                    var spr = spr_slidericon
                    if (menu != (1 << 0))
                        spr = spr_slidericon2
                    draw_set_alpha(a)
                    draw_sprite_ext(spr_slider, 0, x1, y1, 1, 1, 0, c_dkgray, a)
                    draw_sprite_ext(spr_slider, 0, x1, y1, 1, 1, 0, c, a)
                    draw_set_alpha(1)
                    draw_sprite(spr, o.moving, x2, (y2 - h))
                    break
                case (1 << 0):
                    var select = o.values[o.value]
                    var n = select.name
                    if select.localization
                        n = lang_get_value(select.name)
                    draw_text_color((obj_screensizer.actual_width - m.xpad), (yy + (m.ypad * i)), n, c, c, c, c, a)
                    break
            }

        }
        break
}

if (room != Mainmenu)
{
    with (obj_transfotip)
        event_perform(ev_draw, ev_gui)
}
