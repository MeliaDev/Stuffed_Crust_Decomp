layer_set_visible("Backgrounds_tower1", 1)
layer_set_visible("Backgrounds_tower2", 1)
layer_set_visible("Backgrounds_tower3", 1)
layer_set_visible("Backgrounds_tower4", 1)
layer_set_visible("Backgrounds_tower5", 1)
layer_set_visible("Backgrounds_towermeteor", 1)
layer_vspeed("Backgrounds_towermeteor", 0.3)
if (!piledrivershot)
{
    fmod_event_instance_set_parameter(snd, "state", 1, 1)
    alarm[2] = 200
}
else
{
    fmod_event_instance_set_parameter(snd, "state", 3, 1)
    alarm[3] = 120
}
