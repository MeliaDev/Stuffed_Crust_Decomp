spr_dead = spr_rattumbleblock_big_dead
depth = 2
anim = 0
animy = 0
sniffsnd = fmod_event_create_instance("event:/sfx/rat/ratsniff")
fmod_event_instance_set_3d_attributes(sniffsnd, x, y)
use_sound = ground_boundtitrle_cardd
deadsnd = "event:/sfx/rat/ratbowling"
if (place_meeting((x + 1), y, object_index) && place_meeting((x - 1), y, object_index))
    use_sound = 0
if (use_sound && place_meeting((x + 1), y, object_index) && (!(place_meeting((x - 1), y, object_index))))
    use_sound = 0
