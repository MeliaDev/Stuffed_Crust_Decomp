scr_initenemy()
grav = 0.5
hsp = 0
vsp = 0
movespeed = 0
state = (134 << 0)
stunned = 0
alarm[0] = 150
roaming = 1
collectdrop = 5
flying = 0
straightthrow = 0
cigar = 0
cigarcreate = 0
stomped = 0
shot = 0
reset = 0
flash = 0
landspr = spr_slimebounce
idlespr = spr_banditochicken_sleep
fallspr = spr_slimefall
stunfallspr = spr_banditochicken_stun
walkspr = spr_banditochicken_chase
turnspr = spr_slimeturn
recoveryspr = spr_slimerecovery
grabbedspr = spr_banditochicken_stun
scaredspr = spr_banditochicken_scared
hp = 2
slapped = 0
grounded = 1
birdcreated = 0
boundbox = 0
spr_dead = spr_banditochicken_dead
important = 0
heavy = 0
depth = 0
paletteselect = 1
spr_palette = palette_cheeseslime
grabbedby = 0
momentum = 5
hitboxcreate = 0
image_speed = 0.35
steppy = 0
stuntouchbuffer = 0
activated = 0
movespeed = 12
bonebuffer = 100
jumping = 0
var theroomname = room_get_name(room)
if (string_pos("saloon", theroomname) != 0)
{
    if (room == saloon_2b || room == saloon_3b || room == saloon_4b || room == saloon_5b || room == saloon_6b)
    {
        if global.panic
        {
            var lay = layer_get_id("Backgrounds_still1")
            layer_background_sprite(layer_background_get_id(lay), 3214)
        }
    }
}
