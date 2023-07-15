if (escape == 0 || (escape == 1 && global.panic == 1))
{
    with (instance_create(x, y, obj_sausageman_dead))
        sprite_index = spr_meatball_dead
}
