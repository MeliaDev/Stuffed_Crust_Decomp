/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for Wave

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
if (is_bossroom() || room == editor_room || room == Titlescreen || instance_exists(obj_tutorialbook))
    return;
if visible
{
    if active
    {
        bubble_y = (90 + Wave(-5, 5, 2, 20))
        if (global.stylethreshold != 0)
            draw_sprite_ext(sprite, index, bubble_x, bubble_y, image_xscale, image_yscale, 0, c_white, alpha)
    }
}
