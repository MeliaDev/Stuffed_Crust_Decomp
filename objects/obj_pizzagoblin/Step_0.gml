if (room == rm_editor)
{
}
switch state
{
    case (126 << 0):
        scr_enemy_idle()
        break
    case (128 << 0):
        scr_enemy_charge()
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
}

if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (138 << 0))
    birdcreated = 0
idlespr = spr_pizzagoblin_idle
stunfallspr = spr_pizzagoblin_stun
walkspr = spr_pizzagoblin_walk
stunspr = spr_pizzagoblin_stun
grabbedspr = spr_pizzagoblin_stun
scr_scareenemy()
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (4 << 0))
    depth = 0
if (state != (138 << 0))
    thrown = 0
if (bombreset > 0)
    bombreset--
var realplayer = (global.coop ? instance_nearest(x, y, obj_player) : obj_player1)
var targetplayer = realplayer
if (distance_to_object(realplayer) > 72 || distance_to_object(realplayer) < 650)
{
    if instance_exists(obj_robot)
        targetplayer = instance_nearest(x, y, obj_robot)
    else if instance_exists(obj_sausageman)
        targetplayer = instance_nearest(x, y, obj_sausageman)
}
if instance_exists(targetplayer)
{
    if (targetplayer.object_index != obj_player)
    {
        if (x != targetplayer.x && state != (129 << 0) && bombreset <= 0 && grounded)
        {
            if (targetplayer.x > (x - 500) && targetplayer.x < (x + 500) && y <= (targetplayer.y + 80) && y >= (targetplayer.y - 80))
            {
                if (state == (134 << 0) || (state == (126 << 0) && sprite_index != scaredspr))
                {
                    sprite_index = spr_pizzagoblin_throwbomb
                    image_index = 0
                    image_xscale = (-(sign((x - targetplayer.x))))
                    state = (129 << 0)
                    altangle = 1
                }
            }
        }
    }
    else if (x != targetplayer.x && state != (129 << 0) && bombreset <= 0 && grounded)
    {
        if (targetplayer.x > (x - 400) && targetplayer.x < (x + 400) && y <= (targetplayer.y + 30) && y >= (targetplayer.y - 30))
        {
            if (state == (134 << 0) || (state == (126 << 0) && sprite_index != scaredspr))
            {
                sprite_index = spr_pizzagoblin_throwbomb
                image_index = 0
                image_xscale = (-(sign((x - targetplayer.x))))
                state = (129 << 0)
                altangle = 0
            }
        }
    }
}
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
