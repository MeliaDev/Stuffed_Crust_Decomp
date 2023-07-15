depth = (obj_player.depth + 1)
scr_create_uparrowhitbox()
paletteselect = 0
showtext = 0
alpha = 0
active = 1
if global.panic
    instance_destroy()
else if global.heatmeter
    alarm[4] = irandom_range(35, 80)
