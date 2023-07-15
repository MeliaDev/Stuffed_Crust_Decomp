if (room == rm_editor)
{
}
switch state
{
    case (126 << 0):
        grav = 0.5
        scr_enemy_idle()
        break
    case (128 << 0):
        grav = 0.5
        scr_enemy_charge()
        break
    case (130 << 0):
        grav = 0.5
        scr_enemy_turn()
        break
    case (134 << 0):
        grav = 0.5
        scr_enemy_walk()
        break
    case (136 << 0):
        grav = 0.5
        scr_enemy_land()
        break
    case (137 << 0):
        grav = 0.5
        scr_enemy_hit()
        break
    case (138 << 0):
        grav = 0.5
        scr_enemy_stun()
        break
    case (154 << 0):
        grav = 0.5
        scr_enemy_pummel()
        break
    case (155 << 0):
        grav = 0.5
        scr_enemy_staggered()
        break
    case (129 << 0):
        grav = 0.5
        scr_pizzagoblin_throw()
        break
    case (4 << 0):
        grav = 0.5
        scr_enemy_grabbed()
        break
}

if ((!hitboxcreate) && state == (134 << 0))
{
    hitboxcreate = 1
    with (instance_create(x, y, obj_forkhitbox))
    {
        ID = other.id
        sprite_index = spr_coolpineahitbox
    }
}
if (inv_timer <= 0)
    scr_scareenemy()
if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (state != (138 << 0))
    birdcreated = 0
if (sprite_index == scaredspr)
    inv_timer = 0
if (state == (134 << 0))
{
    grav = 0.5
    if point_in_camera(x, y, view_camera[0])
    {
        var _taunt = 0
        with (obj_player)
        {
            if (state == (84 << 0))
                _taunt = 1
        }
        if _taunt
        {
            taunteffect_inst = instance_create(x, y, obj_baddietaunteffect)
            sprite_index = spr_coolpinea_taunt
            image_speed = 0
            index = choose(0, 1, 2)
            taunt_count = taunt_max
            taunt_storedstate = state
            taunt_storedmovespeed = movespeed
            taunt_storedhsp = hsp
            state = (84 << 0)
            hsp = 0
            vsp = 0
            grav = 0
        }
    }
}
if (state != (84 << 0) && instance_exists(taunteffect_inst))
    instance_destroy(taunteffect_inst)
switch state
{
    case (84 << 0):
        image_speed = 0
        image_index = index
        hsp = 0
        vsp = 0
        if (taunt_count > 0)
            taunt_count--
        else
        {
            sprite_index = walkspr
            grav = taunt_storedgrav
            state = (134 << 0)
            hsp = taunt_storedhsp
            movespeed = taunt_storedmovespeed
        }
        break
    case (147 << 0):
        image_speed = 0.35
        if (trail_count > 0)
            trail_count--
        else
        {
            with (create_afterimage(x, y, sprite_index, (image_index - 1)))
                image_xscale = other.image_xscale
            trail_count = trail_max
        }
        if (instance_exists(taunteffect_inst) && taunteffect_inst.object_index == obj_baddietaunteffect)
        {
            instance_destroy(taunteffect_inst)
            taunteffect_inst = -4
        }
        if (movespeed > 0)
            movespeed -= 0.5
        else
            movespeed = 0
        hsp = (movespeed * (-image_xscale))
        if (image_index > (image_number - 1))
        {
            sprite_index = walkspr
            grav = taunt_storedgrav
            state = taunt_storedstate
            hsp = taunt_storedhsp
            cooldown_count = cooldown_max
            movespeed = taunt_storedmovespeed
        }
        break
    case (80 << 0):
        if (sprite_index == spr_coolpinea_ragestart)
        {
            hsp = 0
            inv_timer = 0
            if (floor(image_index) == (image_number - 1))
            {
                sprite_index = spr_coolpinea_rage
                breakdance_movespeed = 10
                hsp = (breakdance_movespeed * image_xscale)
            }
        }
        else
        {
            breakdance_movespeed = Approach(breakdance_movespeed, 0, 0.25)
            hsp = (image_xscale * breakdance_movespeed)
            if place_meeting((x + sign(hsp)), y, obj_solid)
            {
                image_xscale *= -1
                if (breakdance_movespeed < 3)
                    breakdance_movespeed = 5
                hsp = (breakdance_movespeed * image_xscale)
            }
            if (trail_count > 0)
                trail_count--
            else
            {
                with (create_red_afterimage(x, y, sprite_index, (image_index - 1), image_xscale))
                    playerid = other.id
                trail_count = trail_max
            }
            if (breakdance > 0)
                breakdance--
            else
            {
                sprite_index = walkspr
                state = (134 << 0)
                breakdanceinst = -4
            }
        }
        break
}

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
