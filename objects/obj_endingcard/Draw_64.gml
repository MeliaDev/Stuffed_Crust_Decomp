if showsprite
    draw_self()
if (text != -4)
{
    draw_set_halign(fa_center)
    draw_set_valign(fa_middle)
    draw_set_font(lang_get_font("creditsfont"))
    draw_text_color((obj_screensizer.actual_width / 2), (obj_screensizer.actual_height / 2), text, c_white, c_white, c_white, c_white, text_alpha)
}
