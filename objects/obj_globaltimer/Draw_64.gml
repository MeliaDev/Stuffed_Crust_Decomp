if ((!global.option_timer) || room == Realtitlescreen || room == Longintro || room == Finalintro || room == Mainmenu || room == hub_loadingscreen || room == Creditsroom || room == Johnresurrectionroom || room == rank_room || instance_exists(obj_titlecard) || (!global.option_hud))
    return;
if ((!global.option_hud) || (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud)))
    return;
draw_set_color(c_white)
var seconds = 0
var minutes = 0
var s_str = ""
var m_str = ""
if (global.option_timer_type == 0)
{
    seconds = global.level_seconds
    minutes = global.level_minutes
}
else if (global.option_timer_type == 1)
{
    seconds = global.file_seconds
    minutes = global.file_minutes
}
var mm = frac(seconds)
mm = string(mm)
mm = string_copy(mm, 3, (string_length(mm) - 3))
while (string_length(mm) < 1)
    mm += "0"
while (string_length(mm) > 2)
    mm = string_delete(mm, string_length(mm), 1)
var sd = floor(seconds)
if (sd < 10)
    s_str = concat(0, sd)
else
    s_str = string(sd)
minutes = floor(minutes)
var hours = 0
while (minutes > 59)
{
    minutes -= 60
    hours++
}
if (minutes < 10)
    m_str = concat(0, minutes)
else
    m_str = string(minutes)
if (hours < 10)
    hours = concat(0, hours)
else
    hours = string(hours)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_set_font(global.smallfont)
draw_set_alpha(1)
draw_set_color(c_white)
var finalstr = concat(hours, ":", m_str, ":", s_str, ".", mm)
draw_text((obj_screensizer.actual_width - ((string_length(finalstr) - 1) * string_width("A"))), (obj_screensizer.actual_height - 8), finalstr)
