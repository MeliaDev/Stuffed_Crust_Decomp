var found_active = 0
with (obj_totem)
{
    if (trigger == other.trigger)
    {
        if active
            found_active = 1
    }
}
if ((!active) && found_active)
{
    active = 1
    sprite_index = spawnspr
    image_index = 0
    image_speed = 0.35
}
if (active && (!found_active))
{
    active = 0
    sprite_index = endspr
    image_index = 0
    image_speed = 0.35
    var b = 0
    with (obj_totemcloud)
    {
        if bbox_in_camera(view_camera[0], 50)
            b = 1
    }
}
if (!active)
    fmod_event_instance_stop(snd, 1)
if (sprite_index == spawnspr && floor(image_index) == (image_number - 1))
{
    sprite_index = idlespr
    alarm[0] = 40
    shot = 0
}
if (sprite_index == attackspr)
{
    if (floor(image_index) == (image_number - 1))
    {
        sprite_index = idlespr
        shot = 0
    }
    if (floor(image_index) == 11 && (!shot))
    {
        shot = 1
        with (instance_create(x, y, obj_totemthunder))
        {
            cloudID = other.id
            depth = (other.depth + 1)
            alarm[0] = 25
        }
    }
}
if (sprite_index != endspr)
    image_speed = 0.35
else if (floor(image_index) == (image_number - 1))
{
    image_index = (image_number - 1)
    image_speed = 0
}
else
    image_speed = 0.35
