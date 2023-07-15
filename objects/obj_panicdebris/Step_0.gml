if (global.panic == 1 && start == 0)
{
    if global.lap
        alarm[0] = ((irandom_range(4, 10) / 2) * ((global.wave / global.maxwave) * 2))
    else
        alarm[0] = irandom_range(4, 10)
    start = 1
}
if (global.panic == 0)
{
    alarm[0] = -1
    start = 0
}
