vsp = random_range(-10, -18)
hsp = (sign((x - obj_player.x)) * random_range(10, 18))
grav = 0.4
angle = 0
randomize()
spinspeed = 0
spinchance = irandom(100)
if (spinchance == 7 || (spinchance >= 70 && spinchance <= 77))
    spinspeed = choose(5, 10, 15, 20, 25, 30, 35)
alarm[0] = 5
cigar = 0
stomped = 0
oldpalettetexture = -4
buffer = 10
if (x != obj_player1.x)
    image_xscale = (-(sign((x - obj_player1.x))))
depth = -999
gui = 0
usepalette = 0
paletteselect = 0
spr_palette = bg_chateauscrolldeco
d = 255
