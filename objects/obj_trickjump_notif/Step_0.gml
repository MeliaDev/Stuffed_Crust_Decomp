image_index = title_index
if (sprite_index == spr_resulttextOMG || sprite_index == spr_resulttextSICK || sprite_index == spr_resulttextNUTS)
    title_index += 0.35
else
    title_index = ramp_points
paletteselect = 0
vsp -= 3
y = ((obj_player1.y - 20) + vsp)
x = obj_player1.x
if (alpha > 0)
    alpha -= 0.15
else
    instance_destroy()
