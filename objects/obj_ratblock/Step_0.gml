image_speed = 0.35
if (sprite_index != spr_rattumbleblock && sprite_index != spr_rattumbleblock_big && sprite_index != spr_ratblock6)
    mask_index = spr_ratblock1
else
    mask_index = sprite_index
if anim
    animy = Approach(animy, -10, 1.5)
else
    animy = Approach(animy, 0, 1.5)
if (animy == -10)
    anim = 0
if (use_sound && (!fmod_event_instance_is_playing(sniffsnd)))
    fmod_event_instance_play(sniffsnd)
if (sprite_index == spr_ratblock1_bump && floor(image_index) == (image_number - 1))
    sprite_index = spr_ratblock1
if (sprite_index == spr_ratblock2_bump && floor(image_index) == (image_number - 1))
    sprite_index = spr_ratblock2
if (sprite_index == spr_ratblock3_bump && floor(image_index) == (image_number - 1))
    sprite_index = spr_ratblock3
if (sprite_index == spr_ratblock4_bump && floor(image_index) == (image_number - 1))
    sprite_index = spr_ratblock4
if (sprite_index == spr_ratblock5_bump && floor(image_index) == (image_number - 1))
    sprite_index = spr_ratblock5
if (sprite_index == spr_ratblock6_bump && floor(image_index) == (image_number - 1))
    sprite_index = spr_ratblock6
