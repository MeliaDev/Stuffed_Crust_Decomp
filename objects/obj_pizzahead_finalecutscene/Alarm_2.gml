layer_set_visible("Backgrounds_tower1", 0)
layer_set_visible("Backgrounds_tower2", 0)
layer_set_visible("Backgrounds_tower3", 0)
layer_set_visible("Backgrounds_tower4", 0)
layer_set_visible("Backgrounds_tower5", 0)
layer_set_visible("Backgrounds_towermeteor", 0)
layer_vspeed("Backgrounds_towermeteor", 0)
sprite_index = bg_piledrivercloseshot
image_speed = 1
x = 0
y = 0
fmod_event_instance_set_parameter(snd, "state", 2, 1)
piledrivershot = 1
alarm[1] = 200
