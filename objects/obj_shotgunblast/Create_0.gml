bulletID = instance_create(x, y, obj_shotgunbullet)
with (bulletID)
{
    spd = 0
    spdh = 0
    sprite_index = other.sprite_index
    mask_index = other.mask_index
    shotgun = 1
}
image_speed = 0.35
depth = -80
notification_push((43 << 0), [room])
fmod_event_one_shot_3d("event:/sfx/pep/shotgunshot", x, y)
