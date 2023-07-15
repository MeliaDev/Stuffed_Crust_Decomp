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
        hsp = 0
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
    case (141 << 0):
        scr_enemy_chase()
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
}

if (state == (134 << 0) || state == (126 << 0))
{
    if (sprite_index != spr_golfdemon_idle2)
        sprite_index = spr_golfdemon_idle
}
if (state == (138 << 0) && stunned > 100 && birdcreated == 0)
{
    birdcreated = 1
    with (instance_create(x, y, obj_enemybird))
        ID = other.id
}
if (ragecooldown > 0)
    ragecooldown--
if (state != (138 << 0))
    birdcreated = 0
if (flash == 1 && alarm[2] <= 0)
    alarm[2] = (0.15 * room_speed)
if (state != (141 << 0))
    momentum = 0
if (state == (134 << 0) || state == (126 << 0))
{
    var targetplayer = instance_nearest(x, y, obj_player)
    if (sprite_index != spr_golfdemon_idle2 && targetplayer.x > (x - 200) && targetplayer.x < (x + 200) && targetplayer.y > (y - 200) && targetplayer.y < (y + 200))
    {
        fmod_event_one_shot_3d("event:/sfx/enemies/demonsuprise", x, y)
        sprite_index = spr_golfdemon_idle2
        image_index = 0
    }
    if (sprite_index == spr_golfdemon_idle2 && floor(image_index) == (image_number - 1))
    {
        idle = 0
        movespeed = 6
        if (targetplayer.x != x)
            image_xscale = (-(sign((x - targetplayer.x))))
        alarm[5] = 30
        state = (141 << 0)
        sprite_index = spr_golfdemon_charge
    }
}
if (state == (141 << 0))
{
    if (!fmod_event_instance_is_playing(snd))
        fmod_event_instance_play(snd)
    fmod_event_instance_set_3d_attributes(snd, x, y)
    snd_count = 0
    with (obj_golfdemon)
    {
        if (point_in_camera(x, y, view_camera[0]) && fmod_event_instance_is_playing(snd))
            other.snd_count++
    }
    fmod_event_instance_set_parameter(snd, "count", snd_count, 1)
}
else
    fmod_event_instance_stop(snd, 1)
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
if (state != (141 << 0) && state != (137 << 0))
    invincible = 0
if (state == (141 << 0))
    invincible = 1
