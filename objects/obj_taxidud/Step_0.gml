x += hsp
if (hsp != 0)
{
    dust += 1
    if (dust == 40)
    {
        dust = 0
        create_particle(x, (y + 43), (1 << 0))
    }
}
if start
{
    if (jumpbuffer > 0)
        jumpbuffer--
    else if (!jump)
    {
        jump = 1
        vsp = -11
    }
}
if jump
{
    y += vsp
    if (vsp < 20)
        vsp += 0.5
}
