repeat (3)
    create_debris(x, y, 1531)
repeat (3)
    create_debris(x, y, 1980)
with (instance_create(x, y, obj_sausageman_dead))
    sprite_index = other.spr_dead
