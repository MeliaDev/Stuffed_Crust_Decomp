scr_initenemy()
shot = 0
totemID = -4
totemdir = 1
grav = 0.5
hsp = 0
vsp = 0
movespeed = 3
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
hp = 2
hitboxcreate = 0
grounded = 1
idlespr = spr_indiancheese_walk
stunfallspr = spr_indiancheese_stun
walkspr = spr_indiancheese_walk
grabbedspr = spr_indiancheese_stun
scaredspr = spr_indiancheese_scared
spr_dead = spr_indiancheese_dead
dancespr = spr_indiancheese_dance
landspr = spr_indiancheese_land
jumpspr = spr_indiancheese_jump
howlspr = spr_indiancheese_howl
turnspr = spr_indiancheese_turn
if global.tribecheesecensor
{
    idlespr = spr_ufogrounded_walk
    stunfallspr = spr_ufogrounded_stun
    walkspr = spr_ufogrounded_walk
    grabbedspr = spr_ufogrounded_stun
    scaredspr = spr_ufogrounded_scared
    spr_dead = spr_ufolive_dead
    dancespr = spr_ufogrounded_dance
    landspr = spr_ufogrounded_dancevar_land
    jumpspr = spr_ufogrounded_jump
    howlspr = spr_ufogrounded_scared
    turnspr = spr_ufogrounded_dance
}
sprite_index = idlespr
image_xscale = -1
flash = 0
slapped = 0
birdcreated = 0
boundbox = 0
important = 0
heavy = 0
depth = 0
jumptimer = 50
arcprojectiletimer = 25
if global.panic
{
    if (room == badland_1 || room == badland_2 || room == badland_3)
    {
        var lay = layer_get_id("Backgrounds_stillH1")
        layer_background_sprite(layer_background_get_id(lay), 2322)
    }
    if (room == badland_6 || room == badland_4 || room == badland_5 || room == badland_10 || room == badland_8b)
    {
        lay = layer_get_id("Backgrounds_still1")
        layer_background_sprite(layer_background_get_id(lay), 4201)
    }
}
