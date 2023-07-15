if (!instakill)
{
    if pistol
    {
        with (instance_create(x, y, obj_sausageman_dead))
        {
            sprite_index = spr_peppinobullet_dead
            image_xscale = other.image_xscale
        }
    }
    if (sprite_index == spr_mortprojectile)
    {
        with (instance_create(x, y, obj_sausageman_dead))
        {
            fmod_event_one_shot_3d("event:/sfx/mort/mortdead", x, y)
            sprite_index = spr_mortdead
            image_xscale = other.image_xscale
        }
    }
    if (sprite_index == spr_cheesebullet || sprite_index == spr_cheesebullet_loop)
    {
        with (instance_create(x, y, obj_explosioneffect))
        {
            image_speed = 0.25
            depth = other.depth
            sprite_index = spr_cheesebullet_dead
            image_alpha = other.image_alpha
            image_xscale = (-other.image_xscale)
        }
    }
    else if (sprite_index != sprite10391)
    {
        repeat (6)
            create_particle((x + random_range(-25, 25)), (y + random_range(-25, 25)), (7 << 0), 0)
    }
    else
    {
        repeat (6)
            create_particle(((x - (32 * image_xscale)) + random_range(-25, 25)), (y + random_range(-25, 25)), (7 << 0), 0)
    }
}
