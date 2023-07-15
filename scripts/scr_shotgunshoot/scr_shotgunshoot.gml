function scr_shotgunshoot() //scr_shotgunshoot
{
    input_buffer_shoot = 0
    fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
    with (instance_create(x, y, obj_pistoleffect))
        image_xscale = other.xscale
    sprite_index = spr_shotgunshoot
    state = (69 << 0)
    if grounded
        movespeed = 0
    jumpAnim = 1
    image_index = 0
    with (instance_create((x + (xscale * 46)), (y + 6), obj_shotgunblast))
    {
        image_xscale = other.xscale
        with (bulletID)
            image_xscale = other.image_xscale
    }
}

