scr_initenemy()
scr_pizzaface_p3_init_sounds()
scr_pizzaface_p3_init_attack(0)
scr_pizzaface_p3_add_attack(0, (0 << 0), 40)
scr_pizzaface_p3_add_attack(0, (2 << 0), 0)
scr_pizzaface_p3_add_attack(0, (4 << 0), 100)
scr_pizzaface_p3_init_attack(1)
scr_pizzaface_p3_add_attack(1, (0 << 0), 38)
scr_pizzaface_p3_add_attack(1, (1 << 0), 0)
scr_pizzaface_p3_add_attack(1, (4 << 0), 80)
scr_pizzaface_p3_init_attack(2)
scr_pizzaface_p3_add_attack(2, (0 << 0), 36)
scr_pizzaface_p3_add_attack(2, (3 << 0), 0)
scr_pizzaface_p3_add_attack(2, (4 << 0), 70)
scr_pizzaface_p3_init_attack(3)
scr_pizzaface_p3_add_attack(3, (0 << 0), 34)
scr_pizzaface_p3_add_attack(3, (2 << 0), 0)
scr_pizzaface_p3_add_attack(3, (1 << 0), 0)
scr_pizzaface_p3_add_attack(3, (4 << 0), 60)
scr_pizzaface_p3_init_attack(4)
scr_pizzaface_p3_add_attack(4, (0 << 0), 32)
scr_pizzaface_p3_add_attack(4, (3 << 0), 0)
scr_pizzaface_p3_add_attack(4, (2 << 0), 0)
scr_pizzaface_p3_add_attack(4, (4 << 0), 50)
scr_pizzaface_p3_init_attack(5)
scr_pizzaface_p3_add_attack(5, (0 << 0), 30)
scr_pizzaface_p3_add_attack(5, (2 << 0), 0)
scr_pizzaface_p3_add_attack(5, (1 << 0), 0)
scr_pizzaface_p3_add_attack(5, (3 << 0), 0)
scr_pizzaface_p3_add_attack(5, (4 << 0), 50)
scr_pizzaface_p3_init_attack(6)
scr_pizzaface_p3_add_attack(6, (0 << 0), 30)
scr_pizzaface_p3_add_attack(6, (2 << 0), 0)
scr_pizzaface_p3_add_attack(6, (1 << 0), 0)
scr_pizzaface_p3_add_attack(6, (3 << 0), 0)
scr_pizzaface_p3_add_attack(6, (4 << 0), 100)
currentattack = 0
pizzahead = 1
playerpowerup = 1
playerid = -4
introstate = (144 << 0)
lastattack = -1
laugh = 0
instance_destroy(obj_gustavograbbable)
instance_destroy(obj_viginoiseyspawner)
maxwalkspeed = 5
walkspeed = floor((maxwalkspeed / 2))
walkaccel = 0.5
walkdisx1 = 180
walkdisx2 = 200
attackpool = array_create(0)
vulnerable_buffer = 0
parryable = 0
playerhit = 0
introbuffer = 80
important = 1
stompable = 0
shakestun = 0
elite = 1
maxhp = 6
elitehit = maxhp
maxsubhp = 3
subhp = maxsubhp
prevhp = elitehit
turned = 0
bodyslam = 0
wastedhits = 0
state = (294 << 0)
introbuffer = 80
hitboxID = -4
headID = -4
attackspeed = 0
destroyable = 0
phase = 1
formed = 1
cooldown = 80
idle_max = 120
idle_timer = idle_max
grav = 0.5
hsp = 0
vsp = 0
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
landspr = spr_pizzahead_phase3idle
idlespr = spr_pizzahead_phase3idle
fallspr = spr_pizzahead_phase3idle
stunfallspr = spr_pizzahead_phase3stunned
walkspr = spr_pizzahead_phase3idle
turnspr = spr_pizzahead_phase3idle
recoveryspr = spr_pizzahead_phase3idle
grabbedspr = spr_pizzahead_phase3stunned
scaredspr = spr_pizzahead_phase3idle
ragespr = spr_pizzahead_phase3idle
hp = 1
slapped = 0
grounded = 1
birdcreated = 0
boundbox = 0
spr_dead = spr_pizzahead_phase3stunned
important = 0
heavy = 1
paletteselect = 0
spr_palette = palette_cheeseslime
grabbedby = 0
stuntouchbuffer = 0
scaredbuffer = 0
dir = 1
woosh = 0
flickertime = 0
touchedground = 0
