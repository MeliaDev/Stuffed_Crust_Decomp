/*
WARNING: Recursive script decompilation (for member variable name resolution) failed for magnitude

System.InvalidOperationException: Stack empty.
   at System.Collections.Generic.Stack`1.ThrowForEmptyStack()
   at System.Collections.Generic.Stack`1.Pop()
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block, List`1 tempvars, Stack`1 workQueue) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2152
   at UndertaleModLib.Decompiler.DecompileFromBlock(DecompileContext context, Dictionary`2 blocks, Block block) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2652
   at UndertaleModLib.Decompiler.<DecompileFromBlock>g__FindActualNameForAnonymousCodeObject|30_2(DecompileContext context, UndertaleCode anonymousCodeObject) in D:\a\UndertaleModTool\UndertaleModTool\UndertaleModLib\Decompiler\Decompiler.cs:line 2428
*/
prevhsp = hsp
prevmove = move
prevmovespeed = movespeed
previcemovespeed = icemovespeed
prevxscale = xscale
if (key_shoot2 && (shotgunAnim || global.pistol))
    input_buffer_shoot = 10
if key_slap2
    input_buffer_slap = 12
if key_jump
    input_buffer_jump = 15
if (grounded && vsp > 0)
    coyote_time = 10
if (vsp < 0)
    coyote_time = 0
if (grounded && golfdashbuffer > 0)
    golfdashbuffer = 0
if (sprite_index == spr_entergate)
{
    if (character == "N" || (character == "P" && ispeppino == 0))
    {
        if (image_index == 12)
            fmod_event_one_shot_3d("event:/sfx/noise/woag", x, y)
    }
    else if (image_index == 22)
        fmod_event_one_shot_3d("event:/sfx/voice/myea", x, y)
}
if (global.combotime > 60)
    global.combotime = 60
if (state != (187 << 0) && state != (203 << 0) && ramp_buffer <= 0)
{
    if (payoutramp == 0 && ramp_points > 0)
    {
        fmod_event_one_shot_3d("event:/sfx/misc/kashing", x, y)
        instance_create(x, y, obj_trickjump_notif)
        fmod_event_one_shot("event:/stuffed/sfx/jetset/end")
        var ramppay = (ramp_points * 100)
        if (ramp_points > 20)
            ramppay = 2000
        payoutramp = 1
        global.collect += ramppay
        global.combotime += 30
    }
}
if payoutramp
{
    if (ramp_points > 0)
    {
        if (!global.panic)
        {
            if (character == "P" && ispeppino)
                create_collect((x + (sprite_width / 2)), (y + (sprite_height / 2)), choose(2083, 2084, 2087, 2944, 3559), round((ramp_points * 100)))
            else if (character == "N" || (character == "P" && ispeppino == 0))
                create_collect((x + (sprite_width / 2)), (y + (sprite_height / 2)), choose(2082, 2079, 2079), round((ramp_points * 100)))
            else
                create_collect((x + (sprite_width / 2)), (y + (sprite_height / 2)), choose(2083, 2084, 2087, 2944, 3559), round((ramp_points * 100)))
        }
        else if global.panic
            create_collect((x + (sprite_width / 2)), (y + (sprite_height / 2)), 3220, round((ramp_points * 100)))
        else
            create_collect((x + (sprite_width / 2)), (y + (sprite_height / 2)), choose(2083, 2084, 2087, 2944, 3559), round((ramp_points * 100)))
        ramp_points -= 1
        if (ramp_points <= 0)
            ramp_points = 0
    }
    else
        payoutramp = 0
}
can_jump = ((grounded && vsp > 0) || (coyote_time && vsp > 0))
var prevmask = mask_index
if (state != (79 << 0))
    swingdingthrow = 0
collision_flags = 0
if (place_meeting(x, y, obj_secretportal) || place_meeting(x, y, obj_secretportalstart))
    collision_flags |= (1 << 0)
if scr_solid(x, (y + 1))
    collision_flags |= (4 << 0)
if place_meeting(x, (y + 1), obj_slope)
    collision_flags |= (2 << 0)
