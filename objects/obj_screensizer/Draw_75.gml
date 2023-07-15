/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gameframe_draw

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for gameframe_button_draw

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
surface_reset_target()
shader_reset()
draw_set_alpha(1)
if (!surface_exists(gui_surf))
{
    gpu_set_blendmode(bm_normal)
    return;
}
global.Pattern_Texture_Indexed = -4
if (frac(app_scale) > 0 && global.option_texfilter)
    gpu_set_texfilter(true)
else
    gpu_set_texfilter(false)
if (global.option_scale_mode == 0)
    draw_surface(gui_surf, 0, 0)
else
{
    var _w = (display_get_gui_width() * app_scale)
    var _h = (display_get_gui_height() * app_scale)
    draw_surface_ext(gui_surf, window_to_gui_x(((window_get_width() / 2) - (_w / 2))), window_to_gui_y(((window_get_height() / 2) - (_h / 2))), window_to_gui_xscale(app_scale), window_to_gui_yscale(app_scale), 0, c_white, 1)
}
gpu_set_blendmode(bm_normal)
gpu_set_texfilter(false)
if window_has_focus()
    gameframe_draw()
