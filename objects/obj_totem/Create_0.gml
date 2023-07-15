MAX_TOTEMCHEESE = 2
active = 0
trigger = 1
cheeseID = array_create(MAX_TOTEMCHEESE, -4)
machslidebuffer = 0
machslidecount = 0
machslidecounted = 0
depth = -5
image_speed = 0.3
snd = fmod_event_create_instance("event:/sfx/enemies/tribaldance")
fmod_event_instance_set_3d_attributes(snd, x, y)
idlespr = spr_totemcheese
inactivespr = spr_totemcheese_inactive
pepidlespr = spr_totemcheese_pep
trans = 0
if global.tribecheesecensor
{
    idlespr = spr_weathermachine
    inactivespr = spr_weathermachine_inactive
    pepidlespr = spr_weathermachine_pep
}
