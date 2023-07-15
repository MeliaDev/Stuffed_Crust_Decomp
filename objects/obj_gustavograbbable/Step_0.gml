if (room == rm_editor)
{
}
switch state
{
    case (126 << 0):
        scr_enemy_idle()
        break
    case (130 << 0):
        scr_enemy_turn()
        break
    case (134 << 0):
        sprite_index = spr_lonegustavo_grabbable
        image_speed = 0.35
        hsp = 0
        var _boss = noone
        with (obj_baddie)
        {
            if (object_index != obj_gustavograbbable)
                _boss = id
        }
        if (_boss != noone)
        {
            if (_boss.x != x)
                image_xscale = sign((_boss.x - x))
        }
        break
    case (136 << 0):
        scr_enemy_land()
        break
    case (137 << 0):
        scr_enemy_hit()
        break
    case (138 << 0):
        scr_enemy_stun()
        if (sprite_index == spr_dead)
            sprite_index = spr_lonegustavo_dashjump
        break
    case (129 << 0):
        scr_pizzagoblin_throw()
        break
    case (294 << 0):
        scr_boss_pizzaheadjump()
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
if (state == (294 << 0) && obj_player1.state != (42 << 0) && place_meeting(x, y, obj_solid))
    invincible = 1
else
    invincible = 0
