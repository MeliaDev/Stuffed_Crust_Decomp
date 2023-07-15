with (other)
{
    if (!scr_transformationcheck())
        return;
    while place_meeting(x, y, obj_grindrailslope)
        y--
}
if ((other.y > other.yprevious || (other.xscale == sign(image_xscale) && other.y < bbox_bottom)) && other.state != (47 << 0) && other.state != (48 << 0) && other.state != (49 << 0) && other.state != (38 << 0) && other.state != (84 << 0) && other.state != (61 << 0) && other.state != (106 << 0))
{
    if (!other.isgustavo)
    {
        if (other.movespeed < 10)
            other.movespeed = 10
        other.state = (78 << 0)
    }
    else if (other.state != (202 << 0))
    {
        with (other)
        {
            gusuppercutbuff = 0
            if (brick == 1)
            {
                with (instance_create(x, y, obj_brickcomeback))
                    wait = 1
            }
            with (instance_create(x, (y - 5), obj_parryeffect))
            {
                fmod_event_one_shot_3d("event:/sfx/pep/step", x, y)
                sprite_index = spr_grabhangeffect
                image_speed = 0.35
            }
            brick = 0
            with (obj_camera)
            {
                followtarget = other.id
                state = (299 << 0)
            }
        }
        other.y = (y + 8)
        other.state = (202 << 0)
    }
}
