if (!instance_exists(baddieID))
    instance_destroy()
x = baddieID.x
y = baddieID.y
if (baddieID.state == (134 << 0))
    sprite_index = spr_pizzaface_attackend
else
    sprite_index = baddieID.mask_index
mask_index = sprite_index
