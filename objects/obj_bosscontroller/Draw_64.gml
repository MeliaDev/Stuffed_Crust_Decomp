if (instance_exists(obj_pizzafaceboss_p3intro) || instance_exists(obj_blackoutline))
{
}
if (image_alpha <= 0)
{
}
switch state
{
    case (144 << 0):
        if (arenastate < 3)
        {
            draw_set_alpha(1)
            draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_white, c_white, c_white, c_white, 0)
            draw_sprite_ext(playerspr, -1, playerx, obj_screensizer.actual_height, playerspr_xscale, 1, 0, c_black, 1)
            draw_sprite_ext(bossspr, -1, bossx, obj_screensizer.actual_height, 1, 1, 0, c_black, 1)
            draw_set_alpha(whitefade)
            draw_rectangle_color(0, 0, obj_screensizer.actual_width, obj_screensizer.actual_height, c_white, c_white, c_white, c_white, 0)
            draw_set_alpha(1)
        }
        else
        {
            draw_sprite_tiled(spr_versusflame, -1, 0, flamey)
            var c_player = c_white
            var sx = irandom_range((-introshake), introshake)
            var sy = irandom_range((-introshake), introshake)
            var _index = 0
            var _xs = 1
            var _ys = 1
            if (bossspr == spr_vspizzaface)
            {
                if (glitchbuffer > 0)
                {
                    glitchalpha = 1
                    glitchbuffer--
                }
                else if (glitchalpha > 0)
                {
                    glitchalpha -= 0.1
                    _index = 1
                }
                else
                    glitchbuffer = 120
            }
            var px = (playerx + sx)
            var py = (obj_screensizer.actual_height + sy)
            var bx = (bossx + sy)
            var by = (obj_screensizer.actual_height + sy)
            if (px > 0)
                px = 0
            if (py < obj_screensizer.actual_height)
                py = obj_screensizer.actual_height
            if (bx < obj_screensizer.actual_width)
                bx = obj_screensizer.actual_width
            if (by < obj_screensizer.actual_height)
                by = obj_screensizer.actual_height
            shader_set(global.Pal_Shader)
            pattern_set(global.Base_Pattern_Color, playerspr, 0, 1, 1, global.palettetexture)
            if (obj_player1.character == "N" || (obj_player1.character == "P" && (!obj_player1.ispeppino)))
                pal_swap_set(1425, obj_player1.paletteselect, 0)
            else
                pal_swap_set(707, obj_player1.paletteselect, 0)
            draw_sprite_ext(playerspr, -1, px, py, playerspr_xscale, 1, 0, c_player, 1)
            if (bossspr == spr_vsfakepep || bossspr == spr_vsfakepep2)
            {
                pattern_set(global.Base_Pattern_Color, bossspr, 0, _xs, _ys, global.palettetexture)
                pal_swap_set(707, obj_player1.paletteselect, 0)
            }
            else if (bossspr == spr_vsnoise)
            {
                pattern_set(global.Base_Pattern_Color, bossspr, 0, _xs, _ys, global.palettetexture)
                pal_swap_set(1425, 1, 0)
            }
            else
                pal_swap_set(707, 0, 0)
            draw_sprite_ext(bossspr, 0, bx, by, _xs, _ys, 0, c_player, 1)
            pattern_reset()
            reset_shader_fix()
            if (_index == 1)
                draw_sprite_ext(bossspr, _index, bx, by, _xs, _ys, 0, c_player, glitchalpha)
            var xx = (irandom_range(-1, 1) + sx)
            var yy = (irandom_range(-1, 1) + sy)
            draw_sprite(vstitle, -1, xx, yy)
        }
        break
    case (0 << 0):
    case (98 << 0):
        shader_set(global.Pal_Shader)
        scr_bosscontroller_draw_health(player_hpsprite, player_rowmax, player_columnmax, player_hp, player_maxhp, player_hp_x, player_hp_y, player_xpad, player_ypad, player_index, image_alpha, 707, obj_player1.paletteselect, global.palettetexture)
        var bpal = boss_palette
        var bpalsel = -4
        var btex = -4
        if (boss_hpsprite == spr_bossfight_fakepephp)
        {
            bpal = 707
            bpalsel = obj_player1.paletteselect
            btex = global.palettetexture
        }
        if (boss_hpsprite == spr_bossfight_noiseHP)
        {
            if (obj_player1.character == "N" || (obj_player1.character == "P" && (!obj_player1.ispeppino)))
            {
                bpal = 1425
                bpalsel = 5
                btex = global.palettetexture
            }
        }
        scr_bosscontroller_draw_health(boss_hpsprite, boss_rowmax, boss_columnmax, boss_prevhp, boss_maxhp, boss_hp_x, boss_hp_y, boss_xpad, boss_ypad, boss_index, image_alpha, bpal, bpalsel, btex)
        for (var i = 0; i < ds_list_size(particlelist); i++)
        {
            var b = ds_list_find_value(particlelist, i)
            with (b)
            {
                if (type == 0)
                {
                    x += hsp
                    y += vsp
                    if (vsp < 20)
                        vsp += 0.5
                    if (y > (obj_screensizer.actual_height + sprite_get_height(sprite_index)))
                        ds_list_delete(other.particlelist, i--)
                    else
                    {
                        if (palettetexture != -4)
                            pattern_set(global.Base_Pattern_Color, sprite_index, image_index, 1, 1, palettetexture)
                        pal_swap_set(spr_palette, paletteselect, 0)
                        draw_sprite(sprite_index, image_index, x, y)
                    }
                }
                else if (type == 1)
                {
                    if (image_index > (sprite_get_number(sprite_index) - 1))
                        ds_list_delete(other.particlelist, i--)
                    else
                    {
                        image_index += image_speed
                        pal_swap_set(spr_palette, paletteselect, 0)
                        draw_sprite(sprite_index, image_index, x, y)
                    }
                }
            }
        }
        pattern_reset()
        reset_shader_fix()
        break
}

