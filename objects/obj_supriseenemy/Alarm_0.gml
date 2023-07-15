ds_list_add(global.baddieroom, id)
with (instance_create(x, y, content))
{
    if (object_index == obj_pizzagoblinbomb)
        defused = 1
    image_speed = 0.35
    image_xscale = other.image_xscale
    with (other)
        baddieID = other.id
    instance_deactivate_object(id)
}
active = 1