switch state
{
    case (0 << 0):
        scr_player_normal()
        break
    case (1 << 0):
        scr_player_revolver()
        break
    case (2 << 0):
        scr_player_dynamite()
        break
    case (3 << 0):
        scr_player_boots()
        break
    case (4 << 0):
        scr_player_grabbed()
        break
    case (6 << 0):
        scr_player_finishingblow()
        break
    case (5 << 0):
        scr_player_tumble()
        break
    case (18 << 0):
        scr_player_titlescreen()
        break
    case (7 << 0):
        scr_player_ejected()
        break
    case (10 << 0):
        scr_player_firemouth()
        break
    case (9 << 0):
        scr_player_fireass()
        break
    case (8 << 0):
        scr_player_transitioncutscene()
        break
    case (19 << 0):
        scr_playerN_hookshot()
        break
    case (23 << 0):
        scr_player_slap()
        break
    case (20 << 0):
        scr_player_tacklecharge()
        break
    case (24 << 0):
        scr_player_cheesepep()
        break
    case (26 << 0):
        scr_player_cheesepepjump()
        break
    case (27 << 0):
        scr_player_cheesepepfling()
        break
    case (21 << 0):
        scr_player_cheeseball()
        break
    case (22 << 0):
        scr_player_cheeseballclimbwall()
        break
    case (29 << 0):
        scr_player_cheesepepstickside()
        break
    case (30 << 0):
        scr_player_cheesepepstickup()
        break
    case (25 << 0):
        scr_player_cheesepepstick()
        break
    case (28 << 0):
        scr_player_cheesepeplaunch()
        break
    case (33 << 0):
        scr_player_boxxedpep()
        break
    case (35 << 0):
        scr_player_boxxedpepjump()
        break
    case (34 << 0):
        scr_player_boxxedpepspin()
        break
    case (36 << 0):
        scr_player_pistolaim()
        break
    case (37 << 0):
        scr_player_climbwall()
        break
    case (38 << 0):
        scr_player_knightpepslopes()
        break
    case (39 << 0):
        scr_player_portal()
        break
    case (40 << 0):
        scr_player_secondjump()
        break
    case (41 << 0):
        scr_player_chainsawbump()
        break
    case (42 << 0):
        scr_player_handstandjump()
        break
    case (43 << 0):
        scr_player_lungeattack()
        break
    case (44 << 0):
        scr_player_lungegrab()
        break
    case (45 << 0):
        scr_player_dashtumble()
        break
    case (153 << 0):
        scr_player_shoulderbash()
        break
    case (46 << 0):
        scr_player_gottreasure()
        break
    case (47 << 0):
        scr_player_knightpep()
        break
    case (48 << 0):
        scr_player_knightpepattack()
        break
    case (49 << 0):
        scr_player_knightpepbump()
        break
    case (50 << 0):
        scr_player_meteorpep()
        break
    case (51 << 0):
        scr_player_bombpep()
        break
    case (54 << 0):
        scr_player_bombpepup()
        break
    case (53 << 0):
        scr_player_bombpepside()
        break
    case (52 << 0):
        scr_player_bombgrab()
        break
    case (55 << 0):
        scr_player_grabbing()
        break
    case (56 << 0):
        scr_player_chainsawpogo()
        break
    case (57 << 0):
        scr_player_shotgunjump()
        break
    case (59 << 0):
        scr_player_stunned()
        break
    case (60 << 0):
        scr_player_highjump()
        break
    case (61 << 0):
        scr_player_chainsaw()
        break
    case (137 << 0):
        scr_player_hit()
        break
    case (156 << 0):
        scr_player_thrown()
        break
    case (62 << 0):
        scr_player_facestomp()
        break
    case (64 << 0):
        scr_player_timesup()
        break
    case (65 << 0):
        scr_player_machroll()
        break
    case (72 << 0):
        scr_player_pistol()
        break
    case (66 << 0):
        scr_player_shotgun()
        break
    case (67 << 0):
        scr_player_shotguncrouch()
        break
    case (68 << 0):
        scr_player_shotguncrouchjump()
        break
    case (69 << 0):
        scr_player_shotgunshoot()
        break
    case (71 << 0):
        scr_player_shotgunfreefall()
        break
    case (70 << 0):
        scr_player_shotgundash()
        break
    case (73 << 0):
        scr_player_machfreefall()
        break
    case (74 << 0):
        state_player_throwing()
        break
    case (76 << 0):
        scr_player_superslam()
        break
    case (75 << 0):
        scr_player_slam()
        break
    case (77 << 0):
        scr_player_skateboard()
        break
    case (78 << 0):
        scr_player_grind()
        break
    case (79 << 0):
        scr_player_grab()
        break
    case (80 << 0):
        scr_player_punch()
        break
    case (81 << 0):
        scr_player_backkick()
        break
    case (82 << 0):
        scr_player_uppunch()
        break
    case (83 << 0):
        scr_player_shoulder()
        break
    case (84 << 0):
        scr_player_backbreaker()
        break
    case (85 << 0):
        scr_player_graffiti()
        break
    case (86 << 0):
        scr_player_bossdefeat()
        break
    case (88 << 0):
        scr_player_bossintro()
        break
    case (96 << 0):
        scr_player_smirk()
        break
    case (87 << 0):
        scr_player_pizzathrow()
        break
    case (89 << 0):
        scr_player_gameover()
        break
    case (123 << 0):
        scr_player_Sjumpland()
        break
    case (122 << 0):
        scr_player_freefallprep()
        break
    case (120 << 0):
        scr_player_runonball()
        break
    case (118 << 0):
        scr_player_boulder()
        break
    case (90 << 0):
        scr_player_keyget()
        break
    case (91 << 0):
        scr_player_tackle()
        break
    case (94 << 0):
        scr_player_slipnslide()
        break
    case (93 << 0):
        scr_player_ladder()
        break
    case (92 << 0):
        scr_player_jump()
        break
    case (98 << 0):
        scr_player_victory()
        break
    case (95 << 0):
        scr_player_comingoutdoor()
        break
    case (97 << 0):
        scr_player_Sjump()
        break
    case (99 << 0):
        scr_player_Sjumpprep()
        break
    case (100 << 0):
        scr_player_crouch()
        break
    case (101 << 0):
        scr_player_crouchjump()
        break
    case (102 << 0):
        scr_player_crouchslide()
        break
    case (103 << 0):
        scr_player_mach1()
        break
    case (104 << 0):
        scr_player_mach2()
        break
    case (121 << 0):
        scr_player_mach3()
        break
    case (105 << 0):
        scr_player_machslide()
        break
    case (106 << 0):
        scr_player_bump()
        break
    case (107 << 0):
        scr_player_hurt()
        break
    case (108 << 0):
        scr_player_freefall()
        break
    case (111 << 0):
        scr_player_freefallland()
        break
    case (109 << 0):
        scr_player_hang()
        break
    case (112 << 0):
        scr_player_door()
        break
    case (113 << 0):
        scr_player_barrel()
        break
    case (114 << 0):
        scr_player_barreljump()
        break
    case (116 << 0):
        scr_player_barrelslide()
        break
    case (115 << 0):
        scr_player_barrelclimbwall()
        break
    case (117 << 0):
        scr_player_current()
        break
    case (119 << 0):
        scr_player_taxi()
        break
    case (152 << 0):
        scr_player_taxi()
        break
    case (58 << 0):
        scr_player_pogo()
        break
    case (31 << 0):
        scr_player_rideweenie()
        break
    case (32 << 0):
        scr_player_motorcycle()
        break
    case (124 << 0):
        scr_player_faceplant()
        break
    case (16 << 0):
        scr_player_ghost()
        break
    case (17 << 0):
        scr_player_ghostpossess()
        break
    case (11 << 0):
        scr_player_mort()
        break
    case (12 << 0):
        scr_player_mortjump()
        break
    case (13 << 0):
        scr_player_mortattack()
        break
    case (14 << 0):
        scr_player_morthook()
        break
    case (15 << 0):
        scr_player_hook()
        break
    case (144 << 0):
        scr_player_arenaintro()
        break
    case (146 << 0):
        scr_player_actor()
        break
    case (147 << 0):
        scr_player_parry()
        break
    case (148 << 0):
        scr_player_golf()
        break
    case (150 << 0):
        scr_player_tube()
        break
    case (154 << 0):
        scr_player_pummel()
        break
    case (165 << 0):
        scr_player_slipbanan()
        break
    case (183 << 0):
        scr_player_bombdelete()
        break
    case (184 << 0):
        scr_player_rocket()
        break
    case (185 << 0):
        scr_player_rocketslide()
        break
    case (186 << 0):
        scr_player_gotoplayer()
        break
    case (187 << 0):
        scr_player_trickjump()
        break
    case (190 << 0):
        scr_player_ridecow()
        break
    case (191 << 0):
        scr_player_ratmount()
        break
    case (196 << 0):
        scr_player_ratmounthurt()
        break
    case (192 << 0):
        scr_player_ratmountjump()
        break
    case (193 << 0):
        scr_player_ratmountattack()
        break
    case (194 << 0):
        scr_player_ratmountspit()
        break
    case (195 << 0):
        scr_player_ratmountclimbwall()
        break
    case (197 << 0):
        scr_player_ratmountgroundpound()
        break
    case (198 << 0):
        scr_player_ratmountbounce()
        break
    case (200 << 0):
        scr_player_ratmountballoon()
        break
    case (202 << 0):
        scr_player_ratmountgrind()
        break
    case (201 << 0):
        scr_player_ratmounttumble()
        break
    case (259 << 0):
        scr_player_ratmountpunch()
        break
    case (203 << 0):
        scr_player_ratmounttrickjump()
        break
    case (204 << 0):
        scr_player_ratmountskid()
        break
    case (206 << 0):
        scr_player_blockstance()
        break
    case (207 << 0):
        scr_player_balloon()
        break
    case (208 << 0):
        scr_player_debugstate()
        break
    case (210 << 0):
        scr_player_trashjump()
        break
    case (211 << 0):
        scr_player_trashroll()
        break
    case (212 << 0):
        scr_player_stringfling()
        break
    case (213 << 0):
        scr_player_stringjump()
        break
    case (214 << 0):
        scr_player_stringfall()
        break
    case (215 << 0):
        scr_player_noisejetpack()
        break
    case (216 << 0):
        scr_player_spiderweb()
        break
    case (225 << 0):
        scr_player_animatronic()
        break
    case (252 << 0):
        scr_player_playersuperattack()
        break
    case (254 << 0):
        scr_player_jetpackjump()
        break
    case (257 << 0):
        scr_player_bee()
        break
    case (260 << 0):
        scr_player_ratmountcrouch()
        break
    case (261 << 0):
        scr_player_ratmountladder()
        break
    case (265 << 0):
        scr_player_antigrav()
        break
    case (270 << 0):
        scr_player_estampede()
        break
    case (290 << 0):
        scr_player_backtohub()
        break
    case (293 << 0):
        scr_player_animation()
        break
    case (262 << 0):
        scr_player_supergrab()
        break
}

