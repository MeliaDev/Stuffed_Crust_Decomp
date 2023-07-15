hsp = 0
vsp = 0
hsp_carry = 0
vsp_carry = 0
grav = 0.5
platformid = -4
image_speed = 0.35
introstate = 0
introbuffer = 0
peppermanid = -4
prop = 0
proparr = [[1282, 4067, 3423, -7], [3069, 3081, 967, -6], [1331, 1243, 967, -5], [3904, 1588, 967, -4]]
with (obj_music)
{
    if (music != noone)
        fmod_event_instance_set_parameter(music.event, "state", 2, 0)
}
if (room == rm_testing4)
{
    with (obj_player)
        state = (146 << 0)
}
instance_destroy(obj_superattackeffect)
instance_destroy(obj_blackoutline)
warbg_stop()
steppysnd = 0
snd_spin = fmod_event_create_instance("event:/sfx/pizzahead/spin")
snd_laugh = fmod_event_create_instance("event:/sfx/voice/pizzahead")
