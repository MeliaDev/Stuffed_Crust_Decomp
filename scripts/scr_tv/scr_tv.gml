function tv_set_idle() //tv_set_idle
{
    with (obj_tv)
    {
        state = (0 << 0)
        sprite_index = spr_tv_idle
    }
}

function tv_reset() //tv_reset
{
    with (obj_tv)
    {
        state = (0 << 0)
        sprite_index = spr_tv_idle
        ds_list_clear(tvprompts_list)
    }
}

function tv_create_prompt(argument0, argument1, argument2, argument3) //tv_create_prompt
{
    return [argument0, argument1, argument2, argument3];
}

function tv_push_prompt(argument0, argument1, argument2, argument3) //tv_push_prompt
{
    with (obj_tv)
    {
        var b = [argument0, argument1, argument2, argument3]
        var play = 0
        switch argument1
        {
            case (0 << 0):
                play = 1
                ds_list_insert(tvprompts_list, 0, b)
                break
            case (1 << 0):
                var placed = 0
                var i = 0
                while 1
                {
                    if (i < ds_list_size(tvprompts_list))
                    {
                        var b2 = ds_list_find_value(tvprompts_list, i)
                        if (b2[1] == (2 << 0))
                        {
                        }
                        else
                            i++
                        if (i == 0)
                            play = 1
                        ds_list_insert(tvprompts_list, i, b)
                        placed = 1
                    }
                    else if (!placed)
                        ds_list_add(tvprompts_list, b)
                }
                ds_list_add(tvprompts_list, b)
                break
            case (2 << 0):
                ds_list_add(tvprompts_list, b)
                break
        }

        if play
            state = (0 << 0)
    }
}

function tv_push_prompt_array(argument0) //tv_push_prompt_array
{
    for (i = 0; i < array_length(argument0); i++)
    {
        with (obj_tv)
        {
            b = argument0[i]
            tv_push_prompt(b[0], b[1], b[2], b[3])
        }
    }
}

function tv_push_prompt_once(argument0, argument1) //tv_push_prompt_once
{
    with (obj_tv)
    {
        if (special_prompts == -4)
            return 0;
        b = ds_map_find_value(special_prompts, argument1)
        if is_undefined(b)
            return 0;
        if (b != 1)
        {
            tv_push_prompt(argument0[0], argument0[1], argument0[2], argument0[3])
            ds_map_set(special_prompts, argument1, 1)
            ini_open_from_string(obj_savesystem.ini_str)
            ini_write_real("Prompts", argument1, 1)
            obj_savesystem.ini_str = ini_close()
            return 1;
        }
        return 0;
    }
}

function tv_default_condition() //tv_default_condition
{
    return place_meeting(x, y, obj_player);
}

function tv_do_expression(argument0) //tv_do_expression
{
    with (obj_tv)
    {
        if (expressionsprite != argument0 && bubblespr == -4)
        {
            state = (250 << 0)
            expressionsprite = argument0
            switch expressionsprite
            {
                case 3260:
                case 4211:
                case 4251:
                case 409:
                case 4266:
                case 4083:
                case 4267:
                case 3188:
                case 3195:
                    expressionbuffer = -1
                    break
                case 1768:
                case 4252:
                case 2006:
                case 3192:
                    expressionbuffer = 60
                    break
                case 2061:
                case 450:
                case 2917:
                case 258:
                case 68:
                case 567:
                case 1634:
                case 1368:
                case 3631:
                case 689:
                    if (expressionbuffer < 100)
                        expressionbuffer = 100
                    break
                case 4250:
                case 971:
                case 3189:
                    expressionbuffer = 150
                    if obj_player.isgustavo
                    {
                        expressionsprite = spr_tv_happyG
                        if (irandom(100) <= 50)
                            fmod_event_one_shot_3d("event:/sfx/voice/brickok", obj_player1.x, obj_player1.y)
                    }
                    if (irandom(100) <= 50)
                    {
                        if (character != "S")
                            scr_fmod_soundeffect(obj_player1.snd_voiceok, obj_player1.x, obj_player1.y)
                    }
                    break
            }

        }
    }
}

