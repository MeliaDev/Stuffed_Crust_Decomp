title_index += 0.35
image_index = title_index
if (global.stylethreshold > 0)
{
    if (global.stylethreshold == 1)
        sprite_index = spr_heatmultiply1
    if (global.stylethreshold == 2)
        sprite_index = spr_heatmultiply2
    if (global.stylethreshold == 3)
        sprite_index = spr_heatmultiply3
    if (global.stylethreshold == 4)
        sprite_index = spr_heatmultiply4
}
else
    instance_destroy()
paletteselect = 0
vsp -= 1
y = ((obj_player1.y - 20) + vsp)
x = obj_player1.x
if (alpha > 0)
    alpha -= 0.05
else
    instance_destroy()
