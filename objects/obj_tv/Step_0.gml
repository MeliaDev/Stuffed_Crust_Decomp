/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for Wave

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
var theroomname = room_get_name(room)
tv_x = (obj_screensizer.actual_width - 115)
tv_y = 80
timer_xstart = ((obj_screensizer.actual_width / 2) + timer_xplus)
timer_x = timer_xstart
timer_ystart = (obj_screensizer.actual_height + timer_yplus)
if (global.combotime > 0 && global.combo > 0)
    visualcombo = global.combo
if (room == Realtitlescreen || room == tower_options || room == tower_noisemech || room == Longintro || room == Mainmenu || room == rank_room || room == rm_levelselect || room == timesuproom || room == boss_room1 || room == characterselect || room == hub_loadingscreen || (string_copy(room_get_name(room), 1, 5) == "tower" && (!global.panic)))
{
    visible = false
    sprite_index = spr_tv_off
}
else
    visible = true
if ((instance_exists(obj_debugcontroller) && (!obj_debugcontroller.showhud)) || (!global.option_hud) || is_bossroom())
    visible = false
if (targetgolf != noone && (!instance_exists(targetgolf)))
    targetgolf = -4
if (targetgolf != -4 && (!view_visible[1]))
{
    view_visible[1] = true
    view_enabled = true
}
if (obj_player1.character == "V")
{
    vigimode = 1
    tvxscale = -1
}
else
{
    vigimode = 0
    tvxscale = 1
}
if (!global.panic)
{
    alarm[2] = -4
    panicmode = 0
}
if (bubblespr != -4 && bubblespr != spr_tv_bubbleclosed)
{
    if (prompt != -4)
        prompt_buffer = 2
    bubbleindex += image_speed
    if (floor(bubbleindex) == sprite_get_number(bubblespr))
    {
        bubbleindex = 0
        switch bubblespr
        {
            case 608:
                bubblespr = spr_tv_bubble
                break
            case 579:
                bubblespr = spr_tv_bubbleclosed
                if (prompt == -4 || prompt == "")
                    bubblespr = -4
                break
        }

    }
}
switch state
{
    case (0 << 0):
        idlespr = spr_tv_idle
        if (!obj_player.ispeppino)
            idlespr = spr_tv_idleN
        if vigimode
            idlespr = spr_playerV_normalHUD
        if (!isgustavo)
            spr_palette = obj_player.spr_palette
        if (string_pos("secret", theroomname) != 0)
            idlespr = spr_tv_secretfound
        else if isgustavo
        {
            spr_palette = spr_ratmountpalette
            idlespr = spr_tv_idleG
            if global.panic
                idlespr = spr_tv_escapeG
        }
        else if global.panic
        {
            if (global.fill < 1 && (!vigimode))
            {
                idlespr = spr_tv_exprheat
                if (panicmode == 0)
                {
                    alarm[2] = irandom_range(20, 200)
                    panicmode = 1
                }
            }
            else if (global.lap != 0 && (!isgustavo))
            {
                idlespr = spr_tv_exprheat
                if vigimode
                    idlespr = spr_playerV_angryHUD
            }
            else
            {
                idlespr = spr_tv_exprpanic
                if vigimode
                    idlespr = spr_playerV_panicHUD
            }
        }
        else if (global.combo >= 3 && (!isgustavo))
        {
            if (global.combo >= 75 || global.stylethreshold > 3)
                idlespr = spr_tv_exprheat
            else if (global.combo >= 25 && (!isgustavo))
            {
                if obj_player.ispeppino
                    idlespr = spr_tv_exprcombo
                else
                    idlespr = spr_tv_exprcomboN2
            }
            else
                idlespr = spr_tv_exprcombo
            if vigimode
                idlespr = spr_playerV_angryHUD
        }
        var _state = obj_player1.state
        if (_state == (84 << 0) || _state == (61 << 0))
            _state = obj_player1.tauntstoredstate
        var _transfo = 1
        var _transfospr = scr_tv_get_transfo_sprite()
        if (_transfospr == -4)
            _transfo = 0
        else
            idlespr = _transfospr
        if ((!_transfo) && (!panicmode))
        {
            with (obj_player1)
            {
                if (character == "V")
                {
                    if (mach4mode == 1 || (state == (78 << 0) && key_attack) || state == (121 << 0) || sprite_index == spr_mach3boost)
                        tv_do_expression(3190)
                }
                else if ispeppino
                {
                    if (mach4mode == 1)
                        tv_do_expression(4156)
                    else if (state == (121 << 0) || (state == (78 << 0) && key_attack) || sprite_index == spr_mach3boost)
                        tv_do_expression(1137)
                }
                else if ((!ispeppino) || character == "N")
                {
                    if (mach4mode == 1)
                        tv_do_expression(4253)
                    else if (state == (121 << 0) || (state == (78 << 0) && key_attack) || sprite_index == spr_mach3boost)
                        tv_do_expression(4254)
                }
            }
        }
        if (!obj_player1.ispeppino)
        {
            var spr = sprite_get_name(idlespr)
            spr = asset_get_index(concat(spr, "N"))
            if (spr > -1)
                idlespr = spr
        }
        switch sprite_index
        {
            case spr_tv_off:
                if visible
                {
                    if vigimode
                        sprite_index = spr_playerV_normalHUD
                    else
                        sprite_index = spr_tv_open
                    image_index = 0
                }
                break
            case 3443:
                if (floor(image_index) == (image_number - 1))
                    sprite_index = idlespr
                break
            case 3183:
                if (idleanim > 0)
                    idleanim--
                if (sprite_index != idlespr)
                    sprite_index = idlespr
                break
            case 3832:
            case 1064:
                if (idleanim > 0)
                    idleanim--
                if (sprite_index != idlespr)
                    sprite_index = idlespr
                if (idleanim <= 0 && floor(image_index) == (image_number - 1))
                {
                    sprite_index = choose(spr_tv_idleanim1, spr_tv_idleanim2)
                    if (!obj_player1.ispeppino)
                    {
                        if (sprite_index == spr_tv_idleanim1)
                            sprite_index = spr_tv_idleanim1N
                        if (sprite_index == spr_tv_idleanim2)
                            sprite_index = spr_tv_idleanim2N
                    }
                    image_index = 0
                }
                break
            case 1496:
            case 656:
            case 3501:
            case 3952:
                if (floor(image_index) == (image_number - 1))
                {
                    sprite_index = idlespr
                    idleanim = (240 + (60 * irandom_range(-1, 2)))
                }
                if (idlespr != spr_tv_idle && idlespr != spr_tv_idleN)
                    sprite_index = idlespr
                break
            default:
                sprite_index = idlespr
        }

        if (sprite_index != spr_tv_open)
        {
            if (!ds_list_empty(tvprompts_list))
            {
                var b = ds_list_find_value(tvprompts_list, 0)
                prompt_buffer = prompt_max
                if (b[0] != "" && b[0] != -4)
                {
                    bubblespr = spr_tv_bubbleopen
                    bubbleindex = 0
                    prompt = b[0]
                    promptspd = b[3]
                    promptx = promptxstart
                }
                else
                {
                    if (bubblespr != -4 && bubblespr != 1773)
                        bubblespr = spr_tv_bubbleclose
                    if (bubblespr == spr_tv_bubbleclosed)
                        bubblespr = -4
                    bubbleindex = 0
                    promptx = promptxstart
                    prompt = -4
                }
                if (b[1] == (0 << 0))
                {
                    sprite_index = spr_tv_open
                    image_index = 0
                    tvsprite = b[2]
                    if (!obj_player1.ispeppino)
                    {
                        spr = sprite_get_name(tvsprite)
                        spr = asset_get_index(concat(spr, "N"))
                        if (spr > -1)
                            tvsprite = spr
                    }
                }
                else
                {
                    tvsprite = b[2]
                    if (!obj_player1.ispeppino)
                    {
                        spr = sprite_get_name(tvsprite)
                        spr = asset_get_index(concat(spr, "N"))
                        if (spr > -1)
                            tvsprite = spr
                    }
                    sprite_index = tvsprite
                    image_index = 0
                }
                state = (8 << 0)
            }
            else
                bubblespr = -4
        }
        break
    case (8 << 0):
        if (sprite_index == spr_tv_open && floor(image_index) == (image_number - 1))
            sprite_index = tvsprite
        if (sprite_index == tvsprite)
        {
            if (prompt_buffer > 0)
                prompt_buffer--
            else
            {
                promptx = promptxstart
                ds_list_delete(tvprompts_list, 0)
                state = (0 << 0)
            }
        }
        break
    case (250 << 0):
        if (tv_trans >= sprite_get_number(spr_tv_whitenoise))
        {
            if dotransition
                resetbg = 1
            if (expressionsprite != -4)
            {
                state = (251 << 0)
                sprite_index = expressionsprite
            }
            else
                state = (0 << 0)
            image_index = 0
        }
        break
    case (251 << 0):
        var s = state
        var es = expressionsprite
        _transfospr = scr_tv_get_transfo_sprite()
        switch expressionsprite
        {
            case spr_tv_exprhurt:
            case 2061:
            case 450:
            case 2917:
            case 258:
            case 68:
            case 567:
            case 1634:
            case 1368:
            case 3631:
            case 4252:
            case 689:
            case 3192:
                if (obj_player1.state != (107 << 0))
                {
                    if (expressionbuffer > 0)
                        expressionbuffer--
                    else
                    {
                        if panicmode
                            alarm[2] = irandom_range(20, 200)
                        state = (250 << 0)
                        expressionsprite = -4
                    }
                }
                break
            case 2006:
                if (obj_player1.state != (196 << 0))
                {
                    if (expressionbuffer > 0)
                        expressionbuffer--
                    else
                    {
                        if panicmode
                            alarm[2] = irandom_range(20, 200)
                        state = (250 << 0)
                        expressionsprite = -4
                    }
                }
                break
            case 4211:
            case 3260:
            case 3188:
                if (global.combo < 3 || _transfospr != -4 || isgustavo || obj_player1.mach4mode || obj_player1.state == (107 << 0) || obj_player1.state == (121 << 0) || obj_player1.sprite_index == obj_player1.spr_mach3boost || global.stylethreshold >= 3)
                {
                    state = (250 << 0)
                    expressionsprite = -4
                    if (obj_player1.state == (107 << 0))
                    {
                        if ((!ispeppino) || character == "N")
                            tv_do_expression(4252)
                        else
                            tv_do_expression(1768)
                    }
                }
                break
            case 971:
            case 4250:
            case 347:
            case 3189:
                if (expressionbuffer > 0)
                    expressionbuffer--
                else
                {
                    state = (250 << 0)
                    expressionsprite = -4
                }
                break
            case 3190:
            case 4254:
            case 1137:
                with (obj_player1)
                {
                    if (state != (121 << 0) && state != (37 << 0) && (state != (61 << 0) || (tauntstoredstate != (121 << 0) && tauntstoredstate != (37 << 0))) && sprite_index != spr_mach3boost && mach4mode == 0)
                    {
                        other.state = (250 << 0)
                        other.expressionsprite = -4
                    }
                    if (mach4mode && character != "V")
                    {
                        if ((!ispeppino) || character == "N")
                            tv_do_expression(4253)
                        else
                            tv_do_expression(4156)
                    }
                }
                break
            case 4253:
            case 4156:
                with (obj_player1)
                {
                    if (mach4mode == 0 && (state != (61 << 0) || (tauntstoredstate != (121 << 0) && tauntstoredstate != (37 << 0))))
                    {
                        other.state = (250 << 0)
                        other.expressionsprite = -4
                    }
                }
                break
            case 4266:
            case 409:
                _transfo = 0
                with (obj_player1)
                {
                    if (_transfospr != -4)
                        _transfo = 1
                    if other.isgustavo
                        _transfo = 1
                }
                if (global.stylethreshold < 3 || _transfo || obj_player1.mach4mode || obj_player1.state == (107 << 0) || obj_player1.state == (121 << 0) || obj_player1.sprite_index == obj_player1.spr_mach3boost)
                {
                    state = (250 << 0)
                    expressionsprite = -4
                }
                break
            case 4267:
            case 4083:
            case 3195:
                _transfo = 0
                with (obj_player1)
                {
                    if _transfospr
                        _transfo = 1
                    if other.isgustavo
                        _transfo = 1
                }
                if ((!global.panic) || _transfo || obj_player1.mach4mode || obj_player1.state == (107 << 0) || obj_player1.state == (121 << 0) || obj_player1.sprite_index == obj_player1.spr_mach3boost)
                {
                    state = (250 << 0)
                    expressionsprite = -4
                }
                break
            case 4328:
                _transfo = 0
                if (string_pos("secret", theroomname) == 0)
                {
                    state = (250 << 0)
                    expressionsprite = -4
                }
                break
        }

        if (!ds_list_empty(tvprompts_list))
        {
            state = (250 << 0)
            tv_trans = 0
            expressionsprite = -4
        }
        break
}

