if (state == (134 << 0) && formed)
    miniflash = (!miniflash)
else
    miniflash = 0
if (!miniflash)
    alarm[8] = 10
else
    alarm[8] = 5
