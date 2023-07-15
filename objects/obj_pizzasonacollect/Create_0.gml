idlespr = spr_pizzasona1
throwspr = spr_pizzasona1throw
transitionspr = spr_pizzasona1trans
collectID = -4
onebyoneID = -4
index = 0
showtext = 0
state = (0 << 0)
image_speed = 0.35
depth = 0
var r = -1
while (r == -1 || r == 8)
    r = irandom_range(1, 55)
idlespr = asset_get_index(concat("spr_pizzasona", r))
throwspr = asset_get_index(concat("spr_pizzasona", r, "throw"))
transitionspr = asset_get_index(concat("spr_pizzasona", r, "trans"))
