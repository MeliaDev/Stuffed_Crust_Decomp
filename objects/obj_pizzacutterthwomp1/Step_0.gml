scr_collide()
if (obj_player1.x <= (x + 48) && obj_player1.x >= (x - 48) && y <= yup)
    vsp = 5
if (grounded && goup == 0)
{
    fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, y)
    goup = 1
    alarm[0] = 10
}
if (goup == 2)
{
    y -= 2
    vsp = -4
    goup = 0
}
if (y < yup)
{
    vsp = 0
    goup = 0
    y = yup
}
if (vsp > 0)
    vsp += 1
