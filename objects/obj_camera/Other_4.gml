x = obj_player1.x
y = obj_player1.y
with (obj_camera)
{
    shake_mag = 0
    shake_mag_acc = 0
}
if global.coop
    camera_zoom(1, 100)
fontpalettespr = spr_font_palette
if (obj_player.character == "N" || (obj_player.character == "P" && obj_player.ispeppino == 0))
{
    fontpalettespr = spr_palette_font_noise
    pizzascore_sprite = spr_pizzascore_noise
    pizzascore_topping1 = 4206
    pizzascore_topping2 = 4207
    pizzascore_topping3 = 4205
    pizzascore_topping4 = 4208
}
else
{
    fontpalettespr = spr_font_palette
    pizzascore_sprite = spr_pizzascore
    pizzascore_topping1 = 3836
    pizzascore_topping2 = 581
    pizzascore_topping3 = 1318
    pizzascore_topping4 = 1063
}
global.wave = (global.maxwave - global.fill)
targetgolf = -4
