function create_transformation_tip(argument0, argument1) //create_transformation_tip
{
    if (argument1 == undefined)
        argument1 = -4
    ini_open_from_string(obj_savesystem.ini_str)
    if (argument1 != -4 && ini_read_real("Tip", argument1, 0))
    {
        ini_close()
        return;
    }
    instance_destroy(obj_transfotip)
    var b = -4
    with (instance_create(0, 0, obj_transfotip))
    {
        text = argument0
        b = id
    }
    if (argument1 != -4)
        ini_write_real("Tip", argument1, 1)
    obj_savesystem.ini_str = ini_close()
    return b;
}

function scr_compile_icon_text(argument0, argument1, argument2) //scr_compile_icon_text
{
    if (argument1 == undefined)
        argument1 = 1
    if (argument2 == undefined)
        argument2 = 0
    var arr = []
    var len = string_length(argument0)
    var newline = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    var char_x = 0
    var char_y = 0
    var saved_pos = 1
    while (argument1 <= len)
    {
        var start = argument1
        var char = string_ord_at(argument0, argument1)
        switch char
        {
            case 10:
                char_y += newline
                char_x = 0
                break
            case 123:
                var effect = string_copy(argument0, argument1, 3)
                var te = (1 << 0)
                argument1 += 3
                var n = scr_compile_icon_text(argument0, argument1, 1)
                switch effect
                {
                    case "{s}":
                        te = (1 << 0)
                        break
                    case "{u}":
                        te = (2 << 0)
                        break
                }

                array_push(arr, [char_x, char_y, (2 << 0), te, n[0]])
                argument1 = n[1]
                char_x = n[2]
                char_y = n[3]
                break
            case 91:
                var button = string_copy(argument0, argument1, 3)
                var t = (1 << 0)
                b = (0 << 0)
                switch button
                {
                    case "[D]":
                        b = (3 << 0)
                        break
                    case "[U]":
                        b = (0 << 0)
                        break
                    case "[M]":
                        b = (7 << 0)
                        break
                    case "[J]":
                        b = (8 << 0)
                        break
                    case "[G]":
                        b = (6 << 0)
                        break
                    case "[F]":
                        b = (4 << 0)
                        break
                    case "[B]":
                        b = (5 << 0)
                        break
                    case "[L]":
                        b = (1 << 0)
                        break
                    case "[R]":
                        b = (2 << 0)
                        break
                    case "[S]":
                        b = (9 << 0)
                        break
                    case "[T]":
                        b = (10 << 0)
                        break
                    case "[g]":
                        b = (11 << 0)
                        break
                    case "[s]":
                        b = (12 << 0)
                        break
                }

                array_push(arr, [char_x, char_y, t, b])
                char_x += 32
                argument1 += 2
                break
            case 47:
                if argument2
                {
                    saved_pos = argument1
                    argument1 = (len + 1)
                }
                break
            default:
                while ((argument1 + 1) <= len)
                {
                    char = string_ord_at(argument0, (argument1 + 1))
                    if (char != 91 && char != 10 && char != 123 && char != 47)
                    {
                        argument1 += 1
                        continue
                    }
                    else
                        break
                }
                n = string_copy(argument0, start, ((argument1 - start) + 1))
                array_push(arr, [char_x, char_y, (0 << 0), n])
                char_x += string_width(n)
                break
        }

        argument1 += 1
    }
    if argument2
        return [arr, saved_pos, char_x, char_y];
    return arr;
}

