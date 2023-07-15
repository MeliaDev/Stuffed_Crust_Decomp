if (room == rm_editor)
{
}
spr_palette = obj_player1.spr_palette
paletteselect = obj_player1.paletteselect
targetplayer = obj_player1.id
if (!pizzahead)
    wastedhits = (6 - elitehit)
else
    wastedhits = (4 - elitehit)
if (phase == 2)
    formed = 1
if ((!pizzahead) || elitehit > 1)
    destroyable = 0
switch state
{
    case (144 << 0):
        scr_fakepepboss_arenaintro()
        break
    case (134 << 0):
        scr_fakepepboss_walk()
        break
    case (275 << 0):
        scr_fakepepboss_deformed()
        break
    case (155 << 0):
        scr_fakepepboss_staggered()
        break
    case (276 << 0):
        scr_fakepepboss_grabdash()
        break
    case (277 << 0):
        scr_fakepepboss_grabthrow()
        break
    case (92 << 0):
        scr_fakepepboss_jump()
        break
    case (108 << 0):
        scr_fakepepboss_freefall()
        break
    case (104 << 0):
        scr_fakepepboss_mach2()
        break
    case (99 << 0):
        scr_fakepepboss_Sjumpprep()
        break
    case (97 << 0):
        scr_fakepepboss_Sjump()
        break
    case (74 << 0):
        scr_fakepepboss_throwing()
        break
    case (84 << 0):
        scr_fakepepboss_backbreaker()
        break
    case (294 << 0):
        scr_boss_pizzaheadjump()
        break
    case (298 << 0):
        scr_boss_pizzaheadKO()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        break
    case (4 << 0):
        scr_boss_grabbed()
        break
    case (154 << 0):
        scr_enemy_pummel()
        break
}

boss_update_pizzaheadKO(2085, 4056)
if (phase == 2 && state != (138 << 0) && state != (275 << 0))
{
    if (deformed_cooldown > 0)
        deformed_cooldown--
    else
        scr_fakepepboss_do_projectiles((phase - 1), wastedhits)
}
if (state == (97 << 0))
{
    if (!instance_exists(hitboxID))
    {
        with (instance_create(x, y, obj_forkhitbox))
        {
            ID = other.id
            other.hitboxID = id
            sprite_index = other.sprite_index
        }
    }
}
if (state == (138 << 0))
{
    stunned = 100
    cooldown = 0
    if thrown
    {
        formed = 0
        deformedtimer = 480
    }
}
if (flashbuffer > 0)
    flashbuffer--
boss_hurt_gustavo()
if (state == (92 << 0))
    grav = 0.4
else
    grav = 0.5
if (state == (138 << 0))
    instance_destroy(obj_grabmarker)
if (prevhp != elitehit)
{
    if (elitehit < prevhp)
    {
        instance_destroy(obj_grabmarker)
        if (irandom(100) <= 25)
            fmod_event_one_shot_3d("event:/sfx/voice/fakepepnegative", x, y)
        pizzahead_subhp = pizzahead_maxsubhp
        currentprojectile = 0
        subhp = maxsubhp
        var timer = fakepep_get_attack((phase - 1), wastedhits).deformed_timer
        var attack = fakepep_get_projectile((phase - 1), wastedhits, currentprojectile)
        state = (134 << 0)
        if (phase == 1)
            formed = 0
        deformed_cooldown = attack.cooldown
        deformed_timer = timer
        deformed_dir = 1
        global.playerhit++
        boss_do_pizzaheadKO()
        if (phase == 2)
        {
            touchedground = 0
            hsp += ((-image_xscale) * 5)
            flickertime = 11
            alarm[6] = 5
        }
        if (global.playerhit >= 3 && (pizzahead || phase != 2 || wastedhits < 6))
        {
            global.playerhit = 0
            instance_create(obj_player1.x, -15, obj_hppickup)
        }
    }
    prevhp = elitehit
}
if (wastedhits >= 6 && (!pizzahead))
{
    if (phase == 1)
    {
        if formed
        {
            elitehit = 6
            wastedhits = 0
            phase = 2
            create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
            fmod_event_one_shot_3d("event:/sfx/enemies/kill", x, y)
            with (obj_camera)
            {
                shake_mag = 3
                shake_mag_acc = (5 / room_speed)
            }
            var lay2 = layer_get_id("Backgrounds_2")
            var lay3 = layer_get_id("Backgrounds_1")
            var bg2 = layer_background_get_id(lay2)
            alarm[7] = 5
            layer_set_visible(lay3, 1)
            layer_background_change(bg2, 3900)
            scr_sleep(25)
        }
    }
    else if (phase == 2 && instance_exists(obj_fakepepsolid))
    {
        fmod_event_one_shot("event:/sfx/fakepep/chasebegin")
        visible = false
        phase = 3
        elitehit = 5
        create_particle(x, y, (9 << 0))
        instance_destroy(obj_fakepepsolid)
        with (obj_hppickup)
        {
            scr_collect_hat(1)
            instance_destroy()
        }
        lay2 = layer_get_id("Backgrounds_Ring")
        bg2 = layer_background_get_id(lay2)
        layer_background_change(bg2, 2140)
    }
}
if (state == (138 << 0))
{
    if thrown
        savedthrown = 1
    if (grounded && vsp > 0 && savedthrown)
    {
        stunned = 1
        idle_timer = 1
        ammo = 6
    }
}
else
    savedthrown = 0
if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state == (138 << 0) && savedthrown == thrown && (!savedthrown))
    invincible = 0
else
    invincible = 1
if (!visible)
    invincible = 1
if (state == (298 << 0))
    invincible = 1
if pizzahead
{
    with (obj_gustavograbbable)
    {
        if (enemy_is_superslam(id) || enemy_is_swingding(id))
            other.invincible = 1
    }
}
if ((!invincible) && (!flash) && alarm[5] < 0)
    alarm[5] = (0.15 * room_speed)
else if (invincible && state != (155 << 0) && flashbuffer <= 0)
    flash = 0
if ((state == (276 << 0) || (state == (104 << 0) && attackspeed >= 10) || (state == (74 << 0) && sprite_index == spr_fakepeppino_flailing && attackspeed > 4) || state == (108 << 0)) && alarm[4] < 0)
    alarm[4] = 10
mask_index = spr_player_mask
if (state != (138 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (4 << 0))
    depth = 0
if (state != (138 << 0))
    thrown = 0
if (boundbox == 0)
{
    with (instance_create(x, y, obj_baddiecollisionbox))
    {
        sprite_index = other.sprite_index
        mask_index = other.sprite_index
        baddieID = other.id
        other.boundbox = 1
    }
}
if (staggerbuffer > 0)
{
    staggerbuffer--
    if (alarm[9] == -1)
        alarm[9] = 5
}
scr_fakepep_update_sounds()
var n = (instance_number(obj_fakepepclone) / 10)
if (n > 1)
    n = 1
fmod_set_parameter("clones", n, 1)