if (state != (61 << 0))
{
    if (!bodyslam_notif)
    {
        if (state == (108 << 0))
        {
            bodyslam_notif = 1
            notification_push((0 << 0), [room])
        }
    }
    else if (state != (108 << 0))
    {
        bodyslam_notif = 0
        notification_push((1 << 0), [room])
    }
}
if (state != (101 << 0) && state != (100 << 0))
    uncrouch = 0
else if (state == (100 << 0) && uncrouch > 0)
    uncrouch--
if (state == (97 << 0) || (state == (61 << 0) && tauntstoredstate == (97 << 0)))
    sjumptimer++
else if (sjumptimer > 0)
{
    notification_push((42 << 0), [sjumptimer, room])
    sjumptimer = 0
}
if (invtime > 0)
    invtime--
if (knightmiddairstop > 0)
    knightmiddairstop--
if (sprite_index == spr_noise_phasetrans1P && image_index > 24)
{
    if (!noisebossscream)
    {
        fmod_event_one_shot_3d("event:/sfx/pep/screamboss", x, y)
        fmod_event_one_shot_3d("event:/sfx/voice/noisescream", obj_noiseboss.x, obj_noiseboss.y)
        noisebossscream = 1
    }
}
else if (sprite_index != spr_noise_phasetrans1P)
    noisebossscream = 0
