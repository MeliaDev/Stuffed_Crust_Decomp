if (!instance_exists(baddieID))
    instance_destroy()
x = (baddieID.x + (baddieID.image_xscale * 48))
y = (baddieID.y + 48)
image_xscale = baddieID.image_xscale
if (baddieID.state != (238 << 0))
    instance_destroy()
