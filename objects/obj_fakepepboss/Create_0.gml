scr_initenemy()
scr_fakepep_init_sounds()
var default_deformed_timer = 500
fakepep_set_attack(0, 0, (0 << 0), 80, default_deformed_timer)
fakepep_set_attack(0, 1, (1 << 0), 80, default_deformed_timer)
fakepep_set_attack(0, 2, (2 << 0), 120, default_deformed_timer)
fakepep_set_attack(0, 3, (3 << 0), 120, 500)
fakepep_set_attack(0, 4, (4 << 0), 120, default_deformed_timer)
fakepep_set_attack(0, 5, (5 << 0), 120, 700)
fakepep_set_attack(1, 0, (0 << 0), 80, 0)
fakepep_set_attack(1, 1, (1 << 0), 80, 0)
fakepep_set_attack(1, 2, (2 << 0), 120, 0)
fakepep_set_attack(1, 3, (3 << 0), 120, 0)
fakepep_set_attack(1, 4, (4 << 0), 120, 0)
fakepep_set_attack(1, 5, (5 << 0), 120, 0)
fakepep_set_attack(2, 0, (6 << 0), 0, default_deformed_timer)
fakepep_set_attack(2, 1, (6 << 0), 0, default_deformed_timer)
fakepep_set_attack(2, 2, (6 << 0), 0, default_deformed_timer)
fakepep_set_attack(2, 3, (6 << 0), 0, default_deformed_timer)
fakepep_set_attack(2, 4, (6 << 0), 0, default_deformed_timer)
fakepep_set_attack(2, 5, (6 << 0), 0, default_deformed_timer)
projectile_list = -4
fakepep_start_projectiles(0, 0)
fakepep_add_grabclone(0, 0, 1, 80)
fakepep_add_grabclone(0, 0, -1, 80)
fakepep_start_projectiles(0, 1)
fakepep_add_bodyslamclone(0, 1, 1, 70)
fakepep_add_bodyslamclone(0, 1, -1, 70)
fakepep_start_projectiles(0, 2)
fakepep_add_machclone(0, 2, 1, 30, 1)
fakepep_add_machclone(0, 2, -1, 30, 1)
fakepep_add_machclone(0, 2, 1, 30, 1)
fakepep_add_machclone(0, 2, -1, 30, 1)
fakepep_add_machclone(0, 2, 1, 30, 1)
fakepep_add_machclone(0, 2, -1, 30, 1)
fakepep_start_projectiles(0, 3)
var size = 10
var timer = 3
fakepep_add_superjumpclones(0, 3, 1, timer, size, irandom(size), 15)
fakepep_add_superjumpclones(0, 3, -1, timer, size, irandom(size), 15)
fakepep_add_superjumpclones(0, 3, 1, timer, size, irandom(size), 15)
fakepep_add_superjumpclones(0, 3, -1, timer, size, irandom(size), 15)
fakepep_add_superjumpclones(0, 3, 1, timer, size, irandom(size), 15)
fakepep_add_superjumpclones(0, 3, -1, timer, size, irandom(size), 15)
fakepep_start_projectiles(0, 4)
fakepep_add_flailingclone(0, 4, 1, 45)
fakepep_add_flailingclone(0, 4, -1, 45)
fakepep_start_projectiles(0, 5)
fakepep_add_tauntclones(0, 5, -12, -14, 80)
fakepep_add_tauntclones(0, 5, -14, -12, 80)
fakepep_add_flailingclone(0, 5, 1, 30)
fakepep_add_tauntclones(0, 5, -11, -11, 80)
fakepep_add_tauntclones(0, 5, -13, -8, 80)
fakepep_add_tauntclones(0, 5, -8, -13, 80)
fakepep_add_flailingclone(0, 5, -1, 30)
fakepep_start_projectiles(1, 0)
fakepep_add_machclone(1, 0, 1, 180, 1)
fakepep_add_machclone(1, 0, -1, 180, 1)
fakepep_start_projectiles(1, 1)
fakepep_add_bodyslamclone(1, 1, 1, 180)
fakepep_add_bodyslamclone(1, 1, -1, 180)
fakepep_start_projectiles(1, 2)
fakepep_add_machclone(1, 2, 1, 150, 1)
fakepep_add_machclone(1, 2, -1, 150, 1)
fakepep_start_projectiles(1, 3)
fakepep_add_flailingclone(1, 3, 1, 120)
fakepep_add_flailingclone(1, 3, -1, 120)
fakepep_start_projectiles(1, 4)
fakepep_add_flailingclone(1, 4, 1, 180)
fakepep_add_flailingclone(1, 4, -1, 180)
fakepep_start_projectiles(1, 5)
fakepep_add_machclone(1, 5, 1, 150, 1)
fakepep_add_machclone(1, 5, -1, 150, 1)
skipintro = 0
miniflash = 0
staggerbuffer = 0
alarm[8] = 1
pizzahead = 0
flashbuffer = 0
deformed_cooldown = 0
deformed_timer = 0
deformed_dir = 1
currentprojectile = 0
parryable = 0
playerhit = 0
introbuffer = 80
important = 1
stompable = 0
shakestun = 0
elite = 1
elitehit = 6
maxsubhp = 1
subhp = maxsubhp
prevhp = elitehit
turned = 0
bodyslam = 0
wastedhits = 0
state = (144 << 0)
sprite_index = spr_fakepeppino_intro1
introbuffer = 80
spotlightID = instance_create(x, y, obj_bossspotlight)
spotlightID.objectID = id
hitboxID = -4
headID = -4
attackspeed = 0
destroyable = 0
phase = 1
formed = 1
cooldown = 80
idle_max = 240
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
landspr = spr_fakepeppino_idle
idlespr = spr_fakepeppino_idle
fallspr = spr_fakepeppino_fall
stunfallspr = spr_fakepeppino_stun
walkspr = spr_fakepeppino_idle
turnspr = spr_fakepeppino_idle
recoveryspr = spr_fakepeppino_idle
grabbedspr = spr_fakepeppino_stun
scaredspr = spr_fakepeppino_idle
ragespr = spr_fakepeppino_idle
spr_dead = spr_fakepeppino_stun
hp = 1
slapped = 0
grounded = 1
birdcreated = 0
boundbox = 0
important = 0
heavy = 1
paletteselect = 0
spr_palette = spr_fakepeppinopalette
usepalette = 1
grabbedby = 0
stuntouchbuffer = 0
scaredbuffer = 0
dir = 1
woosh = 0
flickertime = 0
touchedground = 0