if (global.pistol && state != (293 << 0) && state != (146 << 0) && state != (107 << 0) && state != (106 << 0) && (!instance_exists(obj_vigilante_duelintro)))
{
    if (key_shoot || pistolchargeshooting)
        pistolcharge += 0.5
    else
    {
        pistolcharge = 0
        pistolchargeshot = 1
    }
    if (pistolcharge > 0)
    {
        var ixa = [6, 14, 22, 30, 38]
        var _sound = 0
        for (var i = 0; i < array_length(ixa); i++)
        {
            if (floor(pistolcharge) == ixa[i])
                _sound = ground_boundtitrle_cardd
        }
        if (_sound && (!pistolchargesound))
        {
            pistolchargesound = ground_boundtitrle_cardd
            fmod_event_one_shot_3d("event:/sfx/pep/revolvercharge", x, y)
        }
        else if (!_sound)
            pistolchargesound = 0
    }
    if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 1))
        pistolcharge = (sprite_get_number(spr_revolvercharge) - 1)
    if (floor(pistolcharge) >= (sprite_get_number(spr_revolvercharge) - 16) && (!pistolchargeshooting))
    {
        pistolchargeshooting = 1
        pistolchargeshot = 1
    }
    if (pistolchargeshot > 0 && pistolchargeshooting)
    {
        if (state != (84 << 0) && state != (61 << 0))
        {
            scr_pistolshoot((0 << 0))
            pistolchargedelay = 5
            pistolchargeshot--
        }
    }
    else if (pistolchargeshot <= 0 && pistolchargeshooting)
    {
        pistolcharge = 0
        pistolchargedelay = 5
        pistolchargeshooting = 0
        pistolchargeshot = 1
        if key_slap
            pistolcharge = 4
    }
}
else if (state == (107 << 0) || state == (106 << 0) || instance_exists(obj_vigilante_duelintro))
{
    pistolcharge = 0
    pistolcharged = 0
    pistolchargeshooting = 0
    pistolchargeshot = 1
}
if (pistolanim != -4)
{
    pistolindex += 0.35
    if ((!machslideAnim) && state != (105 << 0))
    {
        sprite_index = pistolanim
        image_index = pistolindex
    }
    if (floor(pistolindex) == (sprite_get_number(pistolanim) - 1))
    {
        pistolanim = -4
        pistolindex = 0
    }
}
if (pistolcooldown > 0)
    pistolcooldown--
if (prevstate != state)
{
    if (prevstate == (211 << 0) && state != (61 << 0) && prevsprite != 2313 && prevsprite != 2191)
        create_debris(x, y, 3377)
    if (prevstate == (16 << 0) && state != (61 << 0))
        instance_create(x, y, obj_ghostdrapes)
}
if (!(place_meeting(x, (y + 1), obj_railparent)))
{
    if (state == (121 << 0) || state == (104 << 0) || state == (5 << 0))
        railmovespeed = Approach(railmovespeed, 0, 0.1)
    else
        railmovespeed = Approach(railmovespeed, 0, 0.5)
}
if (state != (42 << 0) && state != (5 << 0))
    crouchslipbuffer = 0
if (state != (121 << 0) && (state != (61 << 0) || tauntstoredstate != (121 << 0)))
    mach4mode = 0
if (state != (225 << 0))
{
    animatronic_buffer = 180
    animatronic_collect_buffer = 0
}
if (state == (33 << 0) && grounded && vsp > 0)
    boxxedpepjump = boxxedpepjumpmax
if (verticalbuffer > 0)
    verticalbuffer--
if (state != (47 << 0) && state != (48 << 0) && state != (49 << 0) && state != (38 << 0) && state != (207 << 0) && state != (54 << 0) && state != (53 << 0))
{
    if (!scr_slope())
        angle = Approach(angle, 0, 8)
    else if (!(place_meeting(x, (y + 1), obj_solid)))
    {
        with (instance_place(x, (y + 1), obj_slope))
        {
            if (abs(image_yscale) < abs(image_xscale))
            {
                if (sign(image_xscale) == 1)
                    other.angle = Approach(other.angle, 24, 8)
                else
                    other.angle = Approach(other.angle, -24, 8)
            }
            else if (sign(image_xscale) == 1)
                other.angle = Approach(other.angle, 32, 8)
            else
                other.angle = Approach(other.angle, -32, 8)
        }
    }
    else
        angle = Approach(angle, 0, 8)
}
else
    angle = 0
if (superchargecombo_buffer > 0)
    superchargecombo_buffer--
else if (superchargecombo_buffer == 0)
{
    superchargecombo_buffer = -1
    global.combotime = 4
}
if (state != (0 << 0))
    breakdance_speed = 0.25
if (holycross > 0)
    holycross--
if global.noisejetpack
{
    if (jetpackeffect > 0)
        jetpackeffect--
    else
    {
        jetpackeffect = 100
        repeat (10)
            instance_create(x, y, obj_firemouthflame)
    }
}
if ((state == (92 << 0) || state == (0 << 0) || state == (104 << 0) || state == (121 << 0) || state == (187 << 0)) && global.noisejetpack == 1)
{
    if (((!can_jump) && key_jump) || (grounded && key_jump && key_up))
    {
        fmod_event_instance_play(pizzapeppersnd)
        scr_fmod_soundeffect(jumpsnd, x, y)
        fmod_event_instance_set_parameter(pizzapeppersnd, "state", 0, 1)
        if key_down
            vsp = 0
        else
            vsp = -11
        if (move != 0)
        {
            if (movespeed < 10)
                movespeed = 10
        }
        with (instance_create(x, y, obj_highjumpcloud2))
            sprite_index = spr_player_firemouthjumpdust
        scr_do_pepperpizzajump()
    }
}
if (walljumpbuffer > 0)
    walljumpbuffer--
if (grounded && vsp > 0 && state != (215 << 0))
    jetpackfuel = jetpackmax
if tauntstoredisgustavo
{
    isgustavo = 1
    if (state != (84 << 0) && state != (147 << 0) && state != (85 << 0))
        tauntstoredisgustavo = 0
}
if (state != (121 << 0) && (state != (105 << 0) || sprite_index != spr_mach3boost))
{
    launch = 0
    launched = 0
    launch_buffer = 0
}
if (launch_buffer > 0)
    launch_buffer--
else
    launched = 0
if (state != (6 << 0))
    finishingblow = 0
if (dash_doubletap > 0)
    dash_doubletap--
if (cow_buffer > 0)
    cow_buffer--
if (state == (43 << 0))
    lunge_buffer = 14
if (blur_effect > 0)
    blur_effect--
