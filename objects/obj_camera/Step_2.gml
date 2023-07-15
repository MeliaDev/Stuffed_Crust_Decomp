if (global.panic == 1 && global.panictilt)
{
    if (global.panicshadetimer < 250000)
    {
        if (global.panicshadetimer < 40000)
            global.panicshadetimer += 200
        else
            global.panicshadetimer += 50
    }
    else
        global.panicshadetimer += 1
    idkanymore = cos(rotates)
    var cm = obj_tv.chunkmax
    var wowie = (0.0005 / (global.fill / cm))
    if (global.panic && global.fill > (cm / 6))
    {
        rotates += wowie
        tracktilt = wowie
    }
    else
        rotates += (tracktilt * 1.125)
    camera_set_view_angle(view_camera[0], (idkanymore * 2))
}
else
{
    global.panicshadetimer = 0
    tracktilt = 0
    rotates = 0
    idkanymore = 0
}
if (global.panicshadetimer < 0)
    global.panicshadetimer = 0
if (global.wave < 0)
    global.wave = 1
if (global.maxwave < 0)
    global.maxwave = 1
if (global.fill < 0)
    global.fill = 0
