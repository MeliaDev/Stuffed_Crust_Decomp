if (object_index != obj_pepperman && object_index != obj_pizzafaceboss && object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p3 && object_index != obj_noiseboss && object_index != obj_pf_fakepep)
{
    if (!is_bossroom())
    {
        if (elite == 1 && elitehpinit == 0)
        {
            elitehit = (global.stylethreshold - 1)
            if (elitehit < hp)
                elitehit = hp
            elitehpinit = 1
        }
    }
    if (state == (4 << 0))
        scr_enemy_grabbed()
    else if (state == (43 << 0))
        scr_enemy_lungeattack()
    else if (state == (266 << 0))
        scr_enemy_secret()
    if (state == (4 << 0) || state == (154 << 0))
    {
        persistent = 1
        if (!madepersistent)
            madepersistent = 1
    }
    else
        persistent = 0
}
if (room == boss_pizzaface && state != (294 << 0))
    use_collision = 1
scr_squash()
if (state != (138 << 0) && state != (137 << 0))
    linethrown = 0
if (state == (138 << 0) && (!thrown))
    linethrown = 0
if elite
{
    if (!instance_exists(angryeffectid))
    {
        if (object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p3 && object_index != obj_gustavograbbable && object_index != obj_noiseboss && object_index != obj_pizzafaceboss && object_index != obj_pepperman && object_index != obj_pf_fakepep && object_index != obj_fakepepboss && object_index != obj_pizzaball && object_index != obj_pizzaboy && object_index != obj_bigcheese)
        {
            with (instance_create(x, y, obj_angrycloud))
            {
                playerid = other.object_index
                other.angryeffectid = id
            }
        }
    }
}
if (!elite)
{
    with (angryeffectid)
        instance_destroy()
}
if (!is_bossroom())
{
    if (object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p3 && object_index != obj_gustavograbbable && object_index != obj_noiseboss && object_index != obj_pizzafaceboss && object_index != obj_pepperman && object_index != obj_pf_fakepep && object_index != obj_fakepepboss && object_index != obj_pizzaball && (place_meeting((x + 1), y, obj_spike) || place_meeting((x - 1), y, obj_spike) || place_meeting(x, (y + 1), obj_spike) || place_meeting(x, (y - 1), obj_spike)))
    {
        if elite
            elitehit = 0
        instance_destroy()
    }
}
if (state != (4 << 0) && state != (154 << 0) && object_index != obj_pepbat && object_index != obj_fakesanta && use_collision)
    scr_collide()
if (invtime > 0)
    invtime--
if (stompbuffer > 0)
    stompbuffer--
if (!thrown)
{
    if (state != (138 << 0))
    {
        if (!scr_slope())
            angle = Approach(angle, 0, 8)
        else if (!(place_meeting(x, (y + 1), obj_solid)))
        {
            with (instance_place(x, (y + 1), obj_slope))
            {
                if (abs(image_yscale) < abs(image_xscale))
                {
                    if (sign(image_xscale) == 1)
                        other.angle = Approach(other.angle, 24, 4)
                    else
                        other.angle = Approach(other.angle, -24, 4)
                }
                else if (sign(image_xscale) == 1)
                    other.angle = Approach(other.angle, 32, 4)
                else
                    other.angle = Approach(other.angle, -32, 4)
            }
        }
        else
            angle = Approach(angle, 0, 8)
    }
    if (killbyenemybuffer > 0)
        killbyenemybuffer--
}
if (sprite_index == walkspr && state != (141 << 0) && floor(image_index) != (image_number - 1))
    steppy = 0
if (sprite_index == walkspr && hsp != 0 && sign(hsp) == sign(image_xscale) && grounded && vsp > 0 && floor(image_index) == (image_number - 1) && (!steppy) && object_index != obj_ghoul && state != (141 << 0))
{
    steppy = 1
    var _yy = (y + 43)
    if (object_index == obj_pizzafaceboss_p2 || object_index == obj_pizzafaceboss_p3)
        _yy = (y + 78)
    create_particle((x - (image_xscale * 20)), _yy, (1 << 0), 0)
}
if ((object_index != obj_pizzice || state != (129 << 0)) && object_index != obj_pizzafaceboss_p3 && object_index != obj_fakepepboss && state != (273 << 0))
{
    if (state == (134 << 0))
        image_speed = 0.35
    else if (state != (128 << 0))
        image_speed = 0.35
}
if (dodgebuffer > 0)
    dodgebuffer--
if (object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p3 && object_index != obj_gustavograbbable && object_index != obj_noiseboss && object_index != obj_pizzafaceboss && object_index != obj_pepperman && object_index != obj_pf_fakepep && object_index != obj_fakepepboss)
{
    if (object_index != obj_bazookabaddie || (!instance_exists(bazookaID)))
    {
        with (instance_nearest(x, y, obj_player))
        {
            if (state == (84 << 0))
            {
                other.stunned = 0
                if (other.state != (129 << 0) && (!other.provoked) && other.bombreset > 0)
                {
                    other.bombreset = 0
                    other.provoked = 1
                }
                with (other)
                {
                    if (state == (134 << 0))
                    {
                        if (x != other.x && distance_to_object(other) < 300)
                            image_xscale = sign((other.x - x))
                    }
                }
                other.scaredbuffer = 0
            }
            else if (other.state != (129 << 0))
                other.provoked = 0
        }
    }
}
if (state != (294 << 0) && object_index != obj_pepperman && object_index != obj_noiseboss && object_index != obj_pizzafaceboss && object_index != obj_pf_fakepep && object_index != obj_fakepepboss && object_index != obj_vigilanteboss && object_index != obj_pizzafaceboss_p2 && object_index != obj_pizzafaceboss_p3 && object_index != obj_noisey && object_index != obj_gustavograbbable)
{
    if (y > (room_height + 100))
        instance_destroy()
    if (thrown && (x > (room_width + 100) || x < -100 || y < -100))
        instance_destroy()
    if ((!thrown) && (x > (room_width + 400) || x < -400 || y > (room_height + 400) || y < -400))
        instance_destroy(id, false)
}
if (state != (137 << 0))
    player_instakillmove = 0
if (fmod_event_instance_is_playing(chargesnd) && state != (128 << 0))
    fmod_event_instance_stop(chargesnd)
