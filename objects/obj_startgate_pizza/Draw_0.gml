draw_self()
if (obj_player.ispeppino == 0)
{
    draw_sprite_ext(spr_pizzascore_noise, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
    if (sprite_index == spr_gatepizza_2 || sprite_index == spr_gatepizza_3 || sprite_index == spr_gatepizza_4 || sprite_index == spr_gatepizza_5)
        draw_sprite_ext(spr_pizzascore_mallow, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
    if (sprite_index == spr_gatepizza_3 || sprite_index == spr_gatepizza_4 || sprite_index == spr_gatepizza_5)
        draw_sprite_ext(spr_pizzascore_choco, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
    if (sprite_index == spr_gatepizza_4 || sprite_index == spr_gatepizza_5)
        draw_sprite_ext(spr_pizzascore_skittles, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
    if (sprite_index == spr_gatepizza_5)
        draw_sprite_ext(spr_pizzascore_candycorn, image_index, x, y, image_xscale, image_yscale, 0, c_white, 1)
}
if (state > 0)
{
    draw_set_valign(fa_top)
    draw_set_halign(fa_left)
    draw_set_font(global.collectfont)
    var text_y = 0
    switch floor(image_index)
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

    var str = "0"
    var fontpalettespr = spr_font_palette
    if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
        fontpalettespr = spr_palette_font_noise
    else
        fontpalettespr = spr_font_palette
    var len = array_length(highscore)
    var num = (string_length(str) * len)
    var w = (string_width(str) * len)
    var xx = (x - (w / 2))
    for (var i = 0; i < len; i++)
    {
        var b = highscore[i]
        var _char = b[0]
        var _char_y = b[1]
        var yy = (((i + 1) % 2) == 0 ? -5 : 0)
        var c = color_array[i]
        shader_set(global.Pal_Shader)
        pal_swap_set(fontpalettespr, c, 0)
        var ty = 0
        if (_char_y >= y)
            ty = text_y
        draw_text(xx, (((_char_y + yy) - 56) + ty), _char)
        shader_reset()
        xx += (w / num)
    }
    draw_sprite_ext(spr_ranks_hud, rank_index, x, (y + 58), rank_scale, rank_scale, 0, c_white, 1)
}
