function scr_get_tutorial_key(argument0) //scr_get_tutorial_key
{
    var spr = -4
    var ix = 0
    var txt = -4
    switch argument0
    {
        case 37:
            spr = spr_tutorialgamepad
            ix = 16
            break
        case 39:
            spr = spr_tutorialgamepad
            ix = 17
            break
        case 38:
            spr = spr_tutorialgamepad
            ix = 4
            break
        case 40:
            spr = spr_tutorialgamepad
            ix = 5
            break
        case 16:
        case 160:
            spr = spr_tutorialkeyspecial
            ix = 0
            break
        case 17:
        case 162:
            spr = spr_tutorialkeyspecial
            ix = 1
            break
        case 32:
            spr = spr_tutorialkeyspecial
            ix = 2
            break
        default:
            spr = spr_tutorialkey
            ix = 0
            txt = chr(argument0)
            break
    }

    return [spr, ix, txt];
}

function scr_string_width(argument0) //scr_string_width
{
    var pos = 0
    var w = 0
    var originalstr = argument0
    var str_arr = array_create(0)
    while (pos < string_length(originalstr))
    {
        if (string_copy(originalstr, pos, 2) == "\n")
        {
            array_push(str_arr, string_copy(originalstr, 1, pos))
            string_delete(originalstr, 1, pos)
            pos = 0
            if (originalstr == "")
                break
            else
                continue
        }
        else
        {
            pos++
            continue
        }
    }
    if (array_length(str_arr) == 0)
        w = string_width(argument0)
    for (var i = 0; i < array_length(str_arr); i++)
    {
        var b = str_arr[i]
        if (string_width(b) > w)
            w = string_width(b)
    }
    return w;
}

function scr_separate_text(argument0, argument1, argument2) //scr_separate_text
{
    draw_set_font(argument1)
    while (scr_string_width(argument0) > (argument2 - string_width("a")))
    {
        var _pos = string_length(argument0)
        var _oldpos = _pos
        while (string_char_at(argument0, _pos) != " ")
        {
            _pos--
            if (_pos < 0)
                _pos = _oldpos
        }
        if (string_char_at(argument0, _pos) == " ")
            argument0 = string_delete(argument0, _pos, 1)
        argument0 = string_insert("\n", argument0, _pos)
    }
    return argument0;
}

function scr_calculate_text(argument0) //scr_calculate_text
{
    draw_set_font(font2)
    pos = 0
    var str2 = ""
    while (pos <= string_length(argument0))
    {
        pos++
        str2 = string_insert(string_char_at(argument0, pos), str2, (string_length(str2) + 1))
        str2 = scr_separate_text(str2)
    }
    return str2;
}

function scr_calculate_height(argument0) //scr_calculate_height
{
    str2 = scr_calculate_text(argument0)
    return string_height(str2);
}

