x = (obj_screensizer.actual_width / 2)
y = (obj_screensizer.actual_height + sprite_get_height(spr_gustavo_intro))
movespeed = 8
state = (8 << 0)
depth = -600
sprite_index = spr_tvstatic
image_index = 0
image_speed = 0.35
spr = -4
with (obj_camera)
{
    smoothcam = 1
    lock = 1
}
fmod_event_one_shot("event:/sfx/ui/tvswitch")
shakey = 0
