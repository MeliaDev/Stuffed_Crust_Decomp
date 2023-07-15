if (state == (126 << 0) || (state == (146 << 0) && substate == (126 << 0)))
{
    repeat irandom_range(1, 3)
        create_heatpuff((x + irandom_range(-50, 50)), (y - 70))
    alarm[0] = 8
}
