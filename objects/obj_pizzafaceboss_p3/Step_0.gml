if (room == rm_editor)
{
}
image_speed = 0.35
targetplayer = obj_player1.id
wastedhits = (maxhp - elitehit)
switch state
{
    case (144 << 0):
        scr_pizzaface_p3_arenaintro()
        break
    case (135 << 0):
        scr_pizzaface_p3_fall()
        break
    case (155 << 0):
        scr_pizzaface_p3_staggered()
        break
    case (134 << 0):
        scr_pizzaface_p3_walk()
        break
    case (288 << 0):
        scr_pizzaface_p3_stomp()
        break
    case (80 << 0):
        scr_pizzaface_p3_punch()
        break
    case (92 << 0):
        scr_pizzaface_p3_jump()
        break
    case (74 << 0):
        scr_pizzaface_p3_throwing()
        break
    case (287 << 0):
        scr_pizzaface_p3_swinging()
        break
    case (289 << 0):
        scr_pizzaface_p3_finale()
        break
    case (294 << 0):
        scr_boss_pizzaheadjump()
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

if (state != (294 << 0))
{
    if ((state == (135 << 0) && vsp < 0) || state == (289 << 0))
    {
        use_collision = 0
        if (state == (135 << 0))
        {
            x += hsp
            y += vsp
            if (vsp < 20)
                vsp += grav
        }
    }
    else
        use_collision = 1
}
if (prevhp != elitehit)
{
    if (elitehit < prevhp)
    {
        currentattack = 0
        vulnerable_buffer = 0
        laugh = 0
        pizzahead_subhp = pizzahead_maxsubhp
        global.playerhit++
        touchedground = 0
        hsp += ((-image_xscale) * 5)
        flickertime = 11
        alarm[6] = 5
        if (global.playerhit >= 3)
        {
            global.playerhit = 0
            instance_create(obj_player1.x, -15, obj_hppickup)
        }
    }
    prevhp = elitehit
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
if ((state == (80 << 0) || state == (288 << 0) || state == (287 << 0) || state == (92 << 0)) && alarm[4] == -1)
    alarm[4] = 5
invincible = 1
if (vulnerable_buffer > 0 && state == (134 << 0) && flickertime <= 0)
{
    vulnerable_buffer--
    invincible = 0
}
if (state == (138 << 0) && (!savedthrown))
    invincible = 0
if ((!invincible) && alarm[5] < 0 && (!flash))
    alarm[5] = (0.15 * room_speed)
if ((state == (276 << 0) || (state == (104 << 0) && attackspeed >= 10) || (state == (74 << 0) && sprite_index == spr_fakepeppino_flailing)) && alarm[4] < 0)
{
    alarm[4] = 10
    if (state == (108 << 0))
        alarm[4] = 5
}
mask_index = spr_pizzahead_idle
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
scr_pizzaface_p3_update_sounds()
