totem_clear(id)
var empty = totem_empty(id)
var machslidemax = 70
if empty
{
    with (obj_indiancheese)
    {
        if (empty && state == (134 << 0) && x > (other.x - 72) && x < (other.x + 72) && y > (other.y - 74) && y < (other.y + 50) && grounded)
        {
            state = (188 << 0)
            totemID = other.id
            totem_add(other.id, id)
            empty = totem_empty(other.id)
            totemdir = (x > other.x ? -1 : 1)
            image_xscale = totemdir
            sprite_index = howlspr
            image_index = 0
        }
    }
    if empty
    {
        with (obj_player)
        {
            if (distance_to_object(other) <= 280 && state == (105 << 0) && (sprite_index == spr_machslideboost || sprite_index == spr_mach3boost))
            {
                other.machslidecount++
                other.machslidebuffer = 30
                if (other.machslidecount >= machslidemax)
                    notification_push((48 << 0), [room])
            }
        }
    }
}
if (machslidebuffer > 0)
    machslidebuffer--
else
    machslidecount = 0
active = (totem_count(id) > 0 || machslidecount >= machslidemax)
if active
{
    if (!fmod_event_instance_is_playing(snd))
        fmod_event_instance_play(snd)
    if trans
    {
        if (image_index < 1)
            trans = 0
        else
            image_speed = -0.3
    }
    else
    {
        image_speed = 0.3
        if (machslidecount >= machslidemax)
            sprite_index = pepidlespr
        else
            sprite_index = idlespr
    }
}
else
{
    if fmod_event_instance_is_playing(snd)
        fmod_event_instance_stop(snd, 1)
    sprite_index = inactivespr
    if (floor(image_index) == (image_number - 1))
    {
        if global.tribecheesecensor
            trans = 1
        image_speed = 0
        image_index = (image_number - 1)
    }
}