function scr_tv_get_transfo_sprite() //scr_tv_get_transfo_sprite
{
    var _state = obj_player1.state
    if (_state == (84 << 0) || _state == (61 << 0))
        _state = obj_player1.tauntstoredstate
    var _spr = -4
    switch _state
    {
        case (47 << 0):
        case (48 << 0):
        case (49 << 0):
        case (38 << 0):
            _spr = spr_tv_knight
            break
        case (51 << 0):
        case (52 << 0):
            _spr = spr_tv_bombpep
            break
        case (9 << 0):
            _spr = spr_tv_fireass
            if (obj_player1.sprite_index == obj_player1.spr_scaredjump1 || obj_player1.sprite_index == obj_player1.spr_scaredjump2 || obj_player1.sprite_index == obj_player1.spr_scaredjump3)
                _spr = spr_tv_scaredjump
            break
        case (5 << 0):
            if (obj_player1.sprite_index == obj_player1.spr_tumble || obj_player1.sprite_index == obj_player1.spr_tumblestart || obj_player1.sprite_index == obj_player1.spr_tumbleend)
                _spr = spr_tv_tumble
            else if obj_player1.shotgunAnim
                _spr = spr_tv_shotgun
            break
        case (10 << 0):
            _spr = spr_tv_firemouth
            break
        case (16 << 0):
        case (17 << 0):
            _spr = spr_tv_ghost
            break
        case (59 << 0):
            if (obj_player1.sprite_index == obj_player1.spr_squished)
                _spr = spr_tv_squished
            break
        case (0 << 0):
        case (92 << 0):
        case (42 << 0):
        case (100 << 0):
        case (93 << 0):
        case (121 << 0):
        case (105 << 0):
        case (106 << 0):
            with (obj_player1)
            {
                if shotgunAnim
                    _spr = spr_tv_shotgun
                else if global.mort
                    _spr = spr_tv_mort
            }
            break
        case (122 << 0):
        case (108 << 0):
        case (111 << 0):
            if obj_player1.shotgunAnim
                _spr = spr_tv_shotgun
            break
        case (72 << 0):
            if global.mort
                _spr = spr_tv_mort
            break
        case (66 << 0):
        case (69 << 0):
        case (71 << 0):
        case (57 << 0):
        case (70 << 0):
        case (67 << 0):
        case (68 << 0):
            _spr = spr_tv_shotgun
            break
        case (113 << 0):
        case (114 << 0):
        case (116 << 0):
        case (115 << 0):
            _spr = spr_tv_barrel
            break
        case (148 << 0):
            _spr = spr_tv_golf
            break
        case (184 << 0):
        case (185 << 0):
            _spr = spr_tv_rocket
            break
        case (21 << 0):
            _spr = spr_tv_cheeseball
            break
        case (24 << 0):
        case (26 << 0):
        case (25 << 0):
        case (29 << 0):
        case (30 << 0):
            _spr = spr_tv_cheesepep
            break
        case (33 << 0):
        case (35 << 0):
        case (34 << 0):
            _spr = spr_tv_boxxedpep
            break
        case (31 << 0):
            _spr = spr_tv_weenie
            break
        case (11 << 0):
        case (13 << 0):
        case (14 << 0):
        case (12 << 0):
            _spr = spr_tv_mort
            break
        case (104 << 0):
        case (37 << 0):
        case (65 << 0):
        case (78 << 0):
            if obj_player1.skateboarding
                _spr = spr_tv_clown
            else if obj_player1.shotgunAnim
                _spr = spr_tv_shotgun
            break
    }

    with (obj_player1)
    {
        if (state == (146 << 0) && sprite_index == spr_tumble)
            _spr = spr_tv_tumble
        if skateboarding
            _spr = spr_tv_clown
    }
    return _spr;
}