else if (breakdance_speed >= 0.6 || (state == (165 << 0) && sprite_index == spr_rockethitwall) || mach4mode == 1 || boxxeddash == 1 || state == (16 << 0) || state == (5 << 0) || state == (198 << 0) || state == (193 << 0) || state == (42 << 0) || state == (116 << 0) || (state == (79 << 0) && sprite_index == spr_swingding && swingdingdash <= 0) || state == (108 << 0) || state == (43 << 0))
{
    if (visible && (collision_flags & (1 << 0)) == 0)
    {
        blur_effect = 2
        with (create_blur_afterimage(x, y, sprite_index, (image_index - 1), xscale))
            playerid = other.id
    }
}
if (state != (61 << 0) && state != (106 << 0) && state != (33 << 0) && state != (34 << 0) && state != (35 << 0))
{
    boxxed = 0
    boxxeddash = 0
}
if (state != (79 << 0))
    grabbingenemy = 0
if (state != (104 << 0) && state != (121 << 0) && state != (187 << 0) && state != (201 << 0) && state != (203 << 0))
{
    ramp = 0
    ramp_points = 0
}
if (state != (112 << 0) && state != (61 << 0) && state != (137 << 0) && place_meeting(x, y, obj_boxofpizza))
    state = (100 << 0)
if (shoot_buffer > 0)
    shoot_buffer--
if (cheesepep_buffer > 0)
    cheesepep_buffer--
if (state != (29 << 0))
    yscale = 1
if (invhurt_buffer > 0)
    invhurt_buffer--
if (state == (107 << 0))
{
    if (hurt_buffer > 0)
        hurt_buffer--
    else
    {
        invhurt_buffer = invhurt_max
        hurt_buffer = -1
    }
}
else
{
    if (hurt_buffer > 0)
        invhurt_buffer = invhurt_max
    hurt_buffer = -1
}
if ((room == Realtitlescreen && instance_exists(obj_mainmenuselect)) || room == Mainmenu || room == Longintro || room == Endingroom || room == Creditsroom || room == Johnresurrectionroom)
    state = (18 << 0)
if (wallclingcooldown < 10)
    wallclingcooldown++
if (boxxedspinbuffer > 0)
    boxxedspinbuffer--
if (supercharged && (collision_flags & (1 << 0)) == 0)
{
    if (superchargebuffer > 0)
        superchargebuffer--
    else if (state == (0 << 0) || state == (92 << 0) || state == (103 << 0) || state == (104 << 0) || state == (121 << 0) || state == (191 << 0) || state == (192 << 0) || state == (198 << 0) || state == (204 << 0))
    {
        superchargebuffer = 4
        with (instance_create((x + irandom_range(-25, 25)), (y + irandom_range(-10, obj_pf_fakepep)), obj_superchargeeffect))
            playerid = other.id
    }
}
if (state != (97 << 0))
    sjumpvsp = -12
if (state != (108 << 0))
    freefallvsp = 20
if (supercharge > 9 && state != (84 << 0))
{
    if (!supercharged)
    {
        ini_open_from_string(obj_savesystem.ini_str)
        if (ini_read_real("Game", "supertaunt", 0) == 0)
            create_transformation_tip(lang_get_value("supertaunttip"))
        ini_close()
        fmod_event_one_shot("event:/sfx/pep/gotsupertaunt")
    }
    supercharged = 1
}
if ((!instance_exists(pizzashieldid)) && pizzashield == 1)
{
    with (instance_create(x, y, obj_pizzashield))
    {
        playerid = other.object_index
        other.pizzashieldid = id
    }
}
if (visible == false && state == (95 << 0))
{
    coopdelay++
    image_index = 0
    if (coopdelay == 50)
    {
        visible = true
        coopdelay = 0
    }
}
if (global.coop == 1)
{
    if ((state == (80 << 0) || state == (42 << 0)) && (!((obj_player2.state == (80 << 0) || obj_player2.state == (42 << 0)))))
        fightballadvantage = 1
    else if (!((obj_player2.state == (80 << 0) || obj_player2.state == (42 << 0))))
        fightballadvantage = 0
}
if (state != (58 << 0) && state != (84 << 0))
{
    pogospeed = 6
    pogospeedprev = 0
}
scr_playersounds()
if (state != (121 << 0) && state != (4 << 0))
    fightball = 0
if (state != (4 << 0) && state != (107 << 0))
{
    if (grounded && state != (55 << 0))
        suplexmove = 0
}
if (state != (108 << 0) && state != (111 << 0) && state != (76 << 0) && (state != (61 << 0) || (tauntstoredstate != (108 << 0) && tauntstoredstate != (76 << 0))) && (state != (84 << 0) || (tauntstoredstate != (108 << 0) && tauntstoredstate != (76 << 0))))
    freefallsmash = -14
if (global.playerhealth <= 0 && state != (89 << 0))
{
    image_index = 0
    sprite_index = spr_playerV_dead
    state = (89 << 0)
}
if (state == (89 << 0) && y > (room_height * 2) && (!instance_exists(obj_backtohub_fadeout)))
{
    targetDoor = "HUB"
    scr_playerreset()
    if (global.coop == 1)
    {
        with (obj_player2)
        {
            scr_playerreset()
            targetDoor = "HUB"
        }
    }
    with (obj_player1)
    {
        image_index = 0
        image_blend = c_white
        visible = true
    }
    instance_create(0, 0, obj_backtohub_fadeout)
    global.leveltorestart = -4
    global.leveltosave = -4
    global.startgate = 0
}
if (baddiegrabbedID == 741 && (state == (79 << 0) || state == (76 << 0) || state == (20 << 0)))
    state = (0 << 0)
if (cutscene == 1 && state != (186 << 0))
    global.heattime = 60
if (anger == 0)
    angry = 0
if (anger > 0)
{
    angry = 1
    anger -= 1
}
if ((sprite_index == spr_winding || sprite_index == spr_lonegustavo_grabbable || sprite_index == spr_player_ratmounttumble) && state != (0 << 0) && state != (191 << 0))
    windingAnim = 0
if (state != (79 << 0))
    swingdingbuffer = 0
if (state == (265 << 0) || state == (184 << 0) || state == (185 << 0))
    grav = 0
else if (state == (113 << 0))
    grav = 0.6
else if (state == (16 << 0) || state == (17 << 0))
    grav = 0
