if (room == rm_editor)
{
}
image_speed = 0.35
switch state
{
    case (126 << 0):
        sprite_index = idlespr
        playerid = instance_nearest(x, y, obj_player)
        hsp = 0
        vsp = 0
        var x1 = 370
        if bbox_in_camera(view_camera[0], 50)
        {
            if (image_xscale > 0)
                var t = (playerid.x > (x - 16) && playerid.x < (x + x1) && playerid.y > (y - 16) && playerid.y < (y + 200))
            else
                t = (playerid.x < (x + 16) && playerid.x > (x - x1) && playerid.y > (y - 16) && playerid.y < (y + 200))
            if (cooldown > 0)
                cooldown--
            else if t
            {
                state = (8 << 0)
                sprite_index = spr_ghoul_attackstart
                image_index = 0
                attack_y = y
            }
        }
        break
    case (128 << 0):
        scr_enemy_charge()
        break
    case (134 << 0):
        sprite_index = idlespr
        var d = point_direction(x, y, xstart, ystart)
        x += lengthdir_x(8, d)
        y += lengthdir_y(8, d)
        hsp = 0
        vsp = 0
        if (x > (xstart - 10) && x < (xstart + 10) && y > (ystart - 10) && y < (ystart + 10))
        {
            state = (126 << 0)
            image_xscale = start_xscale
            cooldown = 100
            x = xstart
            y = ystart
        }
        else
            image_xscale = sign((x - xstart))
        break
    case (8 << 0):
        hsp = 0
        vsp = 0
        if (floor(image_index) == (image_number - 1))
        {
            fmod_event_one_shot_3d("event:/sfx/enemies/minijohnpunch", x, y)
            state = (80 << 0)
            attackvsp = 11
            attack_y = y
            sprite_index = spr_ghoul_attack
        }
        break
    case (80 << 0):
        attackvsp = Approach(attackvsp, -11, 0.5)
        vsp = attackvsp
        hsp = (image_xscale * 10)
        if (y < attack_y && vsp < 0)
        {
            y = attack_y
            vsp = 0
            state = (126 << 0)
            cooldown = 100
            image_xscale *= -1
        }
        break
    case (130 << 0):
        break
    case (136 << 0):
        scr_enemy_land()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        hit = 1
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
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (4 << 0))
    depth = 0
if (state != (138 << 0))
    thrown = 0
if (bombreset > 0)
    bombreset--
if (grounded && state == (129 << 0) && floor(image_index) == 3)
    vsp = -5
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
