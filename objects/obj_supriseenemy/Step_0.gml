/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for distance_to_pos

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
if (state == 0 || state == 1)
    instance_deactivate_object(baddieID)
switch state
{
    case 0:
        if (!active)
            visible = false
        else
            state = 1
        break
    case 1:
        var p = instance_nearest(x, y, obj_player)
        visible = false
        image_index = 0
        if distance_to_pos(x, y, p.x, p.y, 500, 200)
        {
            state = 2
            visible = true
        }
        break
    case 2:
        image_speed = 0.35
        instance_activate_object(baddieID)
        fmod_event_one_shot_3d("event:/sfx/misc/secretexit", x, y)
        with (baddieID)
        {
            x = other.x
            y = other.y
            boundbox = 0
            create_particle(x, y, (9 << 0))
            instance_create(x, (y - 42), obj_pizzaportalfade)
        }
        state = 3
        break
    case 3:
        if (floor(image_index) == (image_number - 1))
            visible = false
        break
}