if (state != (250 << 0))
    tv_trans = 0
else
    tv_trans += 0.35
var change_pos = 0
if (obj_player.x > (room_width - 224) && obj_player.y < 187)
    change_pos = 1
if (bubblespr != -4 && obj_player.x > 316 && obj_player.y < 101)
    change_pos = 1
var spd = 15
if change_pos
    hud_posY = Approach(hud_posY, -300, spd)
else
    hud_posY = Approach(hud_posY, 0, spd)
pizzaface_index += indexinc
hand_index += indexinc
johnface_index += indexinc
if (global.panic && global.fill > 0)
{
    if (watcher_sprite == spr_pizzawatcher_idle)
        watcher_index += indexinc
    showtime_buffer = 100
    if ((global.wave / global.maxwave) >= 0.5)
        indexinc = 0.42
    if (!instance_exists(obj_ghostcollectibles))
        timer_y = Approach(timer_y, timer_ystart, 1)
    else
        timer_y = Approach(timer_y, (timer_ystart + 212), 4)
}
else if global.panic
{
    indexinc = 0.5
    if (pizzaface_sprite == spr_timer_pizzaface1)
    {
        pizzaface_sprite = spr_timer_pizzaface2
        pizzaface_index = 0
    }
    else if (pizzaface_sprite == spr_timer_pizzaface2)
    {
        if (floor(pizzaface_index) == (sprite_get_number(pizzaface_sprite) - 1))
        {
            pizzaface_sprite = spr_timer_pizzaface3
            pizzaface_index = 0
        }
    }
    else if (showtime_buffer > 0)
        showtime_buffer--
    else
        timer_y = Approach(timer_y, (timer_ystart + 212), 1)
    if (watcher_sprite == spr_pizzawatcher_idle)
    {
        watcher_index = 0
        watcher_sprite = spr_pizzawatcher_goaway
    }
    if (watcher_sprite == spr_pizzawatcher_goaway)
    {
        if (watcher_index >= 6)
            watcher_index = 7
        else if (watcher_index < 7)
            watcher_index += 0.25
    }
}
else
{
    watcher_sprite = spr_pizzawatcher_idle
    pizzaface_sprite = spr_timer_pizzaface1
    hand_sprite = spr_timer_hand1
    timer_y = (timer_ystart + 212)
}
if (global.panic && global.fill < (chunkmax / 5))
    hand_sprite = spr_timer_hand2
