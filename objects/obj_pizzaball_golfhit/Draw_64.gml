if ((!global.option_hud) || (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud)))
    return;
if instance_exists(obj_ghostcollectibles)
    return;
draw_self()
draw_sprite(spr_pizzaball_primoburg, 0, (obj_screensizer.actual_width - 120), y)
draw_set_font(global.bigfont)
draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_text_color((x - 91), (y - 117), hit, c_white, c_white, c_white, c_white, 1)
draw_text_color(((obj_screensizer.actual_width - 120) + 43), (y - 58), primoburg, c_white, c_white, c_white, c_white, 1)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
