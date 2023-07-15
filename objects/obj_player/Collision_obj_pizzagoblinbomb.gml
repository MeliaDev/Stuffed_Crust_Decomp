if (!other.grabbable)
{
}
if (state != (34 << 0))
{
    if (state == (42 << 0) || state == (43 << 0) || state == (80 << 0))
    {
        if (other.state == (0 << 0) && scr_transformationcheck() && (!cutscene) && state != (52 << 0) && (state == (42 << 0) || state == (80 << 0) || state == (43 << 0)))
        {
            state = (52 << 0)
            image_index = 0
            sprite_index = spr_haulingstart
            other.defused = 1
            bombgrabID = other.id
            fmod_event_one_shot_3d("event:/sfx/noise/bombbounce", x, y)
            with (instance_create((x + (xscale * 25)), y, obj_parryeffect))
            {
                sprite_index = spr_grabeffect
                image_xscale = other.xscale
                image_speed = 0.35
            }
            with (other)
            {
                state = (4 << 0)
                playerid = other.id
            }
        }
    }
}
else if (other.kickbuffer <= 0)
{
    other.vsp = -9
    other.movespeed = 7
    other.image_xscale = xscale
    other.kickbuffer = 15
    other.y--
    other.defused = 1
}