else if boxxed
    grav = 0.3
else if (sprite_index == spr_player_jetpackstart2 || sprite_index == spr_playerN_noisebombspinjump)
    grav = 0.4
else if (sprite_index == spr_playerN_glide)
    grav = 0.2
else if (sprite_index == spr_snick_dropdash)
{
    grav = 0.4
    grav += 0.1
}
else if (character == "S")
    grav = 0.4
else if (state == (34 << 0))
    grav = 0.6
else
    grav = 0.5
if (state == (113 << 0) && key_jump2 && (!jumpstop))
    grav = 0.4
if (sprite_index == spr_player_idlevomit && image_index > 28 && image_index < 43)
    instance_create((x + random_range(-5, obj_lightsource)), (y + 46), obj_vomit)
if (sprite_index == spr_player_idlevomitblood && image_index > 28 && image_index < 43)
{
    with (instance_create((x + random_range(-5, obj_lightsource)), (y + 46), obj_vomit))
        sprite_index = spr_vomit2
}
if (global.combo >= 25 && (!instance_exists(angryeffectid)) && state == (0 << 0) && character != "V")
{
    with (instance_create(x, y, obj_angrycloud))
    {
        playerid = other.object_index
        other.angryeffectid = id
    }
}
if (object_index == obj_player1)
{
    if (global.combotimepause > 0)
        global.combotimepause--
    if (global.combo != global.previouscombo && (!is_bossroom()))
    {
        if (global.combo > global.highest_combo)
            global.highest_combo = global.combo
        global.previouscombo = global.combo
        if ((global.combo % 5) == 0 && global.combo != 0)
        {
            instance_destroy(obj_combotitle)
            with (instance_create(x, (y - 120), obj_combotitle))
            {
                title = floor((global.combo / 5))
                event_perform(ev_step, ev_step_normal)
            }
        }
    }
    if (!((state == (112 << 0) || state == (297 << 0) || state == (66 << 0) || state == (150 << 0) || state == (292 << 0) || state == (119 << 0) || state == (46 << 0) || state == (98 << 0) || state == (46 << 0) || state == (146 << 0) || state == (95 << 0) || (state == (187 << 0) && sprite_index != spr_trickjump) || (state == (203 << 0) && sprite_index == spr_player_ratmountsupertaunt) || (state == (47 << 0) && (sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder)) || instance_exists(obj_fadeout) || instance_exists(obj_doortransition) || instance_exists(obj_doortransition2) || (collision_flags & (1 << 0)) > 0)))
    {
        if (room != forest_G1b && global.combotime > 0 && global.combotimepause <= 0)
            global.combotime -= 0.15
    }
    if (global.heattime > 0)
        global.heattime -= 0.15
    if (global.combotime <= 0 && global.combo >= 1)
    {
        if (global.combo >= 1)
            fmod_event_one_shot("event:/sfx/misc/kashingcombo")
        global.savedcombo = global.combo
        global.combotime = 0
        global.combo = 0
        supercharge = 0
    }
    var theroomname = room_get_name(room)
    if (string_pos("secret", theroomname) != 0)
    {
        if (global.heattime <= 0 && global.style > -1 && global.stylelock == 0 && global.combotimepause <= 0)
        {
            if (move == 0)
                global.style -= 0.25
            else
                global.style -= 0.15
        }
    }
}
if (key_jump && (!grounded) && (state == (104 << 0) || state == (121 << 0)) && (state != ((37 << 0) & walljumpbuffer)) <= 0)
    input_buffer_walljump = 24
if (boxxeddashbuffer > 0)
    boxxeddashbuffer--
if (coyote_time > 0)
    coyote_time--
if (input_buffer_jump > 0)
    input_buffer_jump--
if (input_buffer_jump_negative > 0)
    input_buffer_jump_negative--
if (input_buffer_secondjump < 8)
    input_buffer_secondjump++
if (input_buffer_highjump < 8)
    input_buffer_highjump++
if (input_attack_buffer > 0)
    input_attack_buffer--
if (input_buffer_shoot > 0)
    input_buffer_shoot--
if (input_finisher_buffer > 0)
    input_finisher_buffer--
if (input_up_buffer > 0)
    input_up_buffer--
if (input_down_buffer > 0)
    input_down_buffer--
if (input_buffer_walljump > 0)
    input_buffer_walljump--
if (input_buffer_slap > 0)
    input_buffer_slap--
if (key_particles == 1)
    create_particle((x + random_range(-25, 25)), (y + random_range(-35, 25)), (10 << 0), 0)
if (state != (191 << 0) && state != (192 << 0) && state != (61 << 0))
{
    gustavodash = 0
    ratmount_movespeed = 8
}
if (inv_frames == 0 && hurted == 0 && state != (16 << 0))
    image_alpha = 1
if ((state == (80 << 0) && sprite_index != spr_player_kungfuattackstance) || (state == (92 << 0) && sprite_index == spr_playerN_noisebombspinjump) || sprite_index == spr_playerV_dive || sprite_index == spr_playerV_divekick || sprite_index == spr_playerV_divekickstart || sprite_index == spr_player_crouchslidestart || sprite_index == spr_player_crouchslide || sprite_index == spr_playerN_tackle || sprite_index == spr_playerN_backkick || sprite_index == spr_player_airattack || sprite_index == spr_snick_altjump || sprite_index == spr_snick_dropdash || sprite_index == spr_snick_jump || sprite_index == spr_mach2jump || sprite_index == spr_snick_spindash || sprite_index == spr_player_slapdash || sprite_index == spr_realpunch || sprite_index == spr_jumpdive1 || sprite_index == spr_clown || sprite_index == spr_clownjump || sprite_index == spr_clownfall || state == (20 << 0) || state == (77 << 0) || (state == (47 << 0) && sprite_index != spr_knightpep_idle && sprite_index != spr_knightpep_walk && sprite_index != spr_knightpepjumpstart && sprite_index != spr_knightpepjump && sprite_index != spr_knightpepfall && sprite_index != spr_knightpepland) || state == (24 << 0) || state == (38 << 0) || state == (48 << 0) || state == (51 << 0) || state == (62 << 0) || state == (73 << 0) || state == (62 << 0) || state == (121 << 0) || state == (108 << 0) || state == (97 << 0))
    attacking = 1
