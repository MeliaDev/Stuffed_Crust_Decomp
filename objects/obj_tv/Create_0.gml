image_speed = 0.35
chose = 0
message = ""
showtext = 0
tvprompts_list = ds_list_create()
state = (0 << 0)
promptxstart = 641
promptx = promptxstart
prompt = ""
promptspd = 1
prompt_buffer = 0
prompt_max = 150
promptsurface = surface_create(290, 102)
visualcombo = 0
tv_bg_index = 0
tv_trans = 0
panicmode = 0
tv_cooldown = 0
tv_x = (obj_screensizer.actual_width - 115)
tv_y = 80
vigimode = 0
tvxscale = 1
targetgolf = -4
special_prompts = -4
hud_posx = 0
hud_posY = 0
combo_state = 0
combo_posX = 0
combo_vsp = 0
combo_posY = 0
combofill_x = 0
combofill_y = 0
combofill_index = 0
noisemax = 6
noisebuffer = noisemax
expressionsprite = -4
expressionbuffer = 0
golfsurf = -4
tvsprite = spr_tv_idle
sprite_index = spr_tv_off
bubbleindex = 0
bubblespr = -4
idleanim = 180
noisesprite = spr_noiseHUD_idle
pizzahealth = 0
xi = 500
yi = 600
imageindexstore = 0
once = 0
global.hurtcounter = 0
global.hurtmilestone = 3
alpha = 1
shownranka = 0
shownrankb = 0
shownrankc = 0
collect_shake = 0
global.srank = 0
global.arank = 0
global.brank = 0
global.crank = 0
character = "PEPPINO"
chunkmax = 0
timer_xplus = -153
timer_yplus = -76
timer_xstart = ((obj_screensizer.actual_width / 2) + timer_xplus)
timer_ystart = (obj_screensizer.actual_height + timer_yplus)
timer_x = timer_xstart
timer_y = (timer_ystart + 212)
timer_tower = 0
pizzaface_sprite = spr_timer_pizzaface1
pizzaface_index = 0
johnface_sprite = spr_timer_johnface
johnface_index = 0
hand_sprite = spr_timer_hand1
hand_index = 0
watcher_xplus = 264
watcher_yplus = 96
watcher_xstart = ((obj_screensizer.actual_width / 2) - (watcher_xplus / 2))
watcher_ystart = (obj_screensizer.actual_height - watcher_yplus)
watcher_yamt = watcher_yplus
watcher_x = watcher_xstart
watcher_y = (watcher_ystart + watcher_yplus)
watcher_sprite = spr_pizzawatcher_idle
watcher_index = 0
bar_surface = -4
barfill_x = 0
showtime_buffer = 0
indexinc = 0.35
tv_bg_sprite = spr_tv_bgfinal
tv_bg_shadow = 4399
isgustavo = 0
drawing = 0
bgsprite = spr_gate_entranceBG
prevbgsprite = bgsprite
newbgsprite = bgsprite
bgspriteswitch = 0
resetbg = 0
dotransition = 0
parrallaxspeedshit = 1
scr_hub_bg_init(parrallaxspeedshit, 1)
