if place_meeting(x, y, obj_player)
{
    with (obj_player)
    {
        if attacking
        {
            with (other)
            {
                thrown = true
                vsp = -9
                hsp = 8
            }
        }
    }
}
if place_meeting(x, y, obj_shotgunbullet)
    instance_destroy();
if place_meeting(x, y, obj_dynamite)
    instance_destroy();
if (vsp > 0 && grounded)
    hsp = 0;
if (place_meeting((x + hsp), (y + vsp), obj_solid) && thrown)
    instance_destroy();
if (grounded && thrown && vsp > 0)
    instance_destroy();
if (!grabbed)
    scr_collide();
