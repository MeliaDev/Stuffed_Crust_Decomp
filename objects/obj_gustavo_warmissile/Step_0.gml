/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for angle_rotate

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
instance_destroy(instance_place(x, (y + 16), obj_metalblock))
if instance_exists(baddieID)
    direction = angle_rotate(direction, point_direction(x, y, baddieID.x, baddieID.y), 2)
else
    baddieID = instance_nearest(x, y, baddieID)
image_angle = direction
if obj_player1.isgustavo
{
    if (!fmod_event_instance_is_playing(snd))
        fmod_event_instance_play(snd)
    fmod_event_instance_set_3d_attributes(snd, x, y)
    if (!instance_exists(obj_baddie))
        baddieID = instance_nearest(x, y, obj_hungrypillar)
    if (obj_player1.key_shoot2 || ((!instance_exists(obj_ratblock)) && (!instance_exists(obj_baddie)) && (!instance_exists(obj_hungrypillar))))
    {
        fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y)
        instance_destroy()
    }
}
