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
        hsp = 0
        sprite_index = spr_pizzice_idle
        image_speed = 0.35
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
        var is = 1.25
        if (image_speed < is)
            image_speed = Approach(image_speed, is, 0.015)
        else if (cooldown > 0)
            cooldown--
        else
        {
            shot--
            fmod_event_one_shot_3d("event:/sfx/enemies/projectile", x, y)
            var dirs = [[1, 1], [1, -1], [-1, 1], [-1, -1]]
            cooldown = 35
            flash = 1
            xscale = 0.6
            yscale = 1.5
            var pad = 30
            var pd = 0
            for (var i = 0; i < array_length(dirs); i++)
            {
                var b = dirs[i]
                pd = point_direction(0, 0, b[0], b[1])
                with (instance_create((x + lengthdir_x(pad, pd)), (y + lengthdir_y(pad, pd)), obj_pizzice_projectile))
                {
                    image_xscale = b[0]
                    image_yscale = b[1]
                }
            }
            if (shot <= 0)
            {
                bombreset = 180
                state = (138 << 0)
                stunned = 100
                image_speed = 0.35
                sprite_index = stunfallspr
            }
        }
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
if (bombreset > 0 && state != (138 << 0))
    bombreset--
else if (state == (134 << 0) && distance_to_object(obj_player) < 250)
{
    state = (129 << 0)
    cooldown = 20
    sprite_index = spr_pizzice_walk
    image_speed = 0.25
    shot = 3
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
