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
var _hide = 0
wave_timer += 20
with (obj_tutorialbook)
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
        if (place_meeting(x, y, obj_player) && (!_hide) && obj_player.movespeed < 12)
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
