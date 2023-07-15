if ((!global.option_hud) || (instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud)))
    return;
var xx = x
var yy = y
draw_set_color(c_white)
draw_sprite(spr_comboend, 0, xx, yy)
var title = floor((combo / 5))
if (title > (sprite_get_number(spr_comboend_title1) / 2))
{
    title -= (sprite_get_number(spr_comboend_title1) / 2)
    if (very == 0)
        very = 1
    else
        very = 2
}
if (combo >= 80)
    very = 1
if (combo >= 160)
    very = 2
draw_sprite(spr_comboend_title1, ((title * 2) + title_index), xx, (yy + 30))
draw_set_font(lang_get_font("smallfont"))
draw_set_halign(fa_center)
draw_set_valign(fa_top)
draw_text(xx, (yy + 70), comboscoremax)
if very
    draw_sprite(spr_combovery, 0, (xx - 65), ((yy - 6) + 30))
if (very == 2)
    draw_sprite(spr_combovery, 0, (xx - 60), ((yy - 34) + 30))
