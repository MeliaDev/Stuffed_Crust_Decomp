with (other)
{
    if (!scr_transformationcheck())
        return;
}
if (other.state != (47 << 0) && other.state != (48 << 0) && other.state != (49 << 0) && other.state != (38 << 0) && other.state != (84 << 0) && other.state != (61 << 0) && other.state != (106 << 0) && other.y > other.yprevious && (((!other.isgustavo) && other.y <= (y + 10)) || (other.isgustavo && other.y < y)))
{
    if (!other.isgustavo)
    {
        if (other.state == (80 << 0))
            other.movespeed = abs(other.hsp)
        other.y = (y - 49)
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
