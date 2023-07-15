if (brownfade < 1)
{
    shader_set(global.Pal_Shader)
    pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture)
    if (global.collect >= global.collectN)
        pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, 0)
    if (global.collectN > global.collect)
        pal_swap_set(obj_player2.spr_palette, obj_player2.paletteselect, 0)
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
    pattern_reset()
    shader_reset()
}
if brown
{
    draw_set_alpha(brownfade)
    shader_set(shd_rank)
    draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_white, c_white, c_white, c_white, 0)
    draw_self()
    shader_reset()
    draw_set_alpha(1)
}
var c = c_white
var xx = 523
var cash_y = 0
var sep = 89
if toppinvisible
{
    for (var i = (array_length(toppin) - 1); i >= 0; i--)
    {
        if (toppin[i] == 0)
            c = c_black
        else
            c = c_white
        if (toppin[i] == 1)
        {
            switch i
            {
                case 0:
                    cash_y = -60
                    break
                case 1:
                    cash_y = -40
                    break
                case 2:
                    cash_y = -22
                    break
                case 3:
                    cash_y = -52
                    break
                case 4:
                    cash_y = -46
                    break
            }

            var _x = (xx + (sep * i))
            var _y = (toppin_y[i] + cash_y)
            draw_sprite_ext(spr_ranktoppins_cash, 0, _x, _y, 1, toppin_yscale[i], 0, c, 1)
            if createmoney[i]
            {
                global.pigtotal_add += 10
                createmoney[i] = 0
                with (instance_create(_x, (_y - 50), obj_moneynumber))
                {
                    number = "$10"
                    depth = (other.depth - 1)
                }
            }
        }
        draw_sprite_ext(spr_ranktoppins, i, (xx + (sep * i)), toppin_y[i], 1, toppin_yscale[i], 0, c, 1)
    }
}
draw_set_font(lang_get_font("bigfont"))
draw_set_halign(fa_left)
draw_set_valign(fa_top)
for (i = 0; i < array_length(text); i++)
{
    var b = text[i]
    if b[0]
        draw_text_color(48, (48 + (32 * i)), b[1], c_white, c_white, c_white, c_white, 1)
}
