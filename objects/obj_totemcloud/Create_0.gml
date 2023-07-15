trigger = 1
active = 0
shot = 0
do_sound = ground_boundtitrle_cardd
attackspr = spr_totemcloud_attack
endspr = spr_totemcloud_end
idlespr = spr_totemcloud_idle
spawnspr = spr_totemcloud_spawn
if global.tribecheesecensor
{
    attackspr = spr_wmcloud_attack
    endspr = spr_wmcloud_end
    idlespr = spr_wmcloud_idle
    spawnspr = spr_wmcloud_spawn
}
sprite_index = endspr
image_index = (image_number - 1)
image_speed = 0
depth = -5
snd = fmod_event_create_instance("event:/sfx/misc/thundercloud")