else
    attacking = 0
if (character != "V" && character != "S")
{
    if (state == (74 << 0) || state == (81 << 0) || state == (83 << 0) || state == (82 << 0))
        grabbing = 1
}
else
    grabbing = 0
if ((state == (198 << 0) && vsp >= 0) || sprite_index == spr_player_crouchslidestart || sprite_index == spr_player_crouchslide || sprite_index == spr_playerN_tackle || sprite_index == spr_playerN_backkick || sprite_index == spr_player_airattack || sprite_index == spr_snick_altjump || sprite_index == spr_snick_dropdash || sprite_index == spr_snick_jump || sprite_index == spr_mach2jump || sprite_index == spr_snick_spindash || sprite_index == spr_superjumpcancel || sprite_index == spr_player_slapdash || sprite_index == spr_playerV_dive || sprite_index == spr_playerV_divekick || sprite_index == spr_playerV_divekickstart || sprite_index == spr_realpunch || sprite_index == spr_jumpdive1 || sprite_index == spr_swingding || sprite_index == spr_tumble || state == (34 << 0) || sprite_index == spr_clown || sprite_index == spr_clownjump || sprite_index == spr_clownfall || state == (211 << 0) || state == (210 << 0) || state == (70 << 0) || (state == (71 << 0) && (sprite_index == spr_shotgunjump2 || sprite_index == spr_shotgunjump3)) || state == (97 << 0) || state == (184 << 0) || state == (185 << 0) || (state == (41 << 0) && (vsp != 0 || hsp != 0 || movespeed != 0 || move != 0 || key_shoot)) || (state == (80 << 0) && ((sprite_index != spr_uppercut && sprite_index != spr_uppercutend && sprite_index != spr_player_kungfuattackstance) || vsp < 0)) || state == (124 << 0) || state == (31 << 0) || state == (121 << 0) || (state == (92 << 0) && sprite_index == spr_playerN_noisebombspinjump) || state == (108 << 0) || state == (9 << 0) || state == (254 << 0) || (state == (10 << 0) && sprite_index != spr_firemouthintro) || state == (19 << 0) || state == (254 << 0) || state == (77 << 0) || state == (63 << 0) || state == (97 << 0) || state == (73 << 0) || state == (20 << 0) || (state == (76 << 0) && sprite_index == spr_piledriver) || (state == (47 << 0) && sprite_index != spr_knightpep_idle && sprite_index != spr_knightpep_walk && sprite_index != spr_knightpepjumpstart && sprite_index != spr_knightpepjump && sprite_index != spr_knightpepfall && sprite_index != spr_knightpepland) || state == (48 << 0) || state == (38 << 0) || state == (187 << 0) || state == (24 << 0) || state == (21 << 0) || state == (201 << 0) || state == (197 << 0) || global.noisejetpack == 1 || state == (259 << 0) || state == (265 << 0) || holycross > 0 || state == (116 << 0) || sprite_index == spr_player_chainsawswing || state == (115 << 0) || ratmount_movespeed >= 12 || ghostdash == 1 || state == (165 << 0) || state == (153 << 0) || (state == (105 << 0) && (sprite_index == spr_mach3boost || sprite_index == spr_player_machslideboost3fall)))
    instakillmove = 1
else
    instakillmove = 0
if ((global.noisejetpack || holycross > 0) && (state == (146 << 0) || state == (61 << 0) || state == (84 << 0) || state == (186 << 0) || state == (293 << 0) || state == (144 << 0) || state == (297 << 0) || state == (123 << 0)))
    instakillmove = 0
if (state == (198 << 0) && vsp < 0)
    stunmove = 1
else
    stunmove = 0
if (flash == 1 && alarm[0] <= 0)
    alarm[0] = (0.15 * room_speed)
if (state != (93 << 0))
    hooked = 0
if (state != (121 << 0) && state != (105 << 0))
    autodash = 0
if ((state != (92 << 0) && state != (101 << 0) && state != (23 << 0)) || vsp < 0)
    fallinganimation = 0
if (state != (111 << 0) && state != (0 << 0) && state != (105 << 0) && state != (92 << 0))
    facehurt = 0
if (state != (0 << 0) && state != (105 << 0))
    machslideAnim = 0
if (state != (0 << 0) && state != (191 << 0))
{
    idle = 0
    dashdust = 0
}
if (state != (103 << 0) && state != (26 << 0) && state != (92 << 0) && state != (19 << 0) && state != (42 << 0) && state != (0 << 0) && state != (104 << 0) && state != (121 << 0) && state != (122 << 0) && state != (47 << 0) && state != (66 << 0) && state != (38 << 0))
    momemtum = 0
if (state != (97 << 0) && state != (99 << 0))
    a = 0
if (state != (62 << 0))
    facestompAnim = 0
if (state != (108 << 0) && state != (62 << 0) && state != (76 << 0) && state != (111 << 0))
    superslam = 0
if (state != (104 << 0))
    machpunchAnim = 0
if (ladderbuffer > 0)
    ladderbuffer--
if (state != (92 << 0))
    stompAnim = 0
if (state == (121 << 0) || (state == (16 << 0) && ghostdash && ghostpepper >= 3) || state == (104 << 0) || state == (97 << 0) || ratmount_movespeed >= 12 || gusdashpadbuffer > 0 || (pogochargeactive && state == (58 << 0)))
{
    if (macheffect == 0)
    {
        macheffect = 1
        toomuchalarm1 = 8
        with (create_mach3effect(x, y, sprite_index, image_index, 1))
        {
            image_xscale = other.xscale
            playerid = other.id
        }
    }
}
if (!isgustavo)
    gusdashpadbuffer = 0
