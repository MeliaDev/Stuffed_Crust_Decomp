/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for distance_to_pos

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
refresh--
if (sprite_index != spr_giantslimethrow)
{
    if (refresh <= 0 && distance_to_pos(x, y, obj_player.x, obj_player.y, 400, 400))
    {
        sprite_index = spr_giantslimethrow
        image_index = 0
        shot = 0
    }
}
else if ((!shot) && floor(image_index) == 1)
{
    fmod_event_one_shot_3d("event:/sfx/enemies/burp", x, y)
    fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y)
    with (instance_create((x + (10 * image_xscale)), (y - 6), obj_cheeseball))
    {
        image_xscale = other.image_xscale
        vsp = -5
    }
    shot = 1
}
else if (floor(image_index) == (image_number - 1))
{
    sprite_index = spr_giantslime
    refresh = 100
}
