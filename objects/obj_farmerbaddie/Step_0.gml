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
        if (!idle)
            scr_enemy_walk()
        else
        {
            sprite_index = idlespr
            hsp = Approach(hsp, 0, 1)
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
}

if (bombreset > 0)
    bombreset--
scr_scareenemy()
if (state != (134 << 0) && object_index != obj_farmerbaddie2 && object_index != obj_farmerbaddie3)
    idle = 0
if (state == (134 << 0))
{
    var x1 = disx
    playerid = instance_nearest(x, y, obj_player)
    var t = (playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 100) && playerid.y < (y + 100))
    if (cooldown > 0)
        cooldown--
    else if (t && collision_line(x, y, playerid.x, playerid.y, obj_solid, false, true) == -4)
    {
        state = (92 << 0)
        sprite_index = ragespr
        vsp = -5
        hsp = 0
        if (playerid.x != x)
            image_xscale = sign((playerid.x - x))
    }
}
else if (state == (92 << 0))
{
    if (grounded && vsp > 0)
    {
        fmod_event_instance_play(chargesnd)
        fmod_event_instance_set_3d_attributes(chargesnd, x, y)
        state = (128 << 0)
        sprite_index = ragespr
        attackspeed = 6
    }
}
else if (state == (128 << 0))
{
    idle = 0
    if (object_index != obj_farmerbaddie3 && (!instance_exists(hitboxID)))
    {
        with (instance_create(x, y, obj_forkhitbox))
        {
            ID = other.id
            other.hitboxID = id
        }
    }
    x1 = disx_out
    playerid = instance_nearest(x, y, obj_player)
    t = (playerid.x > (x - x1) && playerid.x < (x + x1) && playerid.y > (y - 400) && playerid.y < (y + 400))
    hsp = (image_xscale * attackspeed)
    var q = outofsight
    if ((!t) || collision_line(x, y, playerid.x, playerid.y, obj_solid, true, false) != -4)
        outofsight = 1
    if t
        outofsight = 0
    if outofsight
    {
        if (q != outofsight)
            waitbuffer = 30
        if (waitbuffer > 0)
            waitbuffer--
        else
            attackspeed = Approach(attackspeed, 0, 0.1)
    }
    else
        attackspeed = Approach(attackspeed, attackmaxspeed, 1)
    if (attackspeed <= 0)
    {
        cooldown = 60
        state = (134 << 0)
        sprite_index = walkspr
    }
    if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))))
        image_xscale *= -1
}
if (state != (128 << 0) && hitboxID != noone && instance_exists(hitboxID))
{
    instance_destroy(hitboxID)
    hitboxID = -4
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
