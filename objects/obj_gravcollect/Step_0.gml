if (!gotowardsplayer)
{
    if place_meeting(x, (y + sign(vsp)), obj_solidparent)
        vsp = 0
    else
        y += vsp
    if (abs(hsp) > 0)
    {
        if (place_meeting((x + sign(hsp)), y, obj_solidparent) && place_meeting((x + sign(hsp)), (y - 1), obj_solidparent) && (!(place_meeting((x + sign(hsp)), (y - 2), obj_solidparent))))
            y -= 2
        else if (place_meeting((x + sign(hsp)), y, obj_solidparent) && (!(place_meeting((x + sign(hsp)), (y - 1), obj_solidparent))))
            y--
        if ((!(place_meeting((x + sign(hsp)), y, obj_solidparent))) && (!(place_meeting((x + sign(hsp)), (y + 1), obj_solidparent))) && (!(place_meeting((x + sign(hsp)), (y + 2), obj_solidparent))) && place_meeting((x + sign(hsp)), (y + 3), obj_solidparent))
            y += 2
        else if ((!(place_meeting((x + sign(hsp)), y, obj_solidparent))) && (!(place_meeting((x + sign(hsp)), (y + 1), obj_solidparent))) && place_meeting((x + sign(hsp)), (y + 2), obj_solidparent))
            y++
        if (!(place_meeting((x + sign(hsp)), y, obj_solidparent)))
            movespeed -= 0.25
        else
            movespeed -= 0.5
        x += (sign(hsp) * movespeed)
        if (movespeed <= 0)
            hsp = 0
    }
    if (vsp < 80)
        vsp += grav
    movespeed -= 0.025
    grav += 0.0125
}
if place_meeting(x, (y + 1), obj_solidparent)
    hsp = 0
if (cantcollect == 1)
{
    if (flicker == 0)
    {
        alarm[1] = 3
        flicker = 1
    }
}
if (cantcollect == 0)
{
    event_inherited()
    if (flicker == 1)
    {
        image_alpha = 1
        flicker = 0
    }
}