function scr_text_arr_size(argument0) //scr_text_arr_size
{
    var w = 0
    newline = string_height("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    var h = newline
    for (var i = 0; i < array_length(argument0); i++)
    {
        b = argument0[i]
        var cx = b[0]
        var cy = b[1]
        t = b[2]
        var val = b[3]
        switch t
        {
            case (1 << 0):
                if ((cx + 32) > w)
                    w += 32
                break
            case (2 << 0):
                var val2 = b[4]
                var q = scr_text_arr_size(val2)
                if ((cy + q[1]) > h)
                    h += (q[1] - newline)
                else if ((cx + q[0]) > w)
                    w += q[0]
                break
            case (0 << 0):
                if (cy > h)
                    h += newline
                else
                {
                    var sw = string_width(val)
                    if ((cx + sw) > w)
                        w += string_width(val)
                }
                break
        }

    }
    return [w, h];
}

function scr_draw_granny_texture(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) //scr_draw_granny_texture
{
    if (argument6 == undefined)
        argument6 = 2617
    if (argument7 == undefined)
        argument7 = spr_tutorialbubble
    w = (sprite_get_width(argument7) * argument2)
    h = (sprite_get_height(argument7) * argument3)
    if (!surface_exists(surfclip))
        surfclip = surface_create(w, h)
    if (!surface_exists(surffinal))
        surffinal = surface_create(w, h)
    surface_set_target(surfclip)
    draw_clear_alpha(c_black, 0)
    draw_rectangle_color(0, 0, w, h, c_white, c_white, c_white, c_white, 0)
    gpu_set_blendmode(bm_subtract)
    draw_sprite_ext(argument7, 0, 0, 0, argument2, argument3, 0, c_white, 1)
    reset_blendmode()
    surface_reset_target()
    surface_set_target(surffinal)
    draw_sprite_tiled(argument6, 0, argument4, argument5)
    gpu_set_blendmode(bm_subtract)
    draw_surface(surfclip, 0, 0)
    reset_blendmode()
    surface_reset_target()
    draw_surface(surffinal, argument0, argument1)
}

function scr_draw_text_arr(argument0, argument1, argument2, argument3, argument4, argument5, argument6) //scr_draw_text_arr
{
    if (argument3 == undefined)
        argument3 = c_white
    if (argument4 == undefined)
        argument4 = 1
    if (argument5 == undefined)
        argument5 = (0 << 0)
    if (argument6 == undefined)
        argument6 = noone
    if (argument2 == -4)
        return;
    for (i = 0; i < array_length(argument2); i++)
    {
        b = argument2[i]
        cx = (argument0 + b[0])
        cy = (argument1 + b[1])
        t = b[2]
        val = b[3]
        switch t
        {
            case (1 << 0):
                var spr = -4
                var ix = 0
                var txt = -4
                if (obj_inputAssigner.player_input_device[0] >= 0)
                {
                    spr = spr_tutorialgamepad
                    switch val
                    {
                        case (3 << 0):
                            ix = scr_get_gamepadicon(global.key_downC)
                            break
                        case (0 << 0):
                            ix = scr_get_gamepadicon(global.key_upC)
                            break
                        case (7 << 0):
                            ix = scr_get_gamepadicon(global.key_attackC)
                            break
                        case (8 << 0):
                            ix = scr_get_gamepadicon(global.key_jumpC)
                            break
                        case (6 << 0):
                            ix = scr_get_gamepadicon(global.key_slapC)
                            break
                        case (4 << 0):
                            if (instance_exists(obj_player1) && obj_player1.xscale > 0)
                                ix = scr_get_gamepadicon(global.key_rightC)
                            else
                                ix = scr_get_gamepadicon(global.key_leftC)
                            break
                        case (5 << 0):
                            if (instance_exists(obj_player1) && obj_player1.xscale > 0)
                                ix = scr_get_gamepadicon(global.key_leftC)
                            else
                                ix = scr_get_gamepadicon(global.key_rightC)
                            break
                        case (1 << 0):
                            ix = scr_get_gamepadicon(global.key_leftC)
                            break
                        case (2 << 0):
                            ix = scr_get_gamepadicon(global.key_rightC)
                            break
                        case (9 << 0):
                            ix = scr_get_gamepadicon(global.key_shootC)
                            break
                        case (10 << 0):
                            ix = scr_get_gamepadicon(global.key_tauntC)
                            break
                        case (11 << 0):
                            if global.gamepad_groundpound
                                ix = scr_get_gamepadicon(global.key_downC)
                            else
                                ix = scr_get_gamepadicon(global.key_groundpoundC)
                            break
                        case (12 << 0):
                            if global.gamepad_superjump
                                ix = scr_get_gamepadicon(global.key_upC)
                            else
                                ix = scr_get_gamepadicon(global.key_superjumpC)
                            break
                    }

                }
                else
                {
                    spr = spr_tutorialkey
                    ix = 0
                    arr = -4
                    switch val
                    {
                        case (3 << 0):
                            arr = scr_get_tutorial_key(global.key_down)
                            break
                        case (0 << 0):
                            arr = scr_get_tutorial_key(global.key_up)
                            break
                        case (7 << 0):
                            arr = scr_get_tutorial_key(global.key_attack)
                            break
                        case (8 << 0):
                            arr = scr_get_tutorial_key(global.key_jump)
                            break
                        case (6 << 0):
                            arr = scr_get_tutorial_key(global.key_slap)
                            break
                        case (4 << 0):
                            if (instance_exists(obj_player1) && obj_player1.xscale > 0)
                                arr = scr_get_tutorial_key(global.key_right)
                            else
                                arr = scr_get_tutorial_key(global.key_left)
                            break
                        case (5 << 0):
                            if (instance_exists(obj_player1) && obj_player1.xscale > 0)
                                arr = scr_get_tutorial_key(global.key_left)
                            else
                                arr = scr_get_tutorial_key(global.key_right)
                            break
                        case (1 << 0):
                            arr = scr_get_tutorial_key(global.key_left)
                            break
                        case (2 << 0):
                            arr = scr_get_tutorial_key(global.key_right)
                            break
                        case (9 << 0):
                            arr = scr_get_tutorial_key(global.key_shoot)
                            break
                        case (10 << 0):
                            arr = scr_get_tutorial_key(global.key_taunt)
                            break
                        case (11 << 0):
                            arr = scr_get_tutorial_key(global.key_down)
                            break
                        case (12 << 0):
                            arr = scr_get_tutorial_key(global.key_up)
                            break
                    }

                    if (arr != -4)
                    {
                        spr = arr[0]
                        ix = arr[1]
                        txt = arr[2]
                    }
                }
                if (argument5 != (0 << 0))
                {
                    switch argument5
                    {
                        case (1 << 0):
                            cx += irandom_range(-2, 2)
                            cy += irandom_range(-2, 2)
                            break
                        case (2 << 0):
                            var o = 1
                            if (argument6 != noone)
                                o = argument6.offset
                            var d = ((i % 2) == 0 ? -1 : 1)
                            var _dir = floor(Wave(-1, 1, 0.1, 0))
                            cy += ((_dir * d) * o)
                            break
                    }

                }
                if (spr != -4)
                {
                    if (ix != -4)
                        draw_sprite(spr, ix, cx, cy)
                    if (txt != -4)
                    {
                        var f = draw_get_font()
                        draw_set_halign(fa_center)
                        draw_set_valign(fa_middle)
                        draw_set_font(global.tutorialfont)
                        draw_text_color((cx + 16), (cy + 14), txt, c_black, c_black, c_black, c_black, argument4)
                        draw_set_font(f)
                        draw_set_halign(fa_left)
                        draw_set_valign(fa_top)
                    }
                }
                break
            case (2 << 0):
                val2 = b[4]
                scr_draw_text_arr(cx, cy, val2, argument3, argument4, val)
                break
            case (0 << 0):
                if (argument5 == (0 << 0))
                    draw_text_color(cx, cy, val, argument3, argument3, argument3, argument3, argument4)
                else
                {
                    var x2 = 0
                    switch argument5
                    {
                        case (1 << 0):
                            for (var j = 1; j <= string_length(val); j++)
                            {
                                q = string_char_at(val, j)
                                var s1 = irandom_range(-1, 1)
                                var s2 = irandom_range(-1, 1)
                                draw_text_color(((cx + x2) + s1), (cy + s2), q, argument3, argument3, argument3, argument3, argument4)
                                x2 += string_width(q)
                            }
                            break
                        case (2 << 0):
                            for (j = 1; j <= string_length(val); j++)
                            {
                                q = string_char_at(val, j)
                                var s = 0
                                o = 1
                                if (argument6 != noone)
                                    o = argument6.offset
                                d = ((j % 2) == 0 ? -1 : 1)
                                _dir = floor(Wave(-1, 1, 0.1, 0))
                                s += ((_dir * d) * o)
                                draw_text_color((cx + x2), (cy + s), q, argument3, argument3, argument3, argument3, argument4)
                                x2 += string_width(q)
                            }
                            break
                    }

                }
                break
        }

    }
}

