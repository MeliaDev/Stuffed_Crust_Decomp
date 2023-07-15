if (room == rm_editor)
{
}
if elite
{
    if (elitechoose == 0)
    {
        paletteselect = choose(1, 2)
        elitechoose = 1
    }
}
else
    paletteselect = 0
switch state
{
    case (126 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        scr_enemy_walk()
        break
    case (136 << 0):
        scr_enemy_land()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        break
    case (129 << 0):
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        scr_enemy_grabbed()
        break
    case (154 << 0):
        scr_enemy_pummel()
        break
    case (155 << 0):
        scr_enemy_staggered()
        break
    case (125 << 0):
        scr_enemy_rage()
        break
    case (17 << 0):
        scr_enemy_ghostpossess()
        break
    case (294 << 0):
        scr_enemy_pizzaheadjump()
        break
    case (5 << 0):
        if instance_exists(obj_chilidude_fire)
        {
            with (obj_chilidude_fire)
                instance_destroy()
        }
        grav = 0.5
        sprite_index = spr_pepperpal_tumble
        hsp = (image_xscale * tumblespeed)
        angle = 0
        if (scr_solid((x + sign(hsp)), y) && ((!(place_meeting(x, (y + 1), obj_slope))) || place_meeting((x + sign(hsp)), (y - 5), obj_solid)))
            image_xscale *= -1
        if (stuntimer > 0)
            stuntimer--
        else
        {
            stuntimer = 0
            tumblespeed = 7
            state = (138 << 0)
        }
        if (!instance_exists(hitboxID))
        {
            hitboxID = instance_create(x, y, obj_weeniehitbox)
            hitboxID.baddieID = id
        }
        break
}

if (machtumble && state != (5 << 0))
{
    stuntimer = stunmax
    state = (5 << 0)
    machtumble = 0
}
if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (138 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (sprite_index != spr_pepperpal_tumble)
    scr_scareenemy()
var player = instance_nearest(x, y, obj_player)
if elite
{
    if (hitboxcreate == 0 && state == (134 << 0))
    {
        hitboxcreate = 1
        with (instance_create((x + (5 * image_xscale)), y, obj_forkhitbox))
            ID = other.id
    }
}
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
if (sprite_index == walkspr)
{
    if (flamecloud_buffer > 0)
        flamecloud_buffer--
    else
    {
        flamecloud_buffer = 40
        with (instance_create(x, y, obj_chilidude_fire))
            image_xscale = other.xscale
    }
}
