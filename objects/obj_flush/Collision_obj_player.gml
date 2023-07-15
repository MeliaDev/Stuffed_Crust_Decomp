if (state == (223 << 0))
{
    scr_fmod_soundeffect(global.snd_cardflip, x, y)
    state = (224 << 0)
    image_index = 0
    switch type
    {
        case 0:
            sprite_index = spr_flush_pizzatransition
            break
        case 1:
            sprite_index = spr_flush_skulltransition
            break
        case 2:
            sprite_index = spr_flush_rattransition
            break
    }

    var _found = 0
    with (obj_flush)
    {
        if (state == (223 << 0) && trigger == other.trigger)
            _found = 1
    }
    if (!_found)
    {
        var c = 0
        with (obj_flush)
        {
            if (trigger == other.trigger)
            {
                c++
                instance_destroy()
            }
        }
        with (instance_create(0, 0, obj_flushcount))
        {
            count = c
            switch other.type
            {
                case 0:
                    spr = spr_flush_pizza
                    val = 50
                    break
                case 1:
                    spr = spr_flush_skull
                    val = 100
                    break
                case 2:
                    spr = spr_flush_rat
                    val = 150
                    break
            }

            if (!instance_exists(obj_ghostcollectibles))
                notification_push((11 << 0), [room, other.type, count, val])
        }
    }
}
