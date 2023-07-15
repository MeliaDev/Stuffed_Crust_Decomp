function scr_enemy_pizzaheadjump() //scr_enemy_pizzaheadjump
{
    stompable = 0
    if place_meeting(x, y, obj_solid)
        vsp = -12
    if (vsp < 0)
    {
        use_collision = 0
        x += hsp
        y += vsp
        if (vsp < 20)
            vsp += grav
    }
    else
        use_collision = 1
    sprite_index = stunfallspr
    if (grounded && vsp > 0)
    {
        stompable = 1
        state = (138 << 0)
        stunned = 2
    }
}

