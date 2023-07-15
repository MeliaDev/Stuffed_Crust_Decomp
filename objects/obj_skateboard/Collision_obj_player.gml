with (other)
{
    if (state != (61 << 0) && skateboarding == 0)
    {
        fmod_event_one_shot_3d("event:/sfx/misc/honkhonk", x, y)
        instance_create(x, y, obj_genericpoofeffect)
        sprite_index = spr_clown
        movespeed = 10
        state = (104 << 0)
        skateboarding = 1
        clowntimer = 300
    }
}
