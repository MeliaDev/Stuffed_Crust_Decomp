if (room == rm_editor)
{
}
targetplayer = obj_player1.id
wastedhits = (10 - elitehit)
if (elitehit <= 1 && phase == 2 && destroyable)
    destroyable = 0
switch state
{
    case (144 << 0):
        scr_pepperman_arenaintro()
        break
    case (134 << 0):
        scr_pepperman_walk()
        break
    case (153 << 0):
        scr_pepperman_shoulderbash()
        break
    case (92 << 0):
        scr_pepperman_jump()
        break
    case (108 << 0):
        scr_pepperman_freefall()
        break
    case (122 << 0):
        scr_pepperman_freefallprep()
        break
    case (111 << 0):
        scr_pepperman_freefallland()
        break
    case (161 << 0):
        scr_pepperman_shoulderturn()
        break
    case (133 << 0):
        scr_pepperman_rolling()
        break
    case (267 << 0):
        scr_pepperman_contemplate()
        break
    case (268 << 0):
        scr_pepperman_mini()
        break
    case (273 << 0):
        scr_pepperman_phase1hurt()
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
    case (155 << 0):
        scr_enemy_staggered()
        break
}

if (state != (138 << 0) && state != (137 << 0) && state != (273 << 0) && state != (262 << 0) && (state != (134 << 0) || flickertime <= 0))
    scr_pepperman_do_contemplate()
if pizzahead
{
    with (obj_gustavograbbable)
    {
        if (thrown && (place_meeting((x + hsp), y, other) || place_meeting((x - image_xscale), y, other) || place_meeting((x - (32 * image_xscale)), y, other) || place_meeting((x + (32 * image_xscale)), y, other)))
        {
            with (other)
            {
                state = (138 << 0)
                stunned = 1000
                thrown = 0
                hsp = ((-image_xscale) * 8)
                vsp = -4
                instance_destroy(other)
            }
        }
    }
}
if ((!pizzahead) && wastedhits >= 10 && phase == 1 && state == (134 << 0) && flickertime <= 0 && grounded && vsp > 0)
{
    repeat (4)
    {
        with (create_debris((x + random_range(-64, 64)), (y + random_range(-64, 64)), 4030, 1))
        {
            hsp = random_range(-5, 5)
            vsp = random_range(-10, 10)
            image_speed = 0.4
        }
    }
    instance_destroy(obj_peppermanartdude)
    create_heatattack_afterimage(x, y, sprite_index, image_index, image_xscale)
    with (obj_camera)
    {
        shake_mag = 3
        shake_mag_acc = (5 / room_speed)
    }
    var lay1 = layer_get_id("Backgrounds_scroll")
    var lay2 = layer_get_id("Backgrounds_2")
    var lay3 = layer_get_id("Backgrounds_1")
    var bg1 = layer_background_get_id(lay1)
    var bg2 = layer_background_get_id(lay2)
    alarm[7] = 5
    layer_set_visible(lay3, 1)
    layer_background_change(bg2, 4125)
    layer_hspeed(lay1, 5)
    elitehit = 10
    wastedhits = 0
    phase = 2
    fmod_event_one_shot_3d("event:/sfx/voice/peppermanlaugh", x, y)
    instance_destroy(obj_pepper_marbleblock)
    with (obj_pepper_marblespot)
        created = 0
    scr_sleep(25)
}
if (state == (138 << 0))
{
    if (wastedhits >= 8 && sprite_index == spr_pepperman_shoulderhurt && grounded && vsp > 0 && (!thrown) && stunned > 10)
        stunned = 1
    if thrown
        savedthrown = 1
    if (grounded && vsp > 0 && savedthrown)
    {
        stunned = 1
        idle_timer = 1
        if (wastedhits >= 10 && phase == 2 && (!pizzahead))
        {
            instance_destroy(obj_pepper_marbleblock)
            fmod_event_one_shot_3d("event:/sfx/pepperman/shrink", x, y)
            fmod_event_one_shot_3d("event:/sfx/voice/peppermanscared", x, y)
            state = (268 << 0)
            ministate = (8 << 0)
            minibuffer = 480
            sprite_index = spr_pepperman_ministart
            image_index = 0
        }
    }
}
else
    savedthrown = 0
if (prevhp != elitehit)
{
    if (elitehit < prevhp)
    {
        if (irandom(100) <= 33)
            fmod_event_one_shot_3d("event:/sfx/voice/peppermanscared", x, y)
        pizzahead_subhp = pizzahead_maxsubhp
        bowlingballcount = 0
        GIANTbowlingballcount = 0
        touchedground = 0
        hsp += ((-image_xscale) * 5)
        flickertime = 11
        alarm[6] = 5
        global.playerhit++
        if (pizzahead && elitehit <= 2 && (!pizzaheadshot))
            pizzaheadshot = 1
        if (global.playerhit >= 3)
        {
            global.playerhit = 0
            instance_create(obj_player1.x, -32, obj_hppickup)
        }
    }
    prevhp = elitehit
}
boss_hurt_gustavo()
if (state == (108 << 0) || (state == (133 << 0) && vsp < 0))
{
    if (!instance_exists(hitboxID))
    {
        hitboxID = instance_create(x, y, obj_forkhitbox)
        with (hitboxID)
        {
            ID = other.id
            sprite_index = spr_pepperman_groundpoundstart
            mask_index = spr_pepperman_groundpoundstart
        }
    }
}
else if instance_exists(hitboxID)
    instance_destroy(hitboxID)
if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (((state != (138 << 0) || savedthrown != thrown || (wastedhits >= 8 && (sprite_index == spr_pepperman_shoulderhurt || sprite_index == spr_pepperman_shoulderhurtstart)) || thrown) && (state != (111 << 0) || landbuffer <= 0) && (state != (133 << 0) || vsp < 0 || sprite_index == spr_pepperman_groundpoundland) && state != (267 << 0)) || flickertime > 0 || (wastedhits == 9 && phase == 1))
    invincible = 1
else
    invincible = 0
if (pizzahead && elitehit <= 1)
{
    destroyable = 1
    if (state == (133 << 0) && vsp > 0 && sprite_index != spr_pepperman_groundpoundland)
        invincible = 0
}
if (landbuffer2 > 0)
{
    if (state == (111 << 0))
    {
        landbuffer2--
        invincible = 1
    }
}
if (((!invincible) || (state == (268 << 0) && ministate != (8 << 0)) || (wastedhits == 9 && phase == 1 && state == (267 << 0))) && (!flash) && alarm[5] < 0)
    alarm[5] = (0.15 * room_speed)
else if (invincible && (state != (268 << 0) || ministate == (8 << 0)) && (wastedhits != 9 || phase != 1 || state != (267 << 0)))
    flash = 0
if ((state == (153 << 0) || state == (108 << 0)) && alarm[4] < 0)
{
    alarm[4] = 10
    if (state == (108 << 0))
        alarm[4] = 5
}
mask_index = spr_pepperman_mask
if (state != (138 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (4 << 0))
    depth = 0
if (!pizzahead)
    var _art = wastedhits >= 1
else
    _art = elitehit <= 3
if (_art && artdudes == 0)
{
    alarm[8] = 600
    artdudes = 1
}
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
scr_pepperman_sounds()
