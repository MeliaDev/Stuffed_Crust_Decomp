/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for Wave

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for Wave

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
if (global.panic && (!donepanic))
{
    donepanic = 1
    if (!lapgran)
        text = lang_get_value("getout")
    event_perform(ev_other, ev_room_start)
}
text_xscale = ((obj_screensizer.actual_width - 64) / sprite_get_width(spr_tutorialbubble))
wave_timer += 20
if (text_xscale != text_oldxscale)
    event_perform(ev_other, ev_room_start)
if showgranny
{
    if (voicecooldown > 1)
        voicecooldown--
    else if (!(place_meeting(x, y, obj_player)))
        voicecooldown = 0
    if (place_meeting(x, y, obj_player) && obj_player.movespeed < 12)
    {
        sprite_index = spr_tutorialgranny_talk
        if (voicecooldown == 0)
        {
            fmod_event_one_shot_3d("event:/sfx/voice/pizzagranny", x, y)
            voicecooldown = 100
        }
    }
    else
        sprite_index = spr_tutorialgranny_sleep
}
var _hide = 0
with (obj_grannypizzasign)
{
    if (text_state != (18 << 0))
        _hide = 1
}
if (instance_exists(obj_mrsticknotification) || obj_player.state == (112 << 0))
    _hide = 1
switch text_state
{
    case (18 << 0):
        repeat (_hide + 1)
            text_y = Approach(text_y, (-((text_sprite_height * text_yscale))), 5)
        if (obj_player1.state != (290 << 0) && place_meeting(x, y, obj_player) && (!_hide))
        {
            text_state = (135 << 0)
            text_vsp = 0
        }
        break
    case (135 << 0):
        text_y += text_vsp
        if (text_vsp < 20)
            text_vsp += 0.5
        if (text_y > text_ystart)
            text_state = (0 << 0)
        break
    case (0 << 0):
        text_y = Approach(text_y, text_ystart, 2)
        if ((!(place_meeting(x, y, obj_player))) || _hide)
            text_state = (18 << 0)
        break
}

text_wave_x = Wave(-5, 5, 2, 10, wave_timer)
text_wave_y = Wave(-1, 1, 4, 0, wave_timer)
