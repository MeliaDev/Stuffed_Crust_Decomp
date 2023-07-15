depth = 50
event_inherited()
if (obj_player1.character == "V")
    tv_do_expression(3189)
else if (obj_player1.character == "N" || (!obj_player1.ispeppino))
    tv_do_expression(4250)
else
    tv_do_expression(971)
image_speed = 0.35
yoffset = 0
hsp = 0
vsp = 0
grav = 0.23
movespeed = 3
panic = 0
playerid = 530
state = (0 << 0)
spr_intro = sprite_index
spr_run = sprite_index
spr_idle = sprite_index
spr_panic = sprite_index
spr_taunt = sprite_index
spr_intro_strongcold = sprite_index
spr_run_strongcold = sprite_index
spr_idle_strongcold = sprite_index
xprev = x
yprev = y
showtext = 0
