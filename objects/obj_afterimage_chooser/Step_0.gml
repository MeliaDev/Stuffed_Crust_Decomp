if instance_exists(obj_player)
    showtext = place_meeting(x, y, obj_player)
if instance_exists(obj_transfotip)
    showtext = 0
if showtext
    alpha = Approach(alpha, 1, 0.1)
else
    alpha = Approach(alpha, 0, 0.1)
if global.panic
    instance_destroy()
image_index = global.blueeffects
if destroystuff
{
    with (stuff)
    {
        with (instance_create(x, y, obj_sausageman_dead))
        {
            image_speed = 0
            sprite_index = spr_junk
            image_index = other.image_index
            image_xscale = (-other.image_xscale)
        }
        instance_destroy()
    }
    fmod_event_one_shot_3d("event:/sfx/enemies/killingblow", x, y)
    destroystuff = 0
}
if (distance_to_object(instance_nearest(x, y, obj_player)) > 200)
{
    if instance_exists(stuff)
        destroystuff = 1
}