if ((!(state == (121 << 0))) && (!(state == (104 << 0))) && ratmount_movespeed < 12 && (state != (16 << 0) || ghostpepper < 2) && gusdashpadbuffer <= 0 && state != (97 << 0))
    macheffect = 0
if (toomuchalarm1 > 0)
{
    toomuchalarm1 -= 1
    if (toomuchalarm1 <= 0 && (state == (121 << 0) || (state == (16 << 0) && ghostdash == 1 && ghostpepper >= 3) || state == (104 << 0) || state == (97 << 0) || ratmount_movespeed >= 12 || gusdashpadbuffer > 0 || (pogochargeactive && state == (58 << 0))))
    {
        toomuchalarm1 = 8
        with (create_mach3effect(x, y, sprite_index, image_index, 1))
        {
            image_xscale = other.xscale
            playerid = other.id
        }
    }
}
if (restartbuffer > 0)
    restartbuffer--
if ((y > (room_height + 300) || y < -800) && (!(place_meeting(x, y, obj_verticalhallway))) && restartbuffer <= 0 && (!verticalhallway) && room != custom_lvl_room && state != (89 << 0) && state != (186 << 0) && (!global.levelreset) && room != boss_pizzaface && room != tower_outside && room != boss_pizzafacefinale && state != (89 << 0) && (!instance_exists(obj_backtohub_fadeout)) && state != (290 << 0))
{
    if (room != Mainmenu && room != tower_outside && room != Realtitlescreen && room != Longintro && room != Endingroom && room != Johnresurrectionroom && room != Creditsroom && room != rank_room)
    {
        visible = true
        with (obj_camera)
        {
            shake_mag = 3
            shake_mag_acc = (3 / room_speed)
        }
        if (state == (17 << 0))
        {
            state = (16 << 0)
            sprite_index = spr_ghostidle
        }
        var s = state
        notification_push((8 << 0), [id, s])
        state = (146 << 0)
        visible = false
        hsp = 0
        vsp = 0
        fmod_event_one_shot_3d("event:/sfx/pep/groundpound", x, (room_height - 100))
        with (instance_create(x, (y + 540), obj_technicaldifficulty))
        {
            playerid = other.id
            if (!other.isgustavo)
                sprite = choose(348, 1191, 4009)
            else
                sprite = spr_technicaldifficulty4
        }
        vsp = 10
    }
    else
    {
        state = (18 << 0)
        x = -100
        y = -100
    }
}
if (character != "M")
{
    if (!(scr_solid_player(x, y)))
    {
        if (character != "S" && state != (260 << 0) && state != (35 << 0) && state != (34 << 0) && (!((state == (106 << 0) && sprite_index == spr_tumbleend))) && state != (116 << 0) && state != (115 << 0) && sprite_index != spr_player_breakdancesuper && sprite_index != spr_player_chainsawcrouch && sprite_index != spr_playerV_divekickstart && sprite_index != spr_playerV_divekick && sprite_index != spr_clowncrouch && sprite_index != spr_player_barrelslipnslide && sprite_index != spr_barrelroll && sprite_index != spr_bombpepintro && sprite_index != spr_knightpepthunder && state != (59 << 0) && state != (100 << 0) && state != (67 << 0) && state != (68 << 0) && state != (33 << 0) && state != (72 << 0) && sprite_index != spr_player_crouchshoot && state != (99 << 0) && state != (102 << 0) && state != (61 << 0) && state != (65 << 0) && state != (107 << 0) && state != (101 << 0) && state != (30 << 0) && state != (29 << 0) && state != (5 << 0))
            mask_index = spr_player_mask
        else
            mask_index = spr_crouchmask
    }
    else
        mask_index = spr_crouchmask
}
else
    mask_index = spr_pepperman_mask
if (state == (46 << 0) || sprite_index == spr_knightpepstart || sprite_index == spr_knightpepthunder || state == (90 << 0) || state == (61 << 0) || state == (112 << 0) || state == (7 << 0) || state == (98 << 0) || state == (95 << 0) || state == (89 << 0) || state == (186 << 0) || state == (152 << 0) || state == (146 << 0) || (collision_flags & (1 << 0)) > 0)
    cutscene = 1
else
    cutscene = 0
if ((state == (0 << 0) || state == (191 << 0)) && obj_player1.spotlight == 1 && (!instance_exists(obj_uparrow)) && (collision_flags & (4 << 0)) > 0)
{
    if place_meeting(x, y, obj_uparrowhitbox)
    {
        with (instance_create(x, y, obj_uparrow))
            playerid = other.object_index
    }
}
if (movespeed > 12 && abs(hsp) > 12 && state == (121 << 0) && state != (165 << 0) && (!instance_exists(speedlineseffectid)) && (!cutscene) && (collision_flags & (1 << 0)) <= 0)
{
    with (instance_create(x, y, obj_speedlines))
    {
        playerid = other.object_index
        other.speedlineseffectid = id
    }
}
with (obj_ratblock)
    scr_ratblock_destroy()
scr_collide_destructibles()
if (state != (290 << 0) && state != (17 << 0) && state != (186 << 0) && state != (208 << 0) && state != (18 << 0) && state != (150 << 0) && state != (4 << 0) && state != (112 << 0) && state != (97 << 0) && state != (7 << 0) && state != (95 << 0) && state != (118 << 0) && state != (90 << 0) && state != (98 << 0) && state != (39 << 0) && state != (64 << 0) && state != (46 << 0) && state != (89 << 0))
    scr_collide_player()
if (state == (150 << 0) || state == (186 << 0) || state == (208 << 0))
{
    x += hsp
    y += vsp
}
if (state == (118 << 0))
    scr_collide_player()
if (state != (95 << 0))
    image_blend = c_white
prevstate = state
prevsprite = sprite_index
