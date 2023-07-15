if (state == (0 << 0))
{
    hsp = 0
    state = (126 << 0)
    alarm[0] = (80 + irandom(100))
}
else
{
    image_xscale *= -1
    state = (0 << 0)
    alarm[0] = (60 + irandom(120))
}
