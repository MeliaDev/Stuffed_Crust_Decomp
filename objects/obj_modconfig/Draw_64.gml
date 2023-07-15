/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for Wave

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
draw_sprite_tiled_ext(spr_finalrankBG, bginde, bx++, by++, 1, 1, c_white, 1)
var xx = 100
image_speed = 0.35
var yy = (155 + scroll)
var pad = 12
draw_set_halign(fa_left)
var wave = Wave(-3, 3, 2, 2)
draw_set_valign(fa_bottom)
var shake = irandom_range(-1, 1)
draw_set_font(global.creditsfont)
var txt = ""
var options = options_array
var sel = options_array2
var selex = (((xx + pad) + wave) + (shake / 2))
for (var i = 0; i < array_length(options); i++)
{
    var val = variable_global_get(options[i][1])
    var c = (selected == i ? c_white : c_gray)
    var c2 = (variable_global_get(options[i][1]) == 1 ? c_white : c_gray)
    var c25 = (variable_global_get(options[i][1]) != 1 ? c_white : c_gray)
    var realx = (selected == i ? selex : xx)
    txt = options[i][0]
    if (selected == i)
        draw_sprite(spr_cursor, -1, (xx - 40), ((yy - pad) + 2))
    if (options[i][1] != "c")
        draw_text_color(realx, yy, txt, c, c, c, c, 1)
    else
        draw_text_color((xx - pad), yy, txt, c_white, c_white, c_white, c_white, 1)
    if (options[i][1] != "c" && options[i][2] != 1)
    {
        draw_text_color(((xx + string_width(txt)) + 64), yy, sel[i][0], c2, c2, c2, c2, 1)
        draw_text_color((((xx + string_width(txt)) + xx) + 64), yy, sel[i][1], c25, c25, c25, c25, 1)
    }
    else if (options[i][2] == 1)
        draw_text_color(((xx + string_width(txt)) + 64), yy, thirds[i][val], c, c, c, c, 1)
    yy += (string_height(txt) + pad)
}
draw_set_halign(fa_center)
draw_set_valign(fa_bottom)
draw_set_color(c_white)
var xx2 = ((obj_screensizer.actual_width / 2) + shake)
var yy2 = ((obj_screensizer.actual_height - 50) + shake)
draw_text(xx2, yy2, options_desc[selected])