barfill_x -= 0.2
if (barfill_x < -173)
    barfill_x = 0
if (pizzaface_index > (sprite_get_number(pizzaface_sprite) - 1))
    pizzaface_index = frac(pizzaface_index)
if (hand_index > (sprite_get_number(hand_sprite) - 1))
    hand_index = frac(hand_index)
if (johnface_index > (sprite_get_number(johnface_sprite) - 1))
    johnface_index = frac(johnface_index)
combo_posX = Wave(-5, 5, 2, 20)
if (global.combotime > 0 && global.combo != 0)
{
    switch combo_state
    {
        case 0:
            combo_posY += combo_vsp
            combo_vsp += 0.5
            if (combo_posY > 20)
                combo_state++
            break
        case 1:
            combo_posY = lerp(combo_posY, 0, 0.05)
            if (combo_posY < 1)
            {
                combo_posY = 0
                combo_vsp = 0
                combo_state++
            }
            break
        case 2:
            if (global.combotime < 30)
            {
                combo_posY += combo_vsp
                if (combo_vsp < 20)
                    combo_vsp += 0.5
                if (combo_posY > 0)
                {
                    combo_posY = 0
                    combo_vsp = -1
                    if (global.combotime < 15)
                        combo_vsp = -2
                }
            }
            else
                combo_posY = Approach(combo_posY, 0, 10)
            break
    }

}
else
{
    combo_posY = Approach(combo_posY, -500, 5)
    combo_vsp = 0
    combo_state = 0
}
combofill_index += 0.35
if (combofill_index > (sprite_get_number(spr_tv_combobubblefill) - 1))
    combofill_index = frac(combofill_index)
if (global.tvbackground == 1)
{
    drawing = 1
    scr_hub_bg_step()
    if (!drawing)
    {
        var dis = 250
        bgalpha = (distance_to_object(obj_player) / dis)
        bgalpha -= 0.25
        if (bgalpha > 1)
            bgalpha = 1
        if (bgalpha < 0)
            bgalpha = 0
    }
    else if drawing
    {
        if (dotransition == 1)
        {
            if resetbg
            {
                resetbg = 0
                bgsprite = newbgsprite
                dotransition = 0
            }
        }
        else
            bgalpha = Approach(bgalpha, 0, 0.1)
    }
}
