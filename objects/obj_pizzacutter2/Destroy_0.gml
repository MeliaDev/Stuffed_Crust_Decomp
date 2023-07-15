with (instance_create(x, y, obj_sausageman_dead))
{
    sprite_index = other.sprite_index
    image_alpha = other.image_alpha
}
with (instance_create(x, y, obj_sausageman_dead))
{
    sprite_index = spr_pizzacutterholder
    image_alpha = other.image_alpha
}
instance_create(x, y, obj_bangeffect)
