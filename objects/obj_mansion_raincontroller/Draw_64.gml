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
if (showrain && (!override))
    draw_sprite_ext(bg_pizzaface_p3_rain, -1, 480, 270, image_xscale, image_yscale, 0, c_white, 1)
if global.panic
    fireanim = 1
else if (fireanim == 1)
{
    if (realy < 200)
    {
        if (godown == 0)
            godown = 1
    }
}
if fireanim
{
    xedit = Wave(-10, 10, 4, 5)
    yedit = Wave(-5, 5, 2, 20)
    if (godown == 1)
    {
        if (realy < 200)
        {
            realymod += 0.05
            realy += (4 + realymod)
        }
        else
        {
            fireanim = 0
            godown = 0
            realy = 200
            realymod = 0
        }
    }
    else if (realy > 70)
    {
        realymod += 0.025
        realy -= (4 + realymod)
    }
    else
    {
        realy = 70
        realymod = 0
    }
    draw_sprite_ext(bg_streetfirefront, -1, (-60 + xedit), ((realy + yedit) + 15), image_xscale, image_yscale, 0, c_white, 0.8)
}
else
    yedit = 0
