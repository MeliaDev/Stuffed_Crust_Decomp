var mh_id = other.id
if instance_exists(obj_parryeffect)
{
    with (obj_parryeffect)
    {
        if (follow == 1)
            instance_destroy()
    }
}
with (playerid)
{
    if (state != (14 << 0))
    {
        fmod_event_one_shot_3d("event:/sfx/mort/hook", other.x, other.y)
        state = (14 << 0)
        morthookID = mh_id
        tauntstoredmovespeed = movespeed
        movespeed = 12
        jumpstop = 0
        instance_destroy(other)
    }
}
with (instance_create(other.x, (other.y + 10), obj_parryeffect))
    sprite_index = spr_morthookgrabeffect
instance_destroy()
